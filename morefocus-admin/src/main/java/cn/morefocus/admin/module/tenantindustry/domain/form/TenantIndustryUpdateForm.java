package cn.morefocus.admin.module.tenantindustry.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 租户所属行业 更新表单
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@Data
public class TenantIndustryUpdateForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}