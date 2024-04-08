package cn.morefocus.admin.module.business.oa.notice.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDate;

/**
 * 通知公告 管理查询表单
 */
@Data
public class NoticeQueryForm extends PageParam {

    @Schema(description = "分类")
    private Long noticeTypeId;

    @Schema(description = "标题、作者、来源")
    private String keywords;

    @Schema(description = "文号")
    private String documentNumber;

    @Schema(description = "创建人")
    private Long createUserId;

    @Schema(description = "删除标识")
    private Boolean deleteFlag;

    @Schema(description = "创建-开始时间")
    private LocalDate createTimeBegin;

    @Schema(description = "创建-截止时间")
    private LocalDate createTimeEnd;

    @Schema(description = "发布-开始时间")
    private LocalDate publishTimeBegin;

    @Schema(description = "发布-截止时间")
    private LocalDate publishTimeEnd;

}
