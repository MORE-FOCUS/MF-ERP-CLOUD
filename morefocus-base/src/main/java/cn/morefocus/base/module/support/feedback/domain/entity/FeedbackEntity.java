package cn.morefocus.base.module.support.feedback.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 意见反馈 表
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_feedback")
public class FeedbackEntity extends BaseEntity {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long feedbackId;

    /**
     * 反馈内容
     */
    private String feedbackContent;

    /**
     * 反馈附件
     */
    private String feedbackAttachment;

    /**
     * 创建人id
     */
    private Long userId;

    /**
     * 用户类型
     */
    private Integer userType;

    /**
     * 创建人姓名
     */
    private String userName;
}