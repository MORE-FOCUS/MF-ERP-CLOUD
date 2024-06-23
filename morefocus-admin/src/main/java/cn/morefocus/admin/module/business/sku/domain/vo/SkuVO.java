package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import lombok.Data;

import java.util.List;

/**
 * SKU 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SkuVO {
    private Long id;
    /**
     * 编码
     */
    private String skuNo;

    /**
     * 名称 蓝色M衬衫
     */
    private String skuName;

    /**
     * 属性
     */
    private String attrs;

    /**
     * 属性
     */
    private List<AttrsVO> attrsList;

    /**
     * 比如:蓝色,M
     */
    private String attrsName;

    /**
     * 条形码
     */
    private List<SkuBarcodeVO> barcodeList;

    /**
     * 单价
     */
    private List<SkuPriceVO> priceList;
}