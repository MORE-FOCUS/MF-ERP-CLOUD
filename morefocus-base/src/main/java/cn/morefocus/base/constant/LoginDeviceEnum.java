package cn.morefocus.base.constant;

import cn.morefocus.base.common.enums.BaseEnum;

/**
 * 登录设备类型
 */
public enum LoginDeviceEnum implements BaseEnum {

    PC(1, "电脑端"),

    ANDROID(2, "安卓"),

    APPLE(3, "苹果"),

    H5(4, "H5"),

    WEI_XIN_MP(5, "微信小程序");

    LoginDeviceEnum(Integer value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    private final Integer value;
    private final String desc;

    @Override
    public Integer getValue() {
        return value;
    }

    @Override
    public String getDesc() {
        return desc;
    }
}
