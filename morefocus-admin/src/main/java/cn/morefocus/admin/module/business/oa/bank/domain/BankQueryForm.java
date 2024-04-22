package cn.morefocus.admin.module.business.oa.bank.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OA办公-OA银行信息查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class BankQueryForm extends PageParam {

    @Schema(description = "企业ID")
    private Long enterpriseId;

    @Schema(description = "禁用状态")
    private Boolean isDisabled;

    @Schema(description = "删除状态", hidden = true)
    private Boolean isDeleted;
}

