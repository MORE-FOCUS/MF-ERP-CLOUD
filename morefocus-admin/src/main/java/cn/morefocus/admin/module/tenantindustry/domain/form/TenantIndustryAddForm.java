package cn.morefocus.admin.module.tenantindustry.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * 租户所属行业 新建表单
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@Data
public class TenantIndustryAddForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

    @NotNull(message = "更新时间 不能为空")
    private LocalDateTime updateTime;

    @NotNull(message = "是否删除 不能为空")
    private Integer deleteFlag;

    @NotNull(message = "创建时间 不能为空")
    private LocalDateTime createTime;

}