package cn.morefocus.admin.module.system.department.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 部门
 */
@Data
public class DepartmentVO {

    @Schema(description = "部门id")
    private Long deptId;

    @Schema(description = "部门名称")
    private String name;

    @Schema(description = "部门负责人姓名")
    private String managerName;

    @Schema(description = "部门负责人id")
    private Long managerId;

    @Schema(description = "父级部门id")
    private Long pid;

    @Schema(description = "排序")
    private Integer sortValue;

}
