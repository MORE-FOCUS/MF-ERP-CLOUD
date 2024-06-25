package cn.morefocus.admin.module.system.department.domain.vo;

import cn.morefocus.base.common.json.serializer.DictValueVoSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 部门
 */
@Data
public class DepartmentVO {

    @Schema(description = "部门id")
    private Long id;

    @Schema(description = "部门名称")
    private String name;

    @Schema(description = "部门编码")
    private String code;

    @Schema(description = "部门负责人姓名")
    private String managerName;

    @Schema(description = "部门负责人id")
    private Long managerId;

    @Schema(description = "父级部门id")
    private Long pid;

    @Schema(description = "排序")
    private Integer sortValue;

    @Schema(description = "默认")
    private Boolean isDefault;

    @Schema(description = "禁用")
    private Boolean isDisabled;

    @Schema(description = "类别")
    @JsonSerialize(using = DictValueVoSerializer.class)
    private String type;
}
