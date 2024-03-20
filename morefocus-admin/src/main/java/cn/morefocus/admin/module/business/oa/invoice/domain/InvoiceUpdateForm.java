package cn.morefocus.admin.module.business.oa.invoice.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * OA发票信息编辑
 *
 * @author loki
 */
@Data
public class InvoiceUpdateForm extends InvoiceAddForm {

    @Schema(description = "发票信息ID")
    @NotNull(message = "发票信息ID不能为空")
    private Long invoiceId;
}
