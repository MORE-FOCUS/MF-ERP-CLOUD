package cn.morefocus.base.module.support.helpdoc.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 更新 帮助文档
 */
@Data
public class HelpDocUpdateForm extends HelpDocAddForm {

    @Schema(description = "id")
    @NotNull(message = "通知id不能为空")
    private Long helpDocId;

}
