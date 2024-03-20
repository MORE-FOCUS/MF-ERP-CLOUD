package cn.morefocus.admin.module.business.oa.enterprise.constant;


import cn.morefocus.base.common.enumeration.BaseEnum;

/**
 * 企业类型
 *
 * @author loki
 */
public enum EnterpriseTypeEnum implements BaseEnum {

    /**
     * 有限企业
     */
    NORMAL(1, "有限企业"),

    /**
     * 外资企业
     */
    FOREIGN(2, "外资企业"),
    ;

    private Integer value;
    private String desc;

    EnterpriseTypeEnum(Integer value, String desc) {
        this.value = value;
        this.desc = desc;
    }


    @Override
    public Integer getValue() {
        return value;
    }

    @Override
    public String getDesc() {
        return desc;
    }
}
