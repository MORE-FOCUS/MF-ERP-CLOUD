package cn.morefocus.base.module.support.securityprotect.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 登录失败记录
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@TableName("t_login_fail")
public class LoginFailEntity extends BaseEntity {


    @TableId(type = IdType.AUTO)
    private Long loginFailId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 用户类型
     */
    private Integer userType;

    /**
     * 登录名
     */
    private String loginName;

    /**
     * 锁定状态
     */
    private Boolean lockFlag;

    /**
     * 登录失败次数
     */
    private Integer loginFailCount;

    /**
     * 连续登录失败锁定开始时间
     */
    private LocalDateTime loginLockBeginTime;
}
