package cn.morefocus.admin.module.business.goods.service;

import cn.morefocus.admin.module.business.category.constant.CategoryTypeEnum;
import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import cn.morefocus.admin.module.business.category.service.CategoryQueryService;
import cn.morefocus.admin.module.business.goods.constant.GoodsStatusEnum;
import cn.morefocus.admin.module.business.goods.domain.entity.GoodsEntity;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsAddForm;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsImportForm;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsQueryForm;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsUpdateForm;
import cn.morefocus.admin.module.business.goods.domain.vo.GoodsExcelVO;
import cn.morefocus.admin.module.business.goods.domain.vo.GoodsVO;
import cn.morefocus.admin.module.business.goods.mapper.GoodsMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.exception.BusinessException;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.LocalEnumUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import cn.morefocus.base.module.support.datatracer.service.DataTracerService;
import cn.morefocus.base.module.support.dict.service.DictCacheService;
import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 商品
 */
@Service
@Slf4j
public class GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    @Resource
    private CategoryQueryService categoryQueryService;

    @Resource
    private DataTracerService dataTracerService;

    @Resource
    private DictCacheService dictCacheService;

    /**
     * 添加商品
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> add(GoodsAddForm addForm) {
        // 商品校验
        R<String> res = this.checkGoods(addForm);
        if (!res.getOk()) {
            return res;
        }
        GoodsEntity goodsEntity = LocalBeanUtil.copy(addForm, GoodsEntity.class);
        goodsEntity.setDeleteFlag(Boolean.FALSE);
        goodsMapper.insert(goodsEntity);
        dataTracerService.insert(goodsEntity.getGoodsId(), DataTracerTypeEnum.GOODS);
        return R.ok();
    }

    /**
     * 更新商品
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> update(GoodsUpdateForm updateForm) {
        // 商品校验
        R<String> res = this.checkGoods(updateForm);
        if (!res.getOk()) {
            return res;
        }
        GoodsEntity originEntity = goodsMapper.selectById(updateForm.getGoodsId());
        GoodsEntity goodsEntity = LocalBeanUtil.copy(updateForm, GoodsEntity.class);
        goodsMapper.updateById(goodsEntity);
        dataTracerService.update(updateForm.getGoodsId(), DataTracerTypeEnum.GOODS, originEntity, goodsEntity);
        return R.ok();
    }

    /**
     * 添加/更新 商品校验
     */
    private R<String> checkGoods(GoodsAddForm addForm) {
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
        GoodsEntity goodsEntity = goodsMapper.selectById(goodsId);
        if (goodsEntity == null) {
            return R.userErrorParam("商品不存在");
        }

        if (!goodsEntity.getGoodsStatus().equals(GoodsStatusEnum.SELL_OUT.getValue())) {
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

        goodsMapper.batchUpdateDeleted(goodsIdList, Boolean.TRUE);
        return R.ok();
    }

    /**
     * 分页查询
     */
    public R<PageResult<GoodsVO>> query(GoodsQueryForm queryForm) {
        queryForm.setDeleteFlag(false);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<GoodsVO> list = goodsMapper.query(page, queryForm);
        PageResult<GoodsVO> pageResult = PageUtil.convert2PageResult(page, list);
        if (pageResult.getEmptyFlag()) {
            return R.ok(pageResult);
        }
        // 查询分类名称
        List<Long> categoryIdList = list.stream().map(GoodsVO::getCategoryId).distinct().collect(Collectors.toList());
        Map<Long, CategoryEntity> categoryMap = categoryQueryService.queryCategoryList(categoryIdList);
        list.forEach(e -> {
            CategoryEntity categoryEntity = categoryMap.get(e.getCategoryId());
            if (categoryEntity != null) {
                e.setCategoryName(categoryEntity.getCategoryName());
            }
        });
        return R.ok(pageResult);
    }

    /**
     * 商品导入
     *
     * @param file 上传文件
     * @return 结果
     */
    public R<String> importGoods(MultipartFile file) {
        List<GoodsImportForm> dataList;
        try {
            dataList = EasyExcel.read(file.getInputStream()).head(GoodsImportForm.class)
                    .sheet()
                    .doReadSync();
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
    public List<GoodsExcelVO> getAllGoods() {
        List<GoodsEntity> goodsEntityList = goodsMapper.selectList(null);
        return goodsEntityList.stream()
                .map(e ->
                        GoodsExcelVO.builder()
                                .goodsStatus(LocalEnumUtil.getEnumDescByValue(e.getGoodsStatus(), GoodsStatusEnum.class))
                                .categoryName(categoryQueryService.queryCategoryName(e.getCategoryId()))
                                .place(dictCacheService.selectValueNameByValueCode(e.getPlace()))
                                .price(e.getPrice())
                                .goodsName(e.getGoodsName())
                                .remark(e.getRemark())
                                .build()
                )
                .collect(Collectors.toList());

    }
}
