package cn.morefocus.admin.module.business.oa.bank.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * OA办公-银行信息更新
 *
 * @author loki
 */
@Data
public class BankUpdateForm extends BankCreateForm {

    @Schema(description = "银行信息ID")
    @NotNull(message = "银行信息ID不能为空")
    private Long bankId;
}
