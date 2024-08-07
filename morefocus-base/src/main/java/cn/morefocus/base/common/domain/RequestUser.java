package cn.morefocus.base.common.domain;

import cn.morefocus.base.common.enums.UserTypeEnum;

/**
 * 请求用户
 */
public interface RequestUser {

    /**
     * 请求用户id
     */
    Long getUserId();

    /**
     * 请求用户名称
     */
    String getUserName();

    /**
     * 获取用户类型
     */
    UserTypeEnum getUserType();

    /**
     * 获取请求的IP
     */
    String getIp();

    /**
     * 获取请求 user-agent
     */
    String getUserAgent();

    /**
     * 获取部门ID
     */
    Long getDeptId();

    /**
     * 获取用户选择的门店ID
     */
    Long getSelectedStoreId();
}
