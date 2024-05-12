package cn.morefocus.admin.module.business.unit.domain.form;

import lombok.Data;

/**
 * 单位 新建表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class UnitAddForm {

    /**
     * 单位名称
     */
    private String name;

    /**
     * 禁用 1-是
     */
    private Boolean isDisabled;
}