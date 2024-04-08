package cn.morefocus.admin.module.business.oa.notice.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

/**
 * 通知公告类型
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_notice_type")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeTypeEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long noticeTypeId;

    /**
     * 名称
     */
    private String noticeTypeName;
}
