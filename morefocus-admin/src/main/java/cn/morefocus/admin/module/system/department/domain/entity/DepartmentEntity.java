package cn.morefocus.admin.module.system.department.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 部门实体类
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName(value = "t_department")
public class DepartmentEntity extends BaseEntity {

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 部门名称
     */
    private String name;

    /**
     * 部门编码
     */
    private String code;

    /**
     * 负责人员工 id
     */
    private Long managerId;

    /**
     * 部门父级id
     */
    private Long pid;

    /**
     * 是否默认
     */
    private Boolean isDefault;

    /**
     * 是否禁用
     */
    private Boolean isDisabled;

    /**
     * 类型 1-门店 2-组织机构
     */
    private String type;

    /**
     * 忽略字段
     */
    @TableField(exist = false)
    private Long deptId;
}
