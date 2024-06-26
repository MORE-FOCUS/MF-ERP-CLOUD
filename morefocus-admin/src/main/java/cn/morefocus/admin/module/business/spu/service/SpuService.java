package cn.morefocus.admin.module.business.spu.service;

import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import cn.morefocus.admin.module.business.category.constant.CategoryTypeEnum;
import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import cn.morefocus.admin.module.business.category.service.CategoryQueryService;
import cn.morefocus.admin.module.business.sku.domain.form.SkuBarcodeUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuPriceUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnConfigUpdateForm;
import cn.morefocus.admin.module.business.sku.domain.vo.*;
import cn.morefocus.admin.module.business.sku.service.*;
import cn.morefocus.admin.module.business.spu.constant.SpuStatusEnum;
import cn.morefocus.admin.module.business.spu.domain.entity.SpuEntity;
import cn.morefocus.admin.module.business.spu.domain.form.*;
import cn.morefocus.admin.module.business.spu.domain.vo.*;
import cn.morefocus.admin.module.business.spu.mapper.SpuMapper;
import cn.morefocus.admin.module.business.unit.manager.UnitManager;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.BaseVO;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.exception.BusinessException;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.LocalEnumUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import cn.morefocus.base.module.support.datatracer.service.DataTracerService;
import cn.morefocus.base.module.support.dict.service.DictCacheService;
import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 商品
 */
@Service
@Slf4j
public class SpuService {
    @Resource
    private SpuMapper spuMapper;
    @Resource
    private CategoryQueryService categoryQueryService;
    @Resource
    private DataTracerService dataTracerService;
    @Resource
    private DictCacheService dictCacheService;
    @Resource
    private SpuUnitService spuUnitService;
    @Resource
    private UnitManager unitManager;
    @Resource
    private SpuAttrsService spuAttrsService;
    @Resource
    private SkuService skuService;
    @Resource
    private SkuBarcodeService skuBarcodeService;
    @Resource
    private SkuPriceService skuPriceService;
    @Resource
    private SkuWarnConfigService skuWarnConfigService;
    @Resource
    private SkuInitialStockService skuInitialStockService;

    /**
     * 添加商品
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> addSpuBase(SpuBaseAddForm addForm) {
        // 商品校验
        R<String> res = this.checkGoods(addForm);
        if (!res.getOk()) {
            return res;
        }
        SpuEntity spuEntity = LocalBeanUtil.copy(addForm, SpuEntity.class);
        spuEntity.setIsDeleted(Boolean.FALSE);
        spuMapper.insert(spuEntity);

        //更新基础单位
        spuUnitService.updateSpuBasicUnit(spuEntity.getId(), addForm.getUnitId());

        dataTracerService.insert(spuEntity.getId(), DataTracerTypeEnum.GOODS);
        return R.ok();
    }

    /**
     * 更新商品
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuBase(SpuBaseUpdateForm updateForm) {
        // 商品校验
        R<String> res = this.checkGoods(updateForm);
        if (!res.getOk()) {
            return res;
        }

        //更新spu
        SpuEntity originEntity = spuMapper.selectById(updateForm.getId());
        SpuEntity spuEntity = LocalBeanUtil.copy(updateForm, SpuEntity.class);
        spuMapper.updateById(spuEntity);

        //更新基础单位
        spuUnitService.updateSpuBasicUnit(updateForm.getId(), updateForm.getUnitId());

        dataTracerService.update(updateForm.getId(), DataTracerTypeEnum.GOODS, originEntity, spuEntity);
        return R.ok();
    }

    /**
     * 更新商品单位
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuUnit(SpuUnitUpdateForm updateForm) {
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        spuEntity.setEnableMultiUnit(updateForm.getEnableMultiUnit());
        spuMapper.updateById(spuEntity);

        if (updateForm.getEnableMultiUnit()) {
            //开启多单位
            spuUnitService.updateSpuUnit(updateForm.getSpuId(), updateForm.getMultiUnitList());
        } else {
            //关闭多单位
            //删除非基础单位
            spuUnitService.deleteBySpuIdExcludeBasicUnit(updateForm.getSpuId());
        }
        return R.ok();
    }

    /**
     * 更新商品图片
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuImages(SpuImagesUpdateForm updateForm) {
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        spuEntity.setImage(updateForm.getImage());
        spuMapper.updateById(spuEntity);
        return R.ok();
    }

    /**
     * 更新商品属性
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuSpecial(SpuSpecialUpdateForm updateForm) {
        //更新商品属性
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        spuEntity.setShelfLifeDays(updateForm.getShelfLifeDays());
        spuEntity.setShelfLifeType(updateForm.getShelfLifeType());
        spuEntity.setEnableShelfLife(updateForm.getEnableShelfLife());
        spuEntity.setEnableAttr(updateForm.getEnableAttr());
        spuMapper.updateById(spuEntity);

        if (updateForm.getEnableAttr()) {
            //更新商品附加属性
            spuAttrsService.updateSpuAttrs(updateForm.getSpuId(), updateForm.getAttrsList());

            //更新sku
            skuService.updateSku(updateForm.getSpuId(), updateForm.getSkuList());
        }

        return R.ok();
    }

    /**
     * 更新商品条形码
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuBarcode(SkuBarcodeUpdateForm updateForm) {
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        spuEntity.setEnableBarcode(updateForm.getEnableBarcode());
        spuMapper.updateById(spuEntity);

        if (updateForm.getEnableBarcode()) {
            skuBarcodeService.updateSkuBarcode(updateForm.getSpuId(), updateForm.getBarcodeList());
        }

        return R.ok();
    }

    /**
     * 更新商品单价
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuPrice(SkuPriceUpdateForm updateForm) {
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        skuPriceService.updateSkuPrice(updateForm.getSpuId(), updateForm.getPriceList());

        return R.ok();
    }

    /**
     * 更新初始库存
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuInitialStock(SkuInitialStockUpdateForm updateForm) {
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        skuInitialStockService.updateSkuInitialStock(updateForm.getSpuId(), updateForm.getInitialStockList());

        return R.ok();
    }

    /**
     * 更新商品库存预警
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateSpuWarnConfig(SkuWarnConfigUpdateForm updateForm) {
        SpuEntity spuEntity = spuMapper.selectById(updateForm.getSpuId());
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        skuWarnConfigService.updateSkuWarnConfig(updateForm.getSpuId(), updateForm.getWarnConfigList());

        return R.ok();
    }

    /**
     * 添加/更新 商品校验
     */
    private R<String> checkGoods(SpuBaseAddForm addForm) {
        // 校验类目id
        Long categoryId = addForm.getCategoryId();
        Optional<CategoryEntity> optional = categoryQueryService.queryCategory(categoryId);
        if (!optional.isPresent() || !CategoryTypeEnum.GOODS.equalsValue(optional.get().getCategoryType())) {
            return R.error(UserErrorCode.DATA_NOT_EXIST, "商品类目不存在~");
        }

        return R.ok();
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> delete(Long goodsId) {
        SpuEntity spuEntity = spuMapper.selectById(goodsId);
        if (spuEntity == null) {
            return R.userErrorParam("商品不存在");
        }

        if (!spuEntity.getStatus().equals(SpuStatusEnum.SELL_OUT.getValue())) {
            return R.userErrorParam("只有售罄的商品才可以删除");
        }

        batchDelete(Collections.singletonList(goodsId));
        dataTracerService.batchDelete(Collections.singletonList(goodsId), DataTracerTypeEnum.GOODS);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> goodsIdList) {
        if (CollectionUtils.isEmpty(goodsIdList)) {
            return R.ok();
        }

        spuMapper.batchUpdateDeleted(goodsIdList, Boolean.TRUE);
        return R.ok();
    }

    /**
     * 分页查询
     */
    public R<PageResult<SpuVO>> query(SpuPageQueryForm queryForm) {
        queryForm.setIsDeleted(false);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SpuVO> list = spuMapper.query(page, queryForm);
        PageResult<SpuVO> pageResult = PageUtil.convert2PageResult(page, list);
        if (pageResult.getEmptyFlag()) {
            return R.ok(pageResult);
        }

        // 查询分类名称
        List<Long> categoryIdList = list.stream().map(SpuVO::getCategoryId).distinct().collect(Collectors.toList());
        Map<Long, CategoryEntity> categoryMap = categoryQueryService.queryCategoryList(categoryIdList);
        list.forEach(e -> {
            //类目
            CategoryEntity categoryEntity = categoryMap.get(e.getCategoryId());
            if (categoryEntity != null) {
                e.setCategoryName(categoryEntity.getCategoryName());
            }

            //单位
            SpuUnitVO basicUnit = spuUnitService.querySpuBasicUnit(e.getId());
            if (null != basicUnit) {
                e.setUnitId(basicUnit.getUnitId());
                e.setUnitName(basicUnit.getUnitName());
            }
        });
        return R.ok(pageResult);
    }

    /**
     * 查询 商品详情
     */
    public R<SpuVO> queryDetail(Long id) {
        SpuEntity spuEntity = spuMapper.selectById(id);
        if (null == spuEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        //基本信息
        SpuVO spuVO = LocalBeanUtil.copy(spuEntity, SpuVO.class);

        //基本单位
        SpuUnitVO basicUnit = spuUnitService.querySpuBasicUnit(id);
        if (null != basicUnit) {
            spuVO.setUnitId(basicUnit.getUnitId());
            spuVO.setUnitName(basicUnit.getUnitName());
        }

        //商品多单位
        SpuUnitQueryForm spuUnitQueryForm = new SpuUnitQueryForm();
        spuUnitQueryForm.setSpuId(id);
        spuUnitQueryForm.setIsDeleted(Boolean.FALSE);
        spuUnitQueryForm.setIsBasicUnit(Boolean.FALSE);
        List<SpuUnitVO> spuUnitVOList = spuUnitService.queryAll(spuUnitQueryForm);
        spuVO.setUnitList(spuUnitVOList);

        //辅助属性
        SpuAttrsVO spuAttrsVO = spuAttrsService.querySpuAttrs(id);
        if (null != spuAttrsVO) {
            List<SpuSelectedAttrsVo> spuSelectedAttrsVoList = JSON.parseArray(spuAttrsVO.getAttrs(), SpuSelectedAttrsVo.class);
            spuVO.setAttrsList(spuSelectedAttrsVoList);
        }

        //SKU
        List<SkuVO> skuList = skuService.querySpuSku(id);
        if (!CollectionUtils.isEmpty(skuList)) {
            //条形码
            List<SkuBarcodeVO> barcodeList = skuBarcodeService.querySpuBarcodeList(id);

            //商品单价
            List<SkuPriceVO> priceList = skuPriceService.querySkuPriceList(id);

            //商品初始库存
            List<SkuInitialStockVO> initialStockList = skuInitialStockService.querySkuInitalStockList(id);

            //商品库存预警
            List<SkuWarnConfigVO> warnConfigList = skuWarnConfigService.querySkuWarnConfigList(id);

            skuList.forEach(sku -> {
                if (StringUtils.isNotBlank(sku.getAttrs())) {
                    sku.setAttrsList(JSON.parseArray(sku.getAttrs(), AttrsVO.class));
                }

                //条形码
                if (!CollectionUtils.isEmpty(barcodeList)) {
                    sku.setBarcodeList(barcodeList.stream().filter(item -> item.getSkuId().equals(sku.getId())).sorted(Comparator.comparing(BaseVO::getSortValue)).collect(Collectors.toList()));
                }

                //商品单价
                if (!CollectionUtils.isEmpty(priceList)) {
                    sku.setPriceList(priceList.stream().filter(item -> item.getSkuId().equals(sku.getId())).sorted(Comparator.comparing(BaseVO::getSortValue)).collect(Collectors.toList()));
                }

                //初始库存
                if (!CollectionUtils.isEmpty(initialStockList)) {
                    Optional<SkuInitialStockVO> optional = initialStockList.stream().filter(item -> item.getSkuId().equals(sku.getId())).findFirst();
                    if (optional.isPresent()) {
                        sku.setInitialStock(optional.get());
                    } else {
                        SkuInitialStockVO initialStockVO = new SkuInitialStockVO();
                        initialStockVO.setSkuId(sku.getId());
                        initialStockVO.setSpuId(id);
                        initialStockVO.setQuantity(BigDecimal.ZERO);
                        initialStockVO.setPrice(BigDecimal.ZERO);
                        initialStockVO.setAmount(BigDecimal.ZERO);

                        //获取用户所选择的门店
                        initialStockVO.setStoreId(SecurityContextHolder.getSelectedStoreId());
                        sku.setInitialStock(initialStockVO);
                    }
                }

                //预警配置
                if (!CollectionUtils.isEmpty(warnConfigList)) {
                    Optional<SkuWarnConfigVO> optional = warnConfigList.stream().filter(item -> item.getSkuId().equals(sku.getId())).findFirst();
                    optional.ifPresent(sku::setSkuWarnConfig);
                }
            });
            spuVO.setSkuList(skuList);
        }

        return R.ok(spuVO);
    }

    /**
     * 商品导入
     *
     * @param file 上传文件
     * @return 结果
     */
    public R<String> importGoods(MultipartFile file) {
        List<SpuImportForm> dataList;
        try {
            dataList = EasyExcel.read(file.getInputStream()).head(SpuImportForm.class).sheet().doReadSync();
        } catch (IOException e) {
            log.error(e.getMessage(), e);
            throw new BusinessException("数据格式存在问题，无法读取");
        }

        if (CollectionUtils.isEmpty(dataList)) {
            return R.userErrorParam("数据为空");
        }

        return R.okMsg("成功导入" + dataList.size() + "条，具体数据为：" + JSON.toJSONString(dataList));
    }

    /**
     * 商品导出
     */
    public List<SpuExportVO> getAllGoods() {
        List<SpuEntity> spuEntityList = spuMapper.selectList(null);
        return spuEntityList.stream().map(e -> SpuExportVO.builder().status(LocalEnumUtil.getEnumDescByValue(e.getStatus(), SpuStatusEnum.class)).categoryName(categoryQueryService.queryCategoryName(e.getCategoryId())).place(dictCacheService.selectValueNameByValueCode(e.getPlace())).price(e.getPrice()).name(e.getName()).remark(e.getRemark()).build()).collect(Collectors.toList());

    }
}
