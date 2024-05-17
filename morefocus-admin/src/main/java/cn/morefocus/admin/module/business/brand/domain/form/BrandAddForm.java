package cn.morefocus.admin.module.business.brand.domain.form;

import lombok.Data;

/**
 * 品牌 新建表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class BrandAddForm {

    /**
     * 名称
     */
    private String name;

    /**
     * 禁用 1-是
     */
    private Boolean isDisabled;
}