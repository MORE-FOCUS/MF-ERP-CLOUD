package cn.morefocus.admin.module.business.supplier.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import cn.morefocus.base.common.json.serializer.BigDecimalNullZeroSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 供应商 列表VO
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SupplierVO extends BaseVO {
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 全称
     */
    private String fullName;

    /**
     * 是否默认
     */
    private Boolean isDefault;

    /**
     * 供应商编码
     */
    private String code;

    /**
     * 类别id
     */
    private Long categoryId;

    /**
     * 联系人
     */
    private String contacts;

    /**
     * 联系地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 单位电话
     */
    private String workTelephone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 微信号
     */
    private String wechat;

    /**
     * 邮编
     */
    private String postal;

    /**
     * QQ
     */
    private String qq;

    /**
     * 传真
     */
    private String tax;

    /**
     * 1-禁用 0-启用
     */
    private Boolean isDisabled;

    /**
     * 初始欠款
     */
    @JsonSerialize(using = BigDecimalNullZeroSerializer.class)
    private BigDecimal originDebt;

    /**
     * 应付欠款
     */
    @JsonSerialize(using = BigDecimalNullZeroSerializer.class)
    private BigDecimal debt;
}