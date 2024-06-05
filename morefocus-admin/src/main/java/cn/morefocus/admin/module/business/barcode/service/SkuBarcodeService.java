package cn.morefocus.admin.module.business.barcode.service;

import cn.morefocus.admin.module.business.barcode.domain.entity.SkuBarcodeEntity;
import cn.morefocus.admin.module.business.barcode.domain.form.SkuBarcodeForm;
import cn.morefocus.admin.module.business.barcode.domain.vo.SkuBarcodeVO;
import cn.morefocus.admin.module.business.barcode.mapper.SkuBarcodeMapper;
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
public class SkuBarcodeService {

    @Resource
    private SkuBarcodeMapper skuBarcodeMapper;

    /**
     * 查询商品sku列表
     */
    public List<SkuBarcodeVO> querySpuSkuBarcode(Long spuId) {
        return skuBarcodeMapper.queryBarcodeBySpuId(spuId);
    }

    /**
     * 更新商品sku barcode
     */
    public synchronized void updateSkuBarcode(Long spuId, List<SkuBarcodeForm> skuBarcodeList) {
        List<SkuBarcodeEntity> skuEntityList = querySpuBarcodeList(spuId);
        Set<Long> updateSkuIdList = new HashSet<>();
        for (SkuBarcodeForm form : skuBarcodeList) {
            Wrapper<SkuBarcodeEntity> wrapper = new QueryWrapper<SkuBarcodeEntity>()
                    .lambda().eq(SkuBarcodeEntity::getSpuId, spuId)
                    .eq(SkuBarcodeEntity::getSkuId, form.getSkuId())
                    .eq(SkuBarcodeEntity::getBarcode, form.getBarcode());
            SkuBarcodeEntity skuBarcodeEntity = skuBarcodeMapper.selectOne(wrapper);
            if (null == skuBarcodeEntity) {
                skuBarcodeEntity = new SkuBarcodeEntity();
                skuBarcodeEntity.setSpuId(spuId);
                skuBarcodeEntity.setSkuId(form.getSkuId());
                skuBarcodeEntity.setBarcode(form.getBarcode());
                skuBarcodeMapper.insert(skuBarcodeEntity);
            } else {
                updateSkuIdList.add(skuBarcodeEntity.getId());
                skuBarcodeEntity.setBarcode(form.getBarcode());
                skuBarcodeMapper.updateById(skuBarcodeEntity);
            }
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateSkuIdList.add(item.getId())) {
                skuBarcodeMapper.deleteById(item.getId());
            }
        });
    }

    /**
     * 查询Spu属性
     */
    public List<SkuBarcodeEntity> querySpuBarcodeList(Long spuId) {
        Wrapper<SkuBarcodeEntity> wrapper = new QueryWrapper<SkuBarcodeEntity>()
                .lambda().eq(SkuBarcodeEntity::getSpuId, spuId);
        return skuBarcodeMapper.selectList(wrapper);
    }
}
