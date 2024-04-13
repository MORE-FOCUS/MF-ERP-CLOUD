package cn.morefocus.admin.module.business.tenant.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

/**
 * 租户 实体类
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_tenant")
public class TenantEntity extends BaseEntity {

    /**
     * 分类id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 代码
     */
    private String code;

    /**
     * 行业ID
     */
    private Long industryId;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String tel;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 公司地址
     */
    private String address;

    /**
     * 公司网址
     */
    private String webSite;

    /**
     * 到期时间
     */
    private LocalDate expirationDate;

    /**
     * 类型 1-试用 2-付费
     */
    private Integer type;

    /**
     * 当前套餐ID
     */
    private Long packageId;

}