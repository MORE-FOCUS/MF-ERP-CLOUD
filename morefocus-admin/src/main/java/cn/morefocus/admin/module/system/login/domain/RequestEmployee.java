package cn.morefocus.admin.module.system.login.domain;

import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.enumeration.GenderEnum;
import cn.morefocus.base.common.enumeration.UserTypeEnum;
import cn.morefocus.base.common.swagger.SchemaEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 请求员工登录信息
 */
@Data
public class RequestEmployee implements RequestUser {

    @Schema(description = "员工id")
    private Long employeeId;

    @SchemaEnum(UserTypeEnum.class)
    private UserTypeEnum userType;

    @Schema(description = "登录账号")
    private String loginName;

    @Schema(description = "员工名称")
    private String actualName;

    @SchemaEnum(GenderEnum.class)
    private Integer gender;

    @Schema(description = "手机号码")
    private String phone;

    @Schema(description = "部门id")
    private Long deptId;

    @Schema(description = "部门名称")
    private String deptName;

    @Schema(description = "是否为超管")
    private Boolean administratorFlag;

    @Schema(description = "请求ip")
    private String ip;

    @Schema(description = "请求user-agent")
    private String userAgent;

    @Override
    public Long getUserId() {
        return employeeId;
    }

    @Override
    public String getUserName() {
        return actualName;
    }

    @Override
    public Long getDeptId() {
        return deptId;
    }
}
