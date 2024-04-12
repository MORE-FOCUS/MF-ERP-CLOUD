package cn.morefocus.base.common.util;

import cn.morefocus.base.common.domain.RequestUser;
import lombok.extern.slf4j.Slf4j;

/**
 * 请求用户  工具类
 *
 *
 */
@Slf4j
public class RequestContext {

    private static final ThreadLocal<RequestUser> REQUEST_THREAD_LOCAL = new ThreadLocal<>();

    public static void setRequestUser(RequestUser requestUser) {
        REQUEST_THREAD_LOCAL.set(requestUser);
    }

    public static RequestUser getRequestUser() {
        return REQUEST_THREAD_LOCAL.get();
    }

    /**
     * 获取登录用户ID
     */
    public static Long getUserId() {
        RequestUser requestUser = getRequestUser();
        return null == requestUser ? null : requestUser.getUserId();
    }

    /**
     * 获取登录用户名称
     */
    public static String getUserName() {
        RequestUser requestUser = getRequestUser();
        return null == requestUser ? null : requestUser.getUserName();
    }

    public static void remove() {
        REQUEST_THREAD_LOCAL.remove();
    }
}
