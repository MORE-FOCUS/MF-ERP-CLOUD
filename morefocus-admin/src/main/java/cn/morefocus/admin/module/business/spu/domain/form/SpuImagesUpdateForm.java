package cn.morefocus.admin.module.business.spu.domain.form;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 商品图片 添加表单
 */
@Data
public class SpuImagesUpdateForm {

    @Schema(description = "商品ID")
    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    @Schema(description = "商品图片")
    private String images;
}
