package cn.morefocus.base.module.support.securityprotect.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

/**
 * 登录失败 分页查询表单
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class LoginFailQueryForm extends PageParam {

    @Schema(description = "登录名")
    private String loginName;

    @Schema(description = "锁定状态")
    private Boolean lockFlag;

    @Schema(description = "登录失败锁定时间")
    private LocalDate loginLockBeginTimeBegin;

    @Schema(description = "登录失败锁定时间")
    private LocalDate loginLockBeginTimeEnd;

}