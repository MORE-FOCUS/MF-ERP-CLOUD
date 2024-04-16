package cn.morefocus.admin.module.business.category.domain.dto;

import cn.morefocus.admin.module.business.category.constant.CategoryTypeEnum;
import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.common.validator.enumeration.CheckEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 类目 基础属性 DTO 类
 */
@Data
public class CategoryBaseDTO {

    @Schema(description = "类目名称", required = true)
    @NotBlank(message = "类目名称不能为空")
    @Length(max = 20, message = "类目名称最多20字符")
    private String categoryName;

    @SchemaEnum(desc = "分类类型", value = CategoryTypeEnum.class)
    @CheckEnum(value = CategoryTypeEnum.class, required = true, message = "分类错误")
    private Integer categoryType;

    @Schema(description = "父级类目id|可选")
    private Long pid;

    @Schema(description = "排序|可选")
    private Integer sortValue;

    @Schema(description = "备注|可选")
    @Length(max = 200, message = "备注最多200字符")
    private String remark;

    @Schema(description = "禁用状态")
    @NotNull(message = "禁用状态不能为空")
    private Boolean isDisabled;
}
