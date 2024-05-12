package cn.morefocus.admin.module.business.unit.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单位 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UnitVO extends BaseVO {

    private Long id;

    /**
     * 单位名称
     */
    private String name;

    /**
     * 是否删除 1-删除 0-未删除
     */
    private Boolean isDeleted;

    /**
     * 是否锁定 1-锁定 0-未锁定
     */
    private Boolean isLocked;

    /**
     * 禁用
     */
    private Boolean isDisabled;
}