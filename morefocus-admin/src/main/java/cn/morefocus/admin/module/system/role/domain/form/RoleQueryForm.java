package cn.morefocus.admin.module.system.role.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 角色 查询
 */
@Data
public class RoleQueryForm extends PageParam {

    @Schema(description = "关键字")
    private String keywords;
}
