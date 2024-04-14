package cn.morefocus.base.common.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 未预期的错误码（即发生了不可能发生的事情，此类返回码应该高度重视）
 */
@Getter
@AllArgsConstructor
public enum UnexpectedErrorCode implements ErrorCode {

    /**
     * 业务错误
     */
    BUSINESS_HANDING(20001, "业务繁忙，请稍后重试"),
    ;

    private final int code;

    private final String msg;

    private final String level;

    UnexpectedErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
        this.level = LEVEL_UNEXPECTED;
    }

}

