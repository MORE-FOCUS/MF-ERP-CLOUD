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
    @Schema(description = "分类ID")
    private Long categoryId;

    @Schema(description = "分类名称")
    private String categoryName;

    @Schema(description = "分类编码")
    private String categoryCode;

    @SchemaEnum(desc = "分类类型", value = CategoryTypeEnum.class)
    private Integer categoryType;

    @Schema(description = "父级类目id|可选")
    private Long pid;

    @Schema(description = "禁用状态")
    private Boolean isDisabled;

    @Schema(description = "默认状态")
    private Boolean isDefault;
}
