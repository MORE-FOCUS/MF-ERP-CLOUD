package cn.morefocus.admin.module.business.oa.enterprise.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 查询企业员工
 */
@Data
public class EnterpriseEmployeeQueryForm extends PageParam {

    @Schema(description = "搜索词")
    @Length(max = 20, message = "搜索词最多20字符")
    private String keyword;

    @Schema(description = "公司Id")
    @NotNull(message = "公司id 不能为空")
    private Long enterpriseId;

    @Schema(description = "删除标识", hidden = true)
    private Boolean deleteFlag;

}
