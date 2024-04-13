package cn.morefocus.admin.module.business.tenant.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 租户 注册表单
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@Data
public class TenantRegisterForm {
    @NotNull(message = "分类id 不能为空")
    private Long id;
}