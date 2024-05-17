package cn.morefocus.admin.module.business.brand.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 品牌 更新表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class BrandUpdateForm extends BrandAddForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;
}