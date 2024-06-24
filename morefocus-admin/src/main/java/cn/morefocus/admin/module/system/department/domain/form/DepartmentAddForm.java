package cn.morefocus.admin.module.system.department.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 部门 添加表单
 */
@Data
public class DepartmentAddForm {

    @Schema(description = "部门名称")
    @Length(min = 1, max = 50, message = "请输入正确的部门名称(1-50个字符)")
    @NotNull(message = "请输入正确的部门名称(1-50个字符)")
    private String name;

    @Schema(description = "部门编码")
    @Length(min = 1, max = 10, message = "请输入正确的部门编码(1-10个字符)")
    @NotNull(message = "请输入正确的部门编码(1-10个字符)")
    private String code;

    @Schema(description = "排序")
    @NotNull(message = "排序值")
    private Integer sortValue;

    @Schema(description = "部门负责人id")
    private Long managerId;

    @Schema(description = "上级部门id (可选)")
    private Long pid;

    @Schema(description = "是否默认")
    private Boolean isDefault;

    @Schema(description = "是否禁用")
    private Boolean isDisabled;

    @Schema(description = "类型")
    private Integer type;
}
