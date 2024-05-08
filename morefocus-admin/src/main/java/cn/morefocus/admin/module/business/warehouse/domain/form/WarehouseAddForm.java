package cn.morefocus.admin.module.business.warehouse.domain.form;

import lombok.Data;

/**
 * 仓库 新建表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class WarehouseAddForm {
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
}