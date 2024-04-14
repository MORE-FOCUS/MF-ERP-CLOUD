package cn.morefocus.base.common.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 定时任务级别的错误码
 */
@Getter
@AllArgsConstructor
public enum QuartzErrorCode implements ErrorCode {

    DATA_NOT_EXIST(40001, "数据不存在"),
    ;

    private final int code;

    private final String msg;

    private final String level;

    QuartzErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
        this.level = LEVEL_USER;
    }
}
