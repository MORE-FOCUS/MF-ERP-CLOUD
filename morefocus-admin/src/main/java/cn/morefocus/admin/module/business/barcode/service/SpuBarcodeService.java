package cn.morefocus.admin.module.business.barcode.service;

import cn.morefocus.admin.module.business.barcode.domain.entity.SpuBarcodeEntity;
import cn.morefocus.admin.module.business.barcode.domain.form.SpuBarcodeForm;
import cn.morefocus.admin.module.business.barcode.domain.vo.SpuBarcodeVO;
import cn.morefocus.admin.module.business.barcode.manager.SpuBarcodeManager;
import cn.morefocus.admin.module.business.barcode.mapper.SpuBarcodeMapper;
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
public class SpuBarcodeService {

    @Resource
    private SpuBarcodeMapper spuBarcodeMapper;
    @Resource
    private SpuBarcodeManager spuBarcodeManager;

    /**
     * 查询商品sku列表
     */
    public List<SpuBarcodeVO> querySpuBarcodeList(Long spuId) {
        return spuBarcodeManager.querySpuBarcodeList(spuId);
    }

    /**
     * 更新商品sku barcode
     */
    public synchronized void updateSkuBarcode(Long spuId, List<SpuBarcodeForm> skuBarcodeList) {
        Wrapper<SpuBarcodeEntity> spuBarcodeEntityWrapper = new QueryWrapper<SpuBarcodeEntity>()
                .lambda().eq(SpuBarcodeEntity::getSpuId, spuId);
        List<SpuBarcodeEntity> skuEntityList = spuBarcodeMapper.selectList(spuBarcodeEntityWrapper);
        Set<Long> updateBarcodeIdList = new HashSet<>();
        for (SpuBarcodeForm form : skuBarcodeList) {
            Wrapper<SpuBarcodeEntity> wrapper = new QueryWrapper<SpuBarcodeEntity>()
                    .lambda().eq(SpuBarcodeEntity::getSpuId, spuId)
                    .eq(SpuBarcodeEntity::getSkuId, form.getSkuId())
                    .eq(SpuBarcodeEntity::getBarcode, form.getBarcode());
            SpuBarcodeEntity skuBarcodeEntity = spuBarcodeMapper.selectOne(wrapper);
            if (null == skuBarcodeEntity) {
                skuBarcodeEntity = new SpuBarcodeEntity();
                skuBarcodeEntity.setSpuId(spuId);
                skuBarcodeEntity.setSkuId(form.getSkuId());
                skuBarcodeEntity.setBarcode(form.getBarcode());
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
