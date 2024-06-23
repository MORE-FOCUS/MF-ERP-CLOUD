package cn.morefocus.admin.module.business.store.domain.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * 门店 更新表单
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class StoreUpdateForm extends StoreAddForm {
    @NotNull(message = "ID不能为空")
    private Long id;
}