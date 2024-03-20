package cn.morefocus.admin.module.business.oa.notice.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 浏览记录 VO
 *
 * @author loki
 */
@Data
public class NoticeViewRecordVO {

    @Schema(description = "员工ID")
    private Long employeeId;

    @Schema(description = "员工姓名")
    private String employeeName;

    @Schema(description = "员工部门名称")
    private String departmentName;

    @Schema(description = "查看次数")
    private Integer pageViewCount;

    @Schema(description = "首次ip")
    private String firstIp;

    @Schema(description = "首次用户设备等标识")
    private String firstUserAgent;

    @Schema(description = "首次查看时间")
    private LocalDateTime createTime;

    @Schema(description = "最后一次 ip")
    private String lastIp;

    @Schema(description = "最后一次 用户设备等标识")
    private String lastUserAgent;

    @Schema(description = "最后一次查看时间")
    private LocalDateTime updateTime;
}
