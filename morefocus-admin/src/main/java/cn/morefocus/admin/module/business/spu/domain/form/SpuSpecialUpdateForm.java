package cn.morefocus.admin.module.business.spu.domain.form;

import cn.morefocus.admin.module.business.sku.domain.form.SkuForm;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 商品属性 添加表单
 */
@Data
public class SpuSpecialUpdateForm {

    @Schema(description = "商品ID")
    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    /**
     * 是否开启保质期批次
     */
    @Schema(description = "是否开启保质期批次")
    private Boolean enableShelfLife;

    /**
     * 保质期类型 1-天 2-月 3-年
     */
    private Integer shelfLifeType;

    /**
     * 保质期
     */
    private Integer shelfLifeDays;

    /**
     * 是否开启辅助属性
     */
    @Schema(description = "是否开启辅助属性")
    private Boolean enableAttr;

    /**
     * 属性
     */
    private String attrs;

    /**
     * SKU列表
     */
    private List<SkuForm> skuList;
}
