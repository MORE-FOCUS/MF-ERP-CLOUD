package cn.morefocus.admin.module.business.unit.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单位 更新表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class UnitUpdateForm extends UnitAddForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;
}