package cn.morefocus.admin.module.business.bill.domain.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 单据 更新表单
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BillUpdateForm extends BillAddForm {
    @NotNull(message = "分类id 不能为空")
    private Long id;

}