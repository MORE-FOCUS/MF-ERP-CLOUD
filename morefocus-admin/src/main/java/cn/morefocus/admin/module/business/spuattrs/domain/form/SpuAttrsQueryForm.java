package cn.morefocus.admin.module.business.spuattrs.domain.form;

import cn.morefocus.base.common.domain.BaseForm;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 商品附加属性 查询表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SpuAttrsQueryForm extends BaseForm {
    private Boolean isDisabled;
    private Long spuId;
}