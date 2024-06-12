package cn.morefocus.admin.module.business.tenant.domain.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 租户所属行业 更新表单
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class TenantIndustryUpdateForm extends TenantIndustryAddForm {

    @NotNull(message = "ID不能为空")
    private Long id;
}