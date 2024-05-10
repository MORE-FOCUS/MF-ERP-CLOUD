package cn.morefocus.admin.module.business.warehouse.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 仓库 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class WarehouseVO extends BaseVO {

    private Long id;

    /**
     * 编号
     */
    private String code;

    /**
     * 仓库名称
     */
    private String name;

    /**
     * 仓库类目ID
     */
    private Long categoryId;

    /**
     * 默认仓库 1-是
     */
    private Boolean isDefault;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String tel;

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