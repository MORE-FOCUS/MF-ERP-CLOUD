package cn.morefocus.admin.module.business.goods.domain.vo;

import cn.morefocus.admin.module.business.goods.constant.GoodsStatusEnum;
import cn.morefocus.base.common.json.serializer.DictValueVoSerializer;
import cn.morefocus.base.common.swagger.SchemaEnum;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 商品
 *
 * @author loki
 */
@Data
public class GoodsVO {

    @Schema(description = "商品分类")
    private Long categoryId;

    @Schema(description = "商品名称")
    private String goodsName;

    @SchemaEnum(GoodsStatusEnum.class)
    private Integer goodsStatus;

    @Schema(description = "产地")
    @JsonSerialize(using = DictValueVoSerializer.class)
    private String place;

    @Schema(description = "商品价格")
    private BigDecimal price;

    @Schema(description = "上架状态")
    private Boolean shelvesFlag;

    @Schema(description = "备注|可选")
    private String remark;

    @Schema(description = "商品id")
    private Long goodsId;

    @Schema(description = "商品分类")
    private String categoryName;

    private LocalDateTime updateTime;

    private LocalDateTime createTime;
}
