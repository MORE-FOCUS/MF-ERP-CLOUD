package cn.morefocus.admin.module.business.sku.domain.form;

import cn.morefocus.admin.module.business.attrs.domain.form.AttrsForm;
import lombok.Data;

import java.util.List;

@Data
public class SkuForm {
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
    private List<AttrsForm> attrsList;

    /**
     * 比如:蓝色,M
     */
    private String attrsName;
}
