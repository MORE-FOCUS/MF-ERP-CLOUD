package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuBarcodeEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuBarcodeForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuBarcodeVO;
import cn.morefocus.admin.module.business.sku.manager.SkuBarcodeManager;
import cn.morefocus.admin.module.business.sku.mapper.SkuBarcodeMapper;
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
    private SkuBarcodeMapper spuBarcodeMapper;
    @Resource
    private SkuBarcodeManager spuBarcodeManager;

    /**
     * 查询商品sku列表
     */
    public List<SkuBarcodeVO> querySpuBarcodeList(Long spuId) {
        return spuBarcodeManager.querySpuBarcodeList(spuId);
    }

    /**
     * 更新商品sku barcode
     */
    public synchronized void updateSkuBarcode(Long spuId, List<SkuBarcodeForm> skuBarcodeList) {
        Wrapper<SkuBarcodeEntity> spuBarcodeEntityWrapper = new QueryWrapper<SkuBarcodeEntity>()
                .lambda().eq(SkuBarcodeEntity::getSpuId, spuId);
        List<SkuBarcodeEntity> skuEntityList = spuBarcodeMapper.selectList(spuBarcodeEntityWrapper);
        Set<Long> updateBarcodeIdList = new HashSet<>();
        for (SkuBarcodeForm form : skuBarcodeList) {
            Wrapper<SkuBarcodeEntity> wrapper = new QueryWrapper<SkuBarcodeEntity>()
                    .lambda()
                    .eq(SkuBarcodeEntity::getSkuId, form.getSkuId())
                    .eq(SkuBarcodeEntity::getUnitId, form.getUnitId())
                    .eq(SkuBarcodeEntity::getBarcode, form.getBarcode());
            SkuBarcodeEntity skuBarcodeEntity = spuBarcodeMapper.selectOne(wrapper);
            if (null == skuBarcodeEntity) {
                skuBarcodeEntity = new SkuBarcodeEntity();
                skuBarcodeEntity.setSpuId(spuId);
                skuBarcodeEntity.setSkuId(form.getSkuId());
                skuBarcodeEntity.setBarcode(form.getBarcode());
                skuBarcodeEntity.setUnitId(form.getUnitId());
                skuBarcodeEntity.setUnitName(form.getUnitName());
                spuBarcodeMapper.insert(skuBarcodeEntity);
            } else {
                updateBarcodeIdList.add(skuBarcodeEntity.getId());
                skuBarcodeEntity.setBarcode(form.getBarcode());
                spuBarcodeMapper.updateById(skuBarcodeEntity);
            }
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateBarcodeIdList.add(item.getId())) {
                spuBarcodeMapper.deleteById(item.getId());
            }
        });

        spuBarcodeManager.removeCache(spuId);
    }
}
