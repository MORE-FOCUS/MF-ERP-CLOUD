package cn.morefocus.base.common.domain;

import cn.morefocus.base.common.enumeration.UserTypeEnum;

/**
 * 请求用户
 *
 *
 */
public interface RequestUser {

    /**
     * 请求用户id
     *
     * @return
     */
    Long getUserId();

    /**
     * 请求用户名称
     *
     * @return
     */
    String getUserName();

    /**
     * 获取用户类型
     */
    UserTypeEnum getUserType();

    /**
     * 获取请求的IP
     *
     * @return
     */
    String getIp();

    /**
     * 获取请求 user-agent
     *
     * @return
     */
    String getUserAgent();

}
