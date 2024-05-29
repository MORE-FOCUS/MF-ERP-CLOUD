package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.form.SkuForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * SKU Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class SkuService {

    @Resource
    private SkuMapper skuMapper;

    /**
     * 查询商品sku列表
     */
    public List<SkuVO> querySpuSku(Long spuId) {
        return skuMapper.querySkuBySpuId(spuId);
    }

    /**
     * 更新商品sku
     */
    public void updateSku(List<SkuForm> skuList) {

    }
}
