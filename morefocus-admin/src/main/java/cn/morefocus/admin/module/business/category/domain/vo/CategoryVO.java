package cn.morefocus.admin.module.business.category.domain.vo;

import cn.morefocus.admin.module.business.category.constant.CategoryTypeEnum;
import cn.morefocus.base.common.domain.BaseVO;
import cn.morefocus.base.common.swagger.SchemaEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 类目
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class CategoryVO extends BaseVO {
    @Schema(description = "类目id")
    private Long categoryId;

    @Schema(description = "类目名称")
    private String categoryName;

    @SchemaEnum(desc = "分类类型", value = CategoryTypeEnum.class)
    private Integer categoryType;

    @Schema(description = "父级类目id|可选")
    private Long pid;

    @Schema(description = "禁用状态")
    private Boolean isDisabled;
}
