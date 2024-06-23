package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuPriceEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuPriceForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuPriceVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuPriceMapper;
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
        Set<Long> updateBarcodeIdList = new HashSet<>();
        for (SkuPriceForm form : skuPriceList) {
            Wrapper<SkuPriceEntity> wrapper = new QueryWrapper<SkuPriceEntity>()
                    .lambda()
                    .eq(SkuPriceEntity::getSkuId, form.getSkuId())
                    .eq(SkuPriceEntity::getUnitId, form.getUnitId());
            SkuPriceEntity skuBarcodeEntity = skuPriceMapper.selectOne(wrapper);
            if (null == skuBarcodeEntity) {
                skuBarcodeEntity = new SkuPriceEntity();
                skuBarcodeEntity.setSpuId(spuId);
                skuBarcodeEntity.setSkuId(form.getSkuId());
                skuBarcodeEntity.setUnitId(form.getUnitId());
                skuBarcodeEntity.setUnitName(form.getUnitName());
                skuPriceMapper.insert(skuBarcodeEntity);
            } else {
                updateBarcodeIdList.add(skuBarcodeEntity.getId());
                skuPriceMapper.updateById(skuBarcodeEntity);
            }
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateBarcodeIdList.add(item.getId())) {
                skuPriceMapper.deleteById(item.getId());
            }
        });
    }
}
