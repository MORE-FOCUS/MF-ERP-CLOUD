package cn.morefocus.base.module.support.dict.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

/**
 * 字典
 *
 * @author loki
 */
@Data
public class DictKeyAddForm {

    @Schema(description = "编码")
    @NotBlank(message = "编码不能为空")
    @Length(max = 50, message = "编码太长了，不能超过50字符")
    private String keyCode;

    @Schema(description = "名称")
    @NotBlank(message = "名称不能为空")
    @Length(max = 50, message = "名称太长了，不能超过50字符")
    private String keyName;

    @Schema(description = "备注")
    @Length(max = 500, message = "备注太长了")
    private String remark;
}