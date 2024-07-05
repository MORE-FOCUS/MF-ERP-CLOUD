package cn.morefocus.admin.module.business.billdetail.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单据操作记录
 * 新建表单
 *
 * @author loki
 * @date 2024-07-04 23:57:01
 */
@Data
public class BillDetailOperateLogAddForm {
    @NotNull(message = "操作类型 1-制单 2-审核 3-反审核 4-对单 5-撤销对单 6-锁定 7-解锁 不能为空")
    private Integer operateType;
}