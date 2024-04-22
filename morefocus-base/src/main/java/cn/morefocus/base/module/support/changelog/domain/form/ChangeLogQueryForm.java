package cn.morefocus.base.module.support.changelog.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.common.validator.enumeration.CheckEnum;
import cn.morefocus.base.module.support.changelog.constant.ChangeLogTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统更新日志 查询
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class ChangeLogQueryForm extends PageParam {

    @SchemaEnum(value = ChangeLogTypeEnum.class, desc = "更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]")
    @CheckEnum(value = ChangeLogTypeEnum.class, message = "更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复] 错误")
    private Integer type;

    @Schema(description = "跳转链接")
    private String link;

}