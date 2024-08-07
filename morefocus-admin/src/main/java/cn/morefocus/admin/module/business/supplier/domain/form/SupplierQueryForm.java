package cn.morefocus.admin.module.business.supplier.domain.form;

import cn.morefocus.base.common.domain.BaseForm;
import lombok.Data;

/**
 * 供应商 查询表单
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@Data
public class SupplierQueryForm extends BaseForm {
    /**
     * 分类ID
     */
    private Long categoryId;
}