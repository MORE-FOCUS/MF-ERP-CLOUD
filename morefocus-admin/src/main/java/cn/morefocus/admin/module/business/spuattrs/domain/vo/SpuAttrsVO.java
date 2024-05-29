package cn.morefocus.admin.module.business.spuattrs.domain.vo;

import lombok.Data;

/**
 * 商品附加属性 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SpuAttrsVO {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 属性
     */
    private String attrs;
}