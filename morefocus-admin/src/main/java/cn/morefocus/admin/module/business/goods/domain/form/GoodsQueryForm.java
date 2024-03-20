package cn.morefocus.admin.module.business.goods.domain.form;

import cn.morefocus.admin.module.business.goods.constant.GoodsStatusEnum;
import cn.morefocus.base.common.domain.PageParam;
import cn.morefocus.base.common.swagger.SchemaEnum;
import cn.morefocus.base.common.validator.enumeration.CheckEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

/**
 * 商品 分页查询
 *
 * @author loki
 */
@Data
public class GoodsQueryForm extends PageParam {

    @Schema(description = "商品分类")
    private Integer categoryId;

    @Schema(description = "搜索词")
    @Length(max = 30, message = "搜索词最多30字符")
    private String searchWord;

    @SchemaEnum(GoodsStatusEnum.class)
    @CheckEnum(message = "商品状态错误", value = GoodsStatusEnum.class)
    private Integer goodsStatus;

    @Schema(description = "产地")
    private String place;

    @Schema(description = "上架状态")
    private Boolean shelvesFlag;

    @Schema(hidden = true)
    private Boolean deleteFlag;
}
