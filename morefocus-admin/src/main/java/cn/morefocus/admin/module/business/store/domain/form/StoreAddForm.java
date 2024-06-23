package cn.morefocus.admin.module.business.store.domain.form;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 门店 新建表单
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Data
public class StoreAddForm {
    @NotBlank(message = "编码不能为空")
    private String code;

    @NotBlank(message = "名称不能为空")
    private String name;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String tel;
    
    @NotNull(message = "是否禁用 1-禁用 0-启用 不能为空")
    private Boolean isDisabled;
}