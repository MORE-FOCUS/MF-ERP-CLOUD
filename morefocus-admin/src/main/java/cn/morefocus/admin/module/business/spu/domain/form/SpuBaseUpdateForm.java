package cn.morefocus.admin.module.business.spu.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 商品 更新表单
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SpuBaseUpdateForm extends SpuBaseAddForm {

    @Schema(description = "商品id")
    @NotNull(message = "商品id不能为空")
    private Long id;
}
