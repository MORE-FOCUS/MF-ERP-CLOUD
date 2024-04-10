package cn.morefocus.admin.module.tenantindustry.domain.vo;

import cn.morefocus.base.common.domain.BaseVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 租户所属行业 列表VO
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class TenantIndustryVO extends BaseVo {
    private Long id;
    private String name;
    private String icon;
}