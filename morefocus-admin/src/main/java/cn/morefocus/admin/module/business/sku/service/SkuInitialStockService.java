package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuInitialStockEntity;
import cn.morefocus.admin.module.business.sku.domain.entity.SkuStockEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuInitialStockVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuInitialStockMapper;
import cn.morefocus.admin.module.business.sku.mapper.SkuStockDetailMapper;
import cn.morefocus.admin.module.business.sku.mapper.SkuStockMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 商品初始库存 Service
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@Service
public class SkuInitialStockService {

    @Resource
    private SkuInitialStockMapper skuInitialStockMapper;
    @Resource
    private SkuStockMapper skuStockMapper;
    @Resource
    private SkuStockDetailMapper skuStockDetailMapper;

    /**
     * 分页查询
     */
    public PageResult<SkuInitialStockVO> queryPage(SkuInitialStockQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuInitialStockVO> list = skuInitialStockMapper.queryPage(page, queryForm);
        PageResult<SkuInitialStockVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuInitialStockVO> queryAll() {
        List<SkuInitialStockVO> list = skuInitialStockMapper.queryAll();
        return list;
    }

    /**
     * 查询商品sku单价列表
     */
    public List<SkuInitialStockVO> querySkuInitalStockList(Long spuId) {
        return skuInitialStockMapper.querySkuInitalStockList(spuId);
    }

    /**
     * 更新商品初始库存
     */
    public void updateSkuInitialStock(Long spuId, List<SkuInitialStockForm> stockList) {
        Wrapper<SkuInitialStockEntity> spuInitialStockEntityWrapper = new QueryWrapper<SkuInitialStockEntity>()
                .lambda().eq(SkuInitialStockEntity::getSpuId, spuId);
        List<SkuInitialStockEntity> skuEntityList = skuInitialStockMapper.selectList(spuInitialStockEntityWrapper);
        Set<Long> updateIdList = new HashSet<>();
        for (SkuInitialStockForm form : stockList) {
            Wrapper<SkuInitialStockEntity> wrapper = new QueryWrapper<SkuInitialStockEntity>()
                    .lambda()
                    .eq(SkuInitialStockEntity::getSkuId, form.getSkuId())
                    .eq(SkuInitialStockEntity::getUnitId, form.getUnitId());
            SkuInitialStockEntity skuInitialStockEntity = skuInitialStockMapper.selectOne(wrapper);
            if (null == skuInitialStockEntity) {
                skuInitialStockEntity = LocalBeanUtil.copy(form, SkuInitialStockEntity.class);
                skuInitialStockEntity.setSpuId(spuId);
                skuInitialStockMapper.insert(skuInitialStockEntity);
            } else {
                updateIdList.add(skuInitialStockEntity.getId());
                LocalBeanUtil.copyProperties(form, skuInitialStockEntity);
                skuInitialStockMapper.updateById(skuInitialStockEntity);
            }

            //生成初始库存记录
            SkuStockEntity skuStockEntity = new SkuStockEntity();
            skuStockMapper.insert(skuStockEntity);
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateIdList.add(item.getId())) {
                skuInitialStockMapper.deleteById(item.getId());
            }
        });
    }
}
