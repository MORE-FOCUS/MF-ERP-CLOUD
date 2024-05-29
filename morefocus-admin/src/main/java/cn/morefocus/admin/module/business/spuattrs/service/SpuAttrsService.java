package cn.morefocus.admin.module.business.spuattrs.service;

import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsForm;
import cn.morefocus.admin.module.business.spuattrs.domain.vo.SpuAttrsVO;
import cn.morefocus.admin.module.business.spuattrs.mapper.SpuAttrsMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 商品附加属性 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class SpuAttrsService {

    @Resource
    private SpuAttrsMapper spuAttrsMapper;

    /**
     * 查询所有
     */
    public SpuAttrsVO querySpuAttrs(Long spuId) {
        return spuAttrsMapper.querySpuAttrs(spuId);
    }

    /**
     * 更新商品属性
     */
    public void updateSpuAttrs(SpuAttrsForm form) {

    }
}
