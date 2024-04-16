package cn.morefocus.admin.module.business.supplier.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 供应商 更新表单
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@Data
public class SupplierUpdateForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}