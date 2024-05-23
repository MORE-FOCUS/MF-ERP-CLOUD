package cn.morefocus.admin.module.business.spuunit.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单位 分页查询表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SpuUnitPageQueryForm extends PageParam {
    private Boolean isDisabled;
    private Long spuId;
}