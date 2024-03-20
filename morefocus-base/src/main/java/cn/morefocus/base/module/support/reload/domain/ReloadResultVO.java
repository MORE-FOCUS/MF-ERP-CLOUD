package cn.morefocus.base.module.support.reload.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * reload结果
 *
 * @author loki
 */
@Data
public class ReloadResultVO {

    @Schema(description = "加载项标签")
    private String tag;

    @Schema(description = "参数")
    private String args;

    @Schema(description = "运行结果")
    private Boolean result;

    @Schema(description = "异常")
    private String exception;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;
}
