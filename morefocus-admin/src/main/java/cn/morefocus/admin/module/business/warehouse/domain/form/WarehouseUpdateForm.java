package cn.morefocus.admin.module.business.warehouse.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 仓库 更新表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class WarehouseUpdateForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

}