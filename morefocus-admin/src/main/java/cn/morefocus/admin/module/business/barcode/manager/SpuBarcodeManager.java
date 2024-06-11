package cn.morefocus.admin.module.business.barcode.manager;

import cn.morefocus.admin.constant.AdminCacheConst;
import cn.morefocus.admin.module.business.barcode.domain.entity.SpuBarcodeEntity;
import cn.morefocus.admin.module.business.barcode.domain.vo.SpuBarcodeVO;
import cn.morefocus.admin.module.business.barcode.mapper.SpuBarcodeMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品条形码  Manager
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Slf4j
@Service
public class SpuBarcodeManager extends ServiceImpl<SpuBarcodeMapper, SpuBarcodeEntity> {
    /**
     * 根据id 移除缓存
     */
    @CacheEvict(value = {AdminCacheConst.BARCODE.SPU_BARCODE}, allEntries = true)
    public void removeCache(Long spuId) {
        log.info("clear SPU_BARCODE");
    }

    /**
     * 查询商品条形码
     */
    @Cacheable(AdminCacheConst.BARCODE.SPU_BARCODE)
    public List<SpuBarcodeVO> querySpuBarcodeList(Long spuId) {
        return this.baseMapper.queryBarcodeBySpuId(spuId);
    }
}
