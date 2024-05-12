package cn.morefocus.admin.module.business.spu.domain.form;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品 导入表单
 */
@Data
public class SpuImportForm {

    @ExcelProperty("商品分类")
    private String categoryName;

    @ExcelProperty("商品名称")
    private String name;

    @ExcelProperty("商品状态")
    private String status;

    @ExcelProperty("产地")
    private String place;

    @ExcelProperty("商品价格")
    private BigDecimal price;

    @ExcelProperty("备注")
    private String remark;
}
