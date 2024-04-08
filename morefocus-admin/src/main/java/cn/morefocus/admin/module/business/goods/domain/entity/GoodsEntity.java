package cn.morefocus.admin.module.business.goods.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品 实体类
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_goods")
public class GoodsEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long goodsId;

    /**
     * 商品状态:[1:预约中,2:售卖中,3:售罄]
     */
    private Integer goodsStatus;

    /**
     * 商品分类
     */
    private Long categoryId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 产地
     */
    private String place;

    /**
     * 商品价格
     */
    private BigDecimal price;

    /**
     * 上架状态
     */
    private Boolean shelvesFlag;
}
