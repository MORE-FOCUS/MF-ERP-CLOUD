package cn.morefocus.admin.module.business.tenant.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 租户所属行业 实体类
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_tenant_industry")
public class TenantIndustryEntity extends BaseEntity {

    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 图标
     */
    private String icon;

    /**
     * 是否被禁用
     * 0-否
     * 1-是
     */
    private Boolean isDisabled;
}