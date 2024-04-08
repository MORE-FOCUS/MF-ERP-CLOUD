package cn.morefocus.admin.module.business.oa.bank.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import cn.morefocus.base.module.support.datatracer.annoation.DataTracerFieldLabel;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OA办公-OA银行信息
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_oa_bank")
public class BankEntity extends BaseEntity {

    /**
     * 银行信息ID
     */
    @TableId(type = IdType.AUTO)
    @DataTracerFieldLabel("银行信息ID")
    private Long bankId;

    /**
     * 开户银行
     */
    @DataTracerFieldLabel("开户银行")
    private String bankName;

    /**
     * 账户名称
     */
    @DataTracerFieldLabel("账户名称")
    private String accountName;

    /**
     * 账号
     */
    @DataTracerFieldLabel("账号")
    private String accountNumber;

    /**
     * 备注
     */
    @DataTracerFieldLabel("备注")
    private String remark;

    /**
     * 是否对公
     */
    @DataTracerFieldLabel("是否对公")
    private Boolean businessFlag;

    /**
     * 企业ID
     */
    private Long enterpriseId;

    /**
     * 禁用状态
     */
    @DataTracerFieldLabel("禁用状态")
    private Boolean disabledFlag;
}
