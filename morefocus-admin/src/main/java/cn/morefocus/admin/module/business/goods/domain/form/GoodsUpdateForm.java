package cn.morefocus.admin.module.business.goods.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 商品 更新表单
 */
@Data
public class GoodsUpdateForm extends GoodsAddForm {

    @Schema(description = "商品id")
    @NotNull(message = "商品id不能为空")
    private Long goodsId;
}
