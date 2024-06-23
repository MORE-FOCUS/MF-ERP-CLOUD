package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuPriceEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuPriceForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuPriceVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuPriceMapper;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * SKU 条形码 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class SkuPriceService {

    @Resource
    private SkuPriceMapper skuPriceMapper;

    /**
     * 查询商品sku单价列表
     */
    public List<SkuPriceVO> querySkuPriceList(Long spuId) {
        return skuPriceMapper.querySkuPriceBySpuId(spuId);
    }

    /**
     * 更新商品sku price
     */
    public synchronized void updateSkuPrice(Long spuId, List<SkuPriceForm> skuPriceList) {
        Wrapper<SkuPriceEntity> spuBarcodeEntityWrapper = new QueryWrapper<SkuPriceEntity>()
                .lambda().eq(SkuPriceEntity::getSpuId, spuId);
        List<SkuPriceEntity> skuEntityList = skuPriceMapper.selectList(spuBarcodeEntityWrapper);
        Set<Long> updateIdList = new HashSet<>();
        for (SkuPriceForm form : skuPriceList) {
            Wrapper<SkuPriceEntity> wrapper = new QueryWrapper<SkuPriceEntity>()
                    .lambda()
                    .eq(SkuPriceEntity::getSkuId, form.getSkuId())
                    .eq(SkuPriceEntity::getUnitId, form.getUnitId());
            SkuPriceEntity skuPriceEntity = skuPriceMapper.selectOne(wrapper);
            if (null == skuPriceEntity) {
                skuPriceEntity = LocalBeanUtil.copy(form, SkuPriceEntity.class);
                skuPriceEntity.setSpuId(spuId);
                skuPriceMapper.insert(skuPriceEntity);
            } else {
                updateIdList.add(skuPriceEntity.getId());
                LocalBeanUtil.copyProperties(form, skuPriceEntity);
                skuPriceMapper.updateById(skuPriceEntity);
            }

            //单价变化记录
            //TODO
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateIdList.add(item.getId())) {
                skuPriceMapper.deleteById(item.getId());
            }
        });
    }
}
