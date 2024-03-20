package cn.morefocus.base.module.support.file.domain.form;

import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.common.validator.enumeration.CheckEnum;
import cn.morefocus.base.module.support.file.constant.FileFolderTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * url上传文件
 *
 * @author loki
 */
@Data
public class FileUrlUploadForm {

    @SchemaEnum(value = FileFolderTypeEnum.class, desc = "业务类型")
    @CheckEnum(value = FileFolderTypeEnum.class, required = true, message = "业务类型错误")
    private Integer folder;

    @Schema(description = "文件url")
    @NotBlank(message = "文件url不能为空")
    private String fileUrl;

}
