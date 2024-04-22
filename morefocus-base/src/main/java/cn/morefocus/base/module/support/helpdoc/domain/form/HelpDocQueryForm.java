package cn.morefocus.base.module.support.helpdoc.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 帮助文档 分页查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class HelpDocQueryForm extends PageParam {

    @Schema(description = "分类")
    private Long helpDocCatalogId;
}
