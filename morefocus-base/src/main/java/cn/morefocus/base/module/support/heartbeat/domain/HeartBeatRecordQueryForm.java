package cn.morefocus.base.module.support.heartbeat.domain;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDate;

/**
 * 心跳记录 查询
 *
 *
 */
@Data
public class HeartBeatRecordQueryForm extends PageParam {

    @Schema(description = "关键字")
    private String keywords;

    @Schema(description = "开始日期")
    private LocalDate startDate;

    @Schema(description = "结束日期")
    private LocalDate endDate;

}
