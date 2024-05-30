package cn.morefocus.admin.module.business.attrs.domain.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 辅助属性 更新表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class AttrsUpdateForm extends AttrsAddForm {

    @NotNull(message = "属性ID不能为空")
    private Long id;
}