package cn.morefocus.admin.module.system.employee.domain.form;

import cn.morefocus.base.common.domain.PageParam;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Size;
import java.util.List;

/**
 * 员工列表
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class EmployeeQueryForm extends PageParam {

    /**
     * 搜索词
     */
    @Length(max = 20, message = "搜索词最多20字符")
    private String keyword;

    /**
     * 部门id
     */
    private Long deptId;

    /**
     * 是否禁用
     */
    private Boolean disabledFlag;

    /**
     * 员工id集合
     */
    @Size(max = 99, message = "最多查询99个员工")
    private List<Long> employeeIdList;

    /**
     * 删除标识
     */
    private Boolean deleteFlag;

}
