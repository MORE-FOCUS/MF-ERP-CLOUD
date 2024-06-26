package cn.morefocus.admin.module.business.spu.domain.entity;

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
@TableName("t_spu")
public class SpuEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 商品状态:[1:预约中,2:售卖中,3:售罄]
     */
    private Integer status;

    /**
     * 商品分类
     */
    private Long categoryId;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品别名
     */
    private String alias;

    /**
     * 产地
     */
    private String place;

    /**
     * 商品价格
     */
    private BigDecimal price;

    /**
     * 编码
     */
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
     * 是否开启保质期批次
     */
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
    private Boolean enableAttr;

    /**
     * 是否开启多单位
     */
    private Boolean enableMultiUnit;

    /**
     * 是否开启条形码
     */
    private Boolean enableBarcode;

    /**
     * 是否开启库存预警
     */
    private Boolean enableStockWarn;

    /**
     * 是否禁用
     */
    private Boolean isDisabled;

    /**
     * 图片
     */
    private String image;

    /**
     * 是否上架
     */
    private Boolean isListed;

    /**
     * 默认供应商
     */
    private Long supplierId;

    /**
     * 首选仓库
     */
    private Long warehouseId;

    /**
     * 是否常用 true-常用 false-不是常用 默认false
     */
    private Boolean common;
}
