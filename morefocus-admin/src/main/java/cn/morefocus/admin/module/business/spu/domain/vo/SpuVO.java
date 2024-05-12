package cn.morefocus.admin.module.business.spu.domain.vo;

import cn.morefocus.admin.module.business.spu.constant.SpuStatusEnum;
import cn.morefocus.base.common.json.serializer.DictValueVoSerializer;
import cn.morefocus.base.common.swagger.SchemaEnum;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 商品
 */
@Data
public class SpuVO {

    @Schema(description = "商品分类")
    private Long categoryId;

    @Schema(description = "商品名称")
    private String name;

    @SchemaEnum(SpuStatusEnum.class)
    private Integer status;

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
    private Long id;

    @Schema(description = "商品分类")
    private String categoryName;

    private LocalDateTime updateTime;

    private LocalDateTime createTime;
}
