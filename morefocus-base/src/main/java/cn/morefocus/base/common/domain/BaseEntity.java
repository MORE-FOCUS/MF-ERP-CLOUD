package cn.morefocus.base.common.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 实体对象基类
 * 所有的实体类都需要包括该字段
 */
@Data
public class BaseEntity {
    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 创建人ID
     */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private Long createBy;

    /**
     * 创建人
     */
    @TableField(value = "create_by_name", fill = FieldFill.INSERT)
    private String createByName;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 更新人ID
     */
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    private Long updateBy;

    /**
     * 更新人名称
     */
    @TableField(value = "update_by_name", fill = FieldFill.UPDATE)
    private String updateByName;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
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
    private Boolean deleteFlag;

    /**
     * 删除时间
     */
    private LocalDateTime deleteTime;

    /**
     * 删除人ID
     */
    private Long deleteBy;

    /**
     * 删除人名称
     */
    private String deleteByName;
}
