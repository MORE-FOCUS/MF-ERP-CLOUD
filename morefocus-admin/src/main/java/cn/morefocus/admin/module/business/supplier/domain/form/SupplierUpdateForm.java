package cn.morefocus.admin.module.business.supplier.domain.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 供应商 更新表单
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SupplierUpdateForm extends SupplierAddForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}