package cn.morefocus.base.module.support.datatracer.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 查询表单
 *
 * @author loki
 */
@Data
public class DataTracerQueryForm extends PageParam {

    @SchemaEnum(DataTracerTypeEnum.class)
    private Integer type;

    @Schema(description = "业务id")
    @NotNull(message = "业务id不能为空")
    private Long dataId;

    @Schema(description = "关键字")
    private String keywords;
}
