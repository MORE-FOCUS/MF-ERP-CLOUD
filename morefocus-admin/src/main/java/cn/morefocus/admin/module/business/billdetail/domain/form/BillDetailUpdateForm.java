package cn.morefocus.admin.module.business.billdetail.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单据明细 更新表单
 *
 * @author loki
 * @date 2024-07-04 23:47:57
 */
@Data
public class BillDetailUpdateForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}