package cn.morefocus.admin.module.system.employee.domain.form;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Size;
import java.util.List;

/**
 * 员工列表
 */
@Data
public class EmployeeQueryForm {

    /**
     * 搜索词
     */
    @Length(max = 20, message = "搜索词最多20字符")
    private String keywords;

    /**
     * 部门id
     */
    private Long deptId;

    /**
     * 是否禁用
     */
    private Boolean isDisabled;

    /**
     * 员工id集合
     */
    @Size(max = 99, message = "最多查询99个员工")
    private List<Long> employeeIdList;

    /**
     * 删除标识
     */
    private Boolean isDeleted;

}
