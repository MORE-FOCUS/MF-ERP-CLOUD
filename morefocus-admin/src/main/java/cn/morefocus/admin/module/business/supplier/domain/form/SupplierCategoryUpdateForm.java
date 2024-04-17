package cn.morefocus.admin.module.business.supplier.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * ERP供应商类别 更新表单
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@Data
public class SupplierCategoryUpdateForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}