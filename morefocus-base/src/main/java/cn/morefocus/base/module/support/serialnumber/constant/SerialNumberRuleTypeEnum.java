package cn.morefocus.base.module.support.serialnumber.constant;

import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.enums.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 单据序列号 周期
 */
@AllArgsConstructor
@Getter
public enum SerialNumberRuleTypeEnum implements BaseEnum {
    /**
     * 没有周期
     */
    NONE(StringConst.EMPTY, "", "没有周期"),
    /**
     * 年周期
     */
    YEAR("[yyyy]", "\\[yyyy\\]", "年"),
    /**
     * 月周期
     */
    MONTH("[mm]", "\\[mm\\]", "年月"),
    /**
     * 日周期
     */
    DAY("[dd]", "\\[dd\\]", "年月日");

    private final String value;

    private final String regex;

    private final String desc;
}
