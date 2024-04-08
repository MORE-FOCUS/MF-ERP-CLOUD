package cn.morefocus.admin.module.business.oa.enterprise.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * OA企业模块列表
 */
@Data
public class EnterpriseListVO {

    @Schema(description = "企业ID")
    private Long enterpriseId;

    @Schema(description = "企业名称")
    private String enterpriseName;
}
