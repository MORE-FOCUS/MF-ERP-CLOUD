package cn.morefocus.admin.module.business.supplier.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

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

    private String remark;

    private LocalDateTime updateTime;

    private String name;

    private Boolean isDefault;

    private String code;

    private Long categoryId;

    private String contacts;

    private String wechat;

    private String tax;

    private BigDecimal originDebt;

    private BigDecimal debt;
}