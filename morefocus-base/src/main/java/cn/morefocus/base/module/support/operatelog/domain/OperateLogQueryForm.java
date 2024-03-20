package cn.morefocus.base.module.support.operatelog.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 操作日志查询 表单
 *
 * @author loki
 */
@Data
public class OperateLogQueryForm extends PageParam {


    @Schema(description = "开始日期")
    private String startDate;

    @Schema(description = "结束日期")
    private String endDate;


    @Schema(description = "用户名称")
    private String userName;

    @Schema(description = "请求结果 false失败 true成功")
    private Boolean successFlag;

}
