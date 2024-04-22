package cn.morefocus.admin.module.business.oa.invoice.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OA发票信息查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class InvoiceQueryForm extends PageParam {

    @Schema(description = "企业ID")
    private Long enterpriseId;

    @Schema(description = "禁用状态")
    private Boolean isDisabled;

    @Schema(description = "删除状态", hidden = true)
    private Boolean isDeleted;
}
