package cn.morefocus.base.common.domain;


import cn.morefocus.base.common.code.ErrorCode;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.enums.DataTypeEnum;
import cn.morefocus.base.common.swagger.SchemaEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

/**
 * 请求返回对象
 *
 *
 */
@Data
@Schema
public class R<T> {

    public static final int OK_CODE = 0;

    public static final String OK_MSG = "操作成功";

    @Schema(description = "返回码")
    private Integer code;

    @Schema(description = "级别")
    private String level;

    private String msg;

    private Boolean ok;

    @Schema(description = "返回数据")
    private T data;

    @SchemaEnum(value = DataTypeEnum.class, desc = "数据类型")
    private Integer dataType;

    public R(Integer code, String level, boolean ok, String msg, T data) {
        this.code = code;
        this.level = level;
        this.ok = ok;
        this.msg = msg;
        this.data = data;
        this.dataType = DataTypeEnum.NORMAL.getValue();
    }

    public R(Integer code, String level, boolean ok, String msg) {
        this.code = code;
        this.level = level;
        this.ok = ok;
        this.msg = msg;
        this.dataType = DataTypeEnum.NORMAL.getValue();
    }

    public R(ErrorCode errorCode, boolean ok, String msg, T data) {
        this.code = errorCode.getCode();
        this.level = errorCode.getLevel();
        this.ok = ok;
        if (StringUtils.isNotBlank(msg)) {
            this.msg = msg;
        } else {
            this.msg = errorCode.getMsg();
        }
        this.data = data;
        this.dataType = DataTypeEnum.NORMAL.getValue();
    }

    public static <T> R<T> ok() {
        return new R<>(OK_CODE, null, true, OK_MSG, null);
    }

    public static <T> R<T> ok(T data) {
        return new R<>(OK_CODE, null, true, OK_MSG, data);
    }

    public static <T> R<T> okMsg(String msg) {
        return new R<>(OK_CODE, null, true, msg, null);
    }

    // -------------------------------------------- 最常用的 用户参数 错误码 --------------------------------------------

    public static <T> R<T> userErrorParam() {
        return new R<>(UserErrorCode.PARAM_ERROR, false, null, null);
    }


    public static <T> R<T> userErrorParam(String msg) {
        return new R<>(UserErrorCode.PARAM_ERROR, false, msg, null);
    }

    // -------------------------------------------- 错误码 --------------------------------------------

    public static <T> R<T> error(ErrorCode errorCode) {
        return new R<>(errorCode, false, null, null);
    }

    public static <T> R<T> error(ErrorCode errorCode, boolean ok) {
        return new R<>(errorCode, ok, null, null);
    }

    public static <T> R<T> error(R<?> r) {
        return new R<>(r.getCode(), r.getLevel(), r.getOk(), r.getMsg(), null);
    }

    public static <T> R<T> error(ErrorCode errorCode, String msg) {
        return new R<>(errorCode, false, msg, null);
    }

    public static <T> R<T> errorData(ErrorCode errorCode, T data) {
        return new R<>(errorCode, false, null, data);
    }


}
