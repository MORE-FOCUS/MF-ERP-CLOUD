package cn.morefocus.admin.module.business.store.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 门店 实体类
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_store")
public class StoreEntity extends BaseEntity {

    /**
     * 分类id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 是否禁用 1-禁用 0-启用
     */
    private Boolean isDisabled;

    /**
     * 排序
     */
    private Integer sortValue;

    /**
     * 备注
     */
    private String remark;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 更新人ID
     */
    private Long updateBy;

    /**
     * 更新人名称
     */
    private String updateByName;

    /**
     * 是否删除 1-删除 0-未删除
     */
    private Boolean isDeleted;

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
     * 创建人ID
     */
    private Long createBy;

    /**
     * 创建人名称
     */
    private String createByName;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 编号
     */
    private String code;

    /**
     * 名称
     */
    private String name;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String tel;

}