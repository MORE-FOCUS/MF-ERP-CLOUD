package cn.morefocus.base.common.domain;

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
    private Long createBy;

    /**
     * 创建人
     */
    private String createByName;

    /**
     * 更新人ID
     */
    private Long updateBy;

    /**
     * 更新人名称
     */
    private String updateByName;

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

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
