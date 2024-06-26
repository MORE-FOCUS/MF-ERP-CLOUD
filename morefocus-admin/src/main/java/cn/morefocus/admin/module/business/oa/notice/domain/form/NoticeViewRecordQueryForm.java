package cn.morefocus.admin.module.business.oa.notice.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 通知公告 阅读记录查询
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class NoticeViewRecordQueryForm extends PageParam {

    @Schema(description = "通知公告id")
    @NotNull(message = "通知公告id不能为空")
    private Long noticeId;

    @Schema(description = "部门id")
    private Long deptId;
}
