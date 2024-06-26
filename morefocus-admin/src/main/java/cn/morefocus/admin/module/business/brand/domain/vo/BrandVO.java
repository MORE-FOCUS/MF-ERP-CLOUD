package cn.morefocus.admin.module.business.brand.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 品牌 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BrandVO extends BaseVO {

    private Long id;

    /**
     * 品牌名称
     */
    private String name;

    /**
     * 是否锁定 1-锁定 0-未锁定
     */
    private Boolean isLocked;

}