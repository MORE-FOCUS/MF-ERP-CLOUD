package cn.morefocus.admin.module.business.bill.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单据 分页查询表单
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BillQueryForm extends PageParam {
    /**
     * 单据类型
     * 101：购货订单
     * 102：购货单
     * 103：购货退货单
     * 201：销货订单
     * 202：销货单
     * 203：销货退货单
     */
    private Integer billType;
}