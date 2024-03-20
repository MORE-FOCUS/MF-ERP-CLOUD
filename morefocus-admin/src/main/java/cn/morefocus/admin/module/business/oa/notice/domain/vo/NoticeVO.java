package cn.morefocus.admin.module.business.oa.notice.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;


/**
 * 新闻、公告  VO
 *
 * @author loki
 */
@Data
public class NoticeVO {

    @Schema(description = "id")
    private Long noticeId;

    @Schema(description = "标题")
    private String title;

    @Schema(description = "分类")
    private Long noticeTypeId;

    @Schema(description = "分类名称")
    private String noticeTypeName;

    @Schema(description = "是否全部可见")
    private Boolean allVisibleFlag;

    @Schema(description = "是否定时发布")
    private Boolean scheduledPublishFlag;

    @Schema(description = "发布状态")
    private Boolean publishFlag;

    @Schema(description = "发布时间")
    private LocalDateTime publishTime;

    @Schema(description = "作者")
    @NotBlank(message = "作者不能为空")
    private String author;

    @Schema(description = "来源")
    @NotBlank(message = "标题不能为空")
    private String source;

    @Schema(description = "文号")
    private String documentNumber;

    @Schema(description = "页面浏览量")
    private Integer pageViewCount;

    @Schema(description = "用户浏览量")
    private Integer userViewCount;

    @Schema(description = "删除标识")
    private Boolean deleteFlag;

    @Schema(description = "创建人名称")
    private String createUserName;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

    @Schema(description = "更新时间")
    private LocalDateTime updateTime;

}
