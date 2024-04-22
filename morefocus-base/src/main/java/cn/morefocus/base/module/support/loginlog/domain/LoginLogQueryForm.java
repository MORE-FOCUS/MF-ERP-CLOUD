package cn.morefocus.base.module.support.loginlog.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 登录查询日志
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class LoginLogQueryForm extends PageParam {
    @Schema(description = "用户名称")
    private String userName;

    @Schema(description = "ip")
    private String ip;
}
