package cn.morefocus.base.common.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 实体对象基类
 * 所有的实体类都需要包括该字段
 */
@Data
public class BaseEntity implements Serializable {
    /**
     * 部门ID
     */
    @TableField(fill = FieldFill.INSERT)
    private Long deptId;

    /**
     * 创建人ID
     */
    @TableField(fill = FieldFill.INSERT)
    private Long createBy;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private String createByName;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新人ID
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateBy;

    /**
     * 更新人名称
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateByName;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 排序值
     */
    private Integer sortValue;

    /**
     * 备注
     */
    private String remark;

    /**
     * 删除标识
     */
    private Boolean isDeleted;

    /**
     * 删除时间
     */
    private LocalDateTime deleteTime;
}
