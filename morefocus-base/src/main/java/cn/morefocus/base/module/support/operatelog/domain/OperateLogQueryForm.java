package cn.morefocus.base.module.support.operatelog.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 操作日志查询 表单
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class OperateLogQueryForm extends PageParam {
    @Schema(description = "请求结果 false失败 true成功")
    private Boolean successFlag;
}
