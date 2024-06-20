package cn.morefocus.admin.module.business.spu.domain.form;

import cn.morefocus.base.common.domain.BaseForm;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 商品单位 查询表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SpuUnitQueryForm extends BaseForm {
    private Boolean isDisabled;
    private Long spuId;
    private Boolean isBasicUnit;
}