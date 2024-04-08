package cn.morefocus.base.module.support.feedback.domain;

import cn.morefocus.base.common.json.deserializer.FileKeyVoDeserializer;
import cn.morefocus.base.common.json.serializer.FileKeyVoSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 意见反馈 添加表单
 */
@Data
public class FeedbackAddForm {

    @Schema(description = "反馈内容")
    @NotBlank(message = "反馈内容不能为空")
    private String feedbackContent;

    @Schema(description = "反馈图片")
    @JsonSerialize(using = FileKeyVoSerializer.class)
    @JsonDeserialize(using = FileKeyVoDeserializer.class)
    private String feedbackAttachment;

}
