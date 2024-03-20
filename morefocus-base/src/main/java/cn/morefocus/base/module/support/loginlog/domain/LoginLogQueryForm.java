package cn.morefocus.base.module.support.loginlog.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 登录查询日志
 *
 * @author loki
 */
@Data
public class LoginLogQueryForm extends PageParam {

    @Schema(description = "开始日期")
    private String startDate;

    @Schema(description = "结束日期")
    private String endDate;

    @Schema(description = "用户名称")
    private String userName;

    @Schema(description = "ip")
    private String ip;

}
