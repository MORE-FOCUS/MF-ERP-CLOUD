package cn.morefocus.admin.module.business.oa.invoice.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import cn.morefocus.base.module.support.datatracer.annoation.DataTracerFieldLabel;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OA发票信息
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_oa_invoice")
public class InvoiceEntity extends BaseEntity {

    /**
     * 发票信息ID
     */
    @TableId(type = IdType.AUTO)
    private Long invoiceId;

    /**
     * 开票抬头
     */
    @DataTracerFieldLabel("开票抬头")
    private String invoiceHeads;

    /**
     * 纳税人识别号
     */
    @DataTracerFieldLabel("纳税人识别号")
    private String taxpayerIdentificationNumber;

    /**
     * 银行账户
     */
    @DataTracerFieldLabel("银行账户")
    private String accountNumber;

    /**
     * 开户行
     */
    @DataTracerFieldLabel("开户行")
    private String bankName;

    /**
     * 备注
     */
    @DataTracerFieldLabel("备注")
    private String remark;

    /**
     * 企业ID
     */
    private Long enterpriseId;

    /**
     * 禁用状态
     */
    @DataTracerFieldLabel("禁用状态")
    private Boolean isDisabled;
}
