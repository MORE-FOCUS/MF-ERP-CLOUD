package cn.morefocus.admin.module.business.spuattrs.domain.form;

import cn.morefocus.admin.module.business.sku.domain.form.SKUForm;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 商品附加属性 新建表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SpuAttrsForm {
    /**
     * spuId
     */
    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    /**
     * 属性
     */
    @NotBlank(message = "辅助属性不能为空")
    private String attrs;

    /**
     * SKU列表
     */
    private List<SKUForm> skuList;
}