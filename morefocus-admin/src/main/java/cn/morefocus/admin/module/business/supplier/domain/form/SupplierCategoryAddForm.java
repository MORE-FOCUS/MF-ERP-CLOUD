package cn.morefocus.admin.module.business.supplier.domain.form;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * ERP供应商类别 新建表单
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@Data
public class SupplierCategoryAddForm {

    @NotNull(message = "分类id 不能为空")
    private Long id;

    @NotNull(message = "更新时间 不能为空")
    private LocalDateTime updateTime;

    @NotNull(message = "是否删除 不能为空")
    private Integer isDeleted;

    @NotNull(message = "创建时间 不能为空")
    private LocalDateTime createTime;

}