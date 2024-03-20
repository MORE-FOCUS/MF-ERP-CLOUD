package cn.morefocus.admin.util;

import cn.morefocus.admin.module.system.login.domain.RequestEmployee;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalRequestUtil;

/**
 * admin 端的请求工具类
 *
 * @author loki
 */
public final class AdminRequestUtil {


    public static RequestEmployee getRequestUser() {
        return (RequestEmployee) LocalRequestUtil.getRequestUser();
    }

    public static Long getRequestUserId() {
        RequestUser requestUser = getRequestUser();
        return null == requestUser ? null : requestUser.getUserId();
    }
}
