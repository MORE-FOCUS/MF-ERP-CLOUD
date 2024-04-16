package cn.morefocus.admin.module.business.tenant.domain.vo;

import cn.morefocus.base.common.domain.BaseVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

/**
 * 租户 列表VO
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class TenantVO extends BaseVo {

    private Long id;

    /**
     * 分类id
     */
    private Long categoryId;

    /**
     * 名称
     */
    private String name;

    /**
     * 代码
     */
    private String code;

    /**
     * 行业
     */
    private String industryName;

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

    /**
     * 禁用启用
     */
    private Boolean isDisabled;

    /**
     * 剩余天数
     */
    private Long effectiveDays;
}