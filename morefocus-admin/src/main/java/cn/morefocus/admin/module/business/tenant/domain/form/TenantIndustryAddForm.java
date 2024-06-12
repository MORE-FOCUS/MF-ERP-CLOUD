package cn.morefocus.admin.module.business.tenant.domain.form;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 租户所属行业 新建表单
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@Data
public class TenantIndustryAddForm {
    /**
     * 名称
     */
    @NotBlank(message = "行业不能为空")
    private String name;

    /**
     * 图标
     */
    @NotBlank(message = "图标不能为空")
    private String icon;

    /**
     * 是否被禁用
     * 0-否
     * 1-是
     */
    @NotNull(message = "状态不能为空")
    private Boolean isDisabled;

    /**
     * 排序
     */
    @NotNull(message = "排序不能为空")
    private Integer sortValue;
}