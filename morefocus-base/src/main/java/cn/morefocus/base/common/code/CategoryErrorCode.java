package cn.morefocus.base.common.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 类别级别的错误码
 */
@Getter
@AllArgsConstructor
public enum CategoryErrorCode implements ErrorCode {

    PARENT_NOT_EXIST(50001, "父类不存在"),
    ;

    private final int code;

    private final String msg;

    private final String level;

    CategoryErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
        this.level = LEVEL_USER;
    }
}
