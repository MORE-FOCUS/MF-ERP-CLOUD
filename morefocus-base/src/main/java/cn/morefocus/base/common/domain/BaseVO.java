package cn.morefocus.base.common.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 实体对象基类
 * 所有的实体类都需要包括该字段
 */
@Data
public class BaseVO {
    /**
     * 部门ID
     */
    @Schema(description = "部门ID")
    private Long deptId;

    /**
     * 是否删除 1-删除 0-未删除
     */
    @Schema(description = "删除状态")
    private Boolean isDeleted;

    /**
     * 禁用
     */
    @Schema(description = "禁用状态")
    private Boolean isDisabled;

//    /**
//     * 创建人ID
//     */
//    private Long createBy;
//
//    /**
//     * 创建人
//     */
//    private String createByName;
//
//    /**
//     * 更新人ID
//     */
//    private Long updateBy;
//
//    /**
//     * 更新人名称
//     */
//    private String updateByName;

    /**
     * 排序值
     */
    private Integer sortValue;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
}
