package cn.morefocus.base.module.support.changelog.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

/**
 * 系统更新日志
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_change_log")
public class ChangeLogEntity extends BaseEntity {

    /**
     * 更新日志id
     */
    @TableId(type = IdType.AUTO)
    private Long changeLogId;

    /**
     * 版本
     */
    private String version;

    /**
     * 更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]
     */
    private Integer type;

    /**
     * 发布人
     */
    private String publishAuthor;

    /**
     * 发布日期
     */
    private LocalDate publicDate;

    /**
     * 更新内容
     */
    private String content;

    /**
     * 跳转链接
     */
    private String link;
}