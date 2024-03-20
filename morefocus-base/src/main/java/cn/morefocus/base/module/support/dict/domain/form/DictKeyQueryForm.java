package cn.morefocus.base.module.support.dict.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 字典
 *
 * @author loki
 */
@Data
public class DictKeyQueryForm extends PageParam {

    @Schema(description = "搜索词")
    private String searchWord;

    @Schema(description = "删除标识", hidden = true)
    private Boolean deleteFlag;
}