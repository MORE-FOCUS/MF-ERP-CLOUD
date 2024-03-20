package cn.morefocus.admin.module.business.oa.notice.domain.vo;

import cn.morefocus.admin.module.business.oa.notice.constant.NoticeVisibleRangeDataTypeEnum;
import cn.morefocus.base.common.swagger.SchemaEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 新闻、公告 可见范围数据 VO
 *
 * @author loki
 */
@Data
public class NoticeVisibleRangeVO {

    @SchemaEnum(NoticeVisibleRangeDataTypeEnum.class)
    private Integer dataType;

    @Schema(description = "员工/部门id")
    private Long dataId;

    @Schema(description = "员工/部门 名称")
    private String dataName;

}
