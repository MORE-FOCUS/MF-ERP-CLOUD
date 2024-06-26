package cn.morefocus.base.common.util;

import cn.morefocus.base.common.domain.RequestUser;
import lombok.extern.slf4j.Slf4j;

/**
 * 请求用户  工具类
 */
@Slf4j
public class SecurityContextHolder {

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

    /**
     * 获取用户部门ID
     */
    public static Long getDeptId() {
        RequestUser requestUser = getRequestUser();
        return null == requestUser ? null : requestUser.getDeptId();
    }

    /**
     * 获取用户选择的门店ID
     */
    public static Long getSelectedStoreId() {
        RequestUser requestUser = getRequestUser();
        return null == requestUser ? null : requestUser.getSelectedStoreId();
    }

    public static void remove() {
        REQUEST_THREAD_LOCAL.remove();
    }
}
