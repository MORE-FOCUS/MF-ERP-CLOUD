package cn.morefocus.admin.module.business.bill.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * 单据 列表VO
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BillVO extends BaseVO {

    /**
     * id
     */
    private Long id;

    /**
     * 单据类型
     * 101：购货订单
     * 102：购货单
     * 103：购货退货单
     * 201：销售订单
     * 202：销售单
     * 203：销售退货单
     */
    private Integer billType;

    /**
     * 单据号
     */
    private String billNo;

    /**
     * 单据日期
     */
    private LocalDate billDate;

    /**
     * 单据状态
     * 购货订单：101-未入库 102-部分入库 103-全部入库 104-已关闭
     * 销售订单： 201-未出库 202-部分出库 203-全部出库 204-已关闭
     * 购货退货单：301-未退款 302-部分退款 303-全部退款
     * 销货退货单：401-未退款 402-部分退款 403-全部退款
     */
    private Integer billState;

    /**
     * 申请人ID
     */
    private Long applicantId;

    /**
     * 申请人名称
     */
    private String applicantName;

    /**
     * 申请部门ID
     */
    private Long applicantDeptId;

    /**
     * 申请部门名称
     */
    private String applicantDeptName;

    /**
     * 单据总数量
     */
    private BigDecimal totalQuantity;

    /**
     * 单据总金额
     */
    private BigDecimal totalAmount;

    /**
     * 单据商品名称
     */
    private String totalSpuName;

    /**
     * 已经支付金额
     */
    private BigDecimal totalPaidAmount;

    /**
     * 优惠率
     */
    private BigDecimal discountRate;

    /**
     * 优惠金额
     */
    private BigDecimal discountAmount;

    /**
     * 审核状态0-未审核 1-待审核
     */
    private Integer auditState;

    /**
     * 对单状态 0-未核对 1-已核对
     */
    private Integer checkState;

    /**
     * 购货订单 1-未付款 2-部分付款 3-全部付款
     * 销货订单 1-未收款 2-部分收款 3-全部收款
     */
    private Integer payState;

    /**
     * 退货状态
     * 1-未退货 2-部分退货 3-全部退货
     */
    private Integer returnState;

    /**
     * 送货状态
     * 1-待送货
     * 2-送货完成
     */
    private Integer deliveryState;

    /**
     * 是否锁定 1-锁定 0-未锁定
     */
    private Boolean isLocked;

    /**
     * 供应商ID
     */
    private Long supplierId;

    /**
     * 供应商名称
     */
    private String supplierName;

    /**
     * 业务员人员ID
     */
    private Long salesmanId;

    /**
     * 业务人员名称
     */
    private String salesmanName;

    /**
     * 交货日期
     */
    private LocalDate deliveryDate;

    /**
     * 配送地址
     */
    private String deliveryAddress;

    /**
     * 交货方式
     * 1-快递物流
     * 2-自配送
     * 3-自提
     * 99-其他
     */
    private Integer deliveryMethod;
}