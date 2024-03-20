package cn.morefocus.base.module.support.changelog.constant;

import cn.morefocus.base.common.enumeration.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]
 *
 * @author loki
 */

@AllArgsConstructor
@Getter
public enum ChangeLogTypeEnum implements BaseEnum {

    /**
     * 重大更新
     */
    MAJOR_UPDATE(1, "重大更新"),

    /**
     * 功能更新
     */
    FUNCTION_UPDATE(2, "功能更新"),

    /**
     * Bug修复
     */
    BUG_FIX(3, "Bug修复"),

    ;

    private final Integer value;

    private final String desc;
}
