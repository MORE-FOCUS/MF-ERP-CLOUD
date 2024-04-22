package cn.morefocus.admin.module.business.oa.enterprise.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OA企业模块分页查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class EnterpriseQueryForm extends PageParam {
    @Schema(description = "禁用状态")
    private Boolean isDisabled;

    @Schema(description = "删除状态", hidden = true)
    private Boolean isDeleted;

}
