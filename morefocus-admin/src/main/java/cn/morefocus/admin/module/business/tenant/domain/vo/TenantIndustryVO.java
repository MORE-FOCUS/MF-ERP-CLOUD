package cn.morefocus.admin.module.business.tenant.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
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
public class TenantIndustryVO extends BaseVO {
    private Long id;
    private String name;
    private String icon;
}