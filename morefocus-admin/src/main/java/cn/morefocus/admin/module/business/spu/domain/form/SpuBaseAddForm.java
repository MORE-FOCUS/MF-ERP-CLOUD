package cn.morefocus.admin.module.business.spu.domain.form;

import cn.morefocus.admin.module.business.spu.constant.SpuStatusEnum;
import cn.morefocus.base.common.json.deserializer.DictValueVoDeserializer;
import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.common.validator.enumeration.CheckEnum;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 商品 添加表单
 */
@Data
public class SpuBaseAddForm {

    @Schema(description = "商品分类")
    @NotNull(message = "商品分类不能为空")
    private Long categoryId;

    @Schema(description = "商品名称")
    @NotBlank(message = "商品名称不能为空")
    private String name;

    @Schema(description = "商品别名")
    private String alias;

    @SchemaEnum(SpuStatusEnum.class)
    @CheckEnum(message = "商品状态错误", value = SpuStatusEnum.class, required = true)
    private Integer status;

    @Schema(description = "产地")
    @NotBlank(message = "产地 不能为空 ")
    @JsonDeserialize(using = DictValueVoDeserializer.class)
    private String place;

    @Schema(description = "上架状态")
    @NotNull(message = "上架状态不能为空")
    private Boolean isListed;

    @Schema(description = "备注|可选")
    private String remark;

    /**
     * 编码
     */
    @NotBlank(message = "编码不能为空")
    private String spuNo;

    /**
     * 规格
     */
    private String specs;

    /**
     * 品牌ID
     */
    private Long brandId;

    /**
     * 是否禁用
     */
    private Boolean isDisabled;

    /**
     * 单位
     */
    private List<SpuUnitForm> unitList;
}
