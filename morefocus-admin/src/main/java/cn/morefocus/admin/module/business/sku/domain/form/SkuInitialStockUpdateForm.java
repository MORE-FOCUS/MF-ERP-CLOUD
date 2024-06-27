package cn.morefocus.admin.module.business.sku.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 商品初始库存 添加表单
 */
@Data
public class SkuInitialStockUpdateForm {

    @Schema(description = "商品ID")
    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    /**
     * 条形码
     */
    private List<SkuInitialStockForm> initialStockList;
}
