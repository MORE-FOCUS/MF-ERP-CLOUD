package cn.morefocus.admin.module.business.spu.domain.vo;

import cn.morefocus.admin.module.business.spu.constant.SpuStatusEnum;
import cn.morefocus.base.common.domain.BaseVO;
import cn.morefocus.base.common.swagger.SchemaEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品
 */
@Data
public class SpuVO extends BaseVO {

    @Schema(description = "商品分类")
    private Long categoryId;

    @Schema(description = "商品名称")
    private String name;

    @Schema(description = "商品别名")
    private String alias;

    @SchemaEnum(SpuStatusEnum.class)
    private Integer status;

    @Schema(description = "产地")
    private String place;

    @Schema(description = "商品价格")
    private BigDecimal price;

    @Schema(description = "备注|可选")
    private String remark;

    @Schema(description = "商品id")
    private Long id;

    @Schema(description = "商品分类")
    private String categoryName;

    /**
     * 编码
     */
    @Schema(description = "编码")
    private String spuNo;

    /**
     * 规格
     */
    @Schema(description = "规格")
    private String specs;

    /**
     * 单位ID
     */
    @Schema(description = "单位")
    private Long unitId;

    /**
     * 品牌
     */
    @Schema(description = "品牌")
    private Long brandId;

    /**
     * 是否开启保质期批次
     */
    @Schema(description = "是否开启保质期批次")
    private Boolean enableShelfLife;

    /**
     * 是否开启辅助属性
     */
    @Schema(description = "是否开启辅助属性")
    private Boolean enableAttr;

    /**
     * 是否开启多单位
     */
    @Schema(description = "是否开启多单位")
    private Boolean enableMultiUnit;

    /**
     * 是否禁用
     */
    @Schema(description = "是否禁用")
    private Boolean isDisabled;

    /**
     * 主图片
     */
    private String mainPicture;

    /**
     * 附加图片,多张逗号拼接
     */
    private String attachedPicture;

    /**
     * 是否上架
     */
    @Schema(description = "上架状态")
    private Boolean isListed;
}
