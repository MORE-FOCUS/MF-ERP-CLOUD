package cn.morefocus.admin.module.system.department.domain.form;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;

@Data
public class DepartmentQueryForm extends BaseVO {
    /**
     * 类型
     */
    private String type;
}
