package cn.morefocus.admin.module.business.billdetail.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单据操作记录
 * 更新表单
 *
 * @author loki
 * @date 2024-07-04 23:57:01
 */
@Data
public class BillDetailOperateLogUpdateForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}