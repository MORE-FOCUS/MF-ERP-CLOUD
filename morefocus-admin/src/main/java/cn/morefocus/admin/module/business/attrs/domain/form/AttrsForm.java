package cn.morefocus.admin.module.business.attrs.domain.form;

import lombok.Data;

/**
 * 辅助属性
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class AttrsForm {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 名称
     */
    private String name;
}