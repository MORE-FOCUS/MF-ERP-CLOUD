package cn.morefocus.admin.module.business.attrs.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 辅助属性 分页查询表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class AttrsPageQueryForm extends PageParam {
    /**
     * 类目ID
     */
    private Long categoryId;
}