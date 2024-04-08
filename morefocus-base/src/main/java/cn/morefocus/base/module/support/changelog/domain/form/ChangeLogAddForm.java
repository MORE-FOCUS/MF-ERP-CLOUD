package cn.morefocus.base.module.support.changelog.domain.form;

import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.common.validator.enumeration.CheckEnum;
import cn.morefocus.base.module.support.changelog.constant.ChangeLogTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

/**
 * 系统更新日志 新建表单
 */

@Data
public class ChangeLogAddForm {

    @Schema(description = "版本", required = true)
    @NotBlank(message = "版本 不能为空")
    private String version;

    @SchemaEnum(value = ChangeLogTypeEnum.class, desc = "更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]")
    @CheckEnum(value = ChangeLogTypeEnum.class, message = "更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复] 错误", required = true)
    private Integer type;

    @Schema(description = "发布人", required = true)
    @NotBlank(message = "发布人 不能为空")
    private String publishAuthor;

    @Schema(description = "发布日期", required = true)
    @NotNull(message = "发布日期 不能为空")
    private LocalDate publicDate;

    @Schema(description = "更新内容", required = true)
    @NotBlank(message = "更新内容 不能为空")
    private String content;

    @Schema(description = "跳转链接")
    private String link;

}