package cn.morefocus.admin.module.business.spu.domain.vo;

import cn.morefocus.admin.module.business.sku.domain.vo.SkuVO;
import cn.morefocus.admin.module.business.spu.constant.SpuStatusEnum;
import cn.morefocus.base.common.domain.BaseVO;
import cn.morefocus.base.common.swagger.SchemaEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

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

    @Schema(description = "备注")
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
    @Schema(description = "单位ID")
    private Long unitId;

    /**
     * 单位名称
     */
    @Schema(description = "单位名称")
    private String unitName;

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
     * 保质期类型 1-天 2-月 3-年
     */
    @Schema(description = "保质期类型")
    private Integer shelfLifeType;

    /**
     * 保质期
     */
    @Schema(description = "保质期")
    private Integer shelfLifeDays;

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
     * 图片
     */
    private String images;

    /**
     * 是否上架
     */
    @Schema(description = "上架状态")
    private Boolean isListed;

    /**
     * 多单位
     */
    private List<SpuUnitVO> unitList;

    /**
     * 属性
     */
    private List<SpuSelectedAttrsVo> attrsList;

    /**
     * SKU列表
     */
    private List<SkuVO> skuList;

    /**
     * 开启条形码
     */
    @Schema(description = "是否开启条形码")
    private Boolean enableBarcode;
}
