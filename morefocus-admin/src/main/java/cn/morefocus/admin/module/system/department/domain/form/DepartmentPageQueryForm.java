package cn.morefocus.admin.module.system.department.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import lombok.Data;

@Data
public class DepartmentPageQueryForm extends PageParam {
    /**
     * 类型
     */
    private String type;
}
