package cn.morefocus.admin.module.business.attrs.domain.form;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 辅助属性 新建表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class AttrsAddForm {

    /**
     * 名称
     */
    @NotBlank(message = "属性名称不能为空")
    private String name;

    /**
     * 禁用 1-是
     */
    private Boolean isDisabled;

    /**
     * 分类ID
     */
    @NotNull(message = "分类ID不能为空")
    private Long categoryId;
}