package cn.morefocus.admin.module.system.employee.mapper;

import cn.morefocus.admin.module.system.employee.domain.entity.EmployeeEntity;
import cn.morefocus.admin.module.system.employee.domain.form.EmployeeQueryForm;
import cn.morefocus.admin.module.system.employee.domain.vo.EmployeeVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;

/**
 * 员工 mapper
 */
@Mapper
@Component
public interface EmployeeMapper extends BaseMapper<EmployeeEntity> {
    /**
     * 查询员工列表
     */
    List<EmployeeVO> queryEmployee(Page page, @Param("queryForm") EmployeeQueryForm queryForm, @Param("deptIdList") List<Long> deptIdList);

    /**
     * 查询员工
     */
    List<EmployeeVO> selectEmployeeByDisabledAndDeleted(@Param("disabledFlag") Boolean disabledFlag, @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 更新单个
     */
    void updateDisableFlag(@Param("employeeId") Long employeeId, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 通过登录名查询
     */
    EmployeeEntity getByLoginName(@Param("loginName") String loginName,
                                  @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 通过姓名查询
     */
    EmployeeEntity getByActualName(@Param("actualName") String actualName,
                                   @Param("disabledFlag") Boolean disabledFlag
    );

    /**
     * 通过手机号查询
     */
    EmployeeEntity getByPhone(@Param("phone") String phone, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 获取所有员工
     */
    List<EmployeeVO> listAll();

    /**
     * 获取某个部门员工数
     */
    Integer countByDepartmentId(@Param("deptId") Long deptId);

    /**
     * 获取一批员工
     */
    List<EmployeeVO> getEmployeeByIds(@Param("employeeIds") Collection<Long> employeeIds);

    /**
     * 查询单个员工信息
     */
    EmployeeVO getEmployeeById(@Param("employeeId") Long employeeId);

    /**
     * 获取某个部门的员工
     */
    List<EmployeeEntity> selectByDepartmentId(@Param("deptId") Long deptId, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 查询某些部门下用户名是xxx的员工
     */
    List<EmployeeEntity> selectByActualName(@Param("deptIdList") List<Long> deptIdList, @Param("actualName") String actualName, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 获取某批部门的员工Id
     */
    List<Long> getEmployeeIdByDepartmentIdList(@Param("deptIds") List<Long> deptIds, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 获取所有
     */
    List<Long> getEmployeeId(@Param("leaveFlag") Boolean leaveFlag, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 获取某个部门的员工Id
     */
    List<Long> getEmployeeIdByDepartmentId(@Param("deptId") Long deptId, @Param("disabledFlag") Boolean disabledFlag);

    /**
     * 员工重置密码
     */
    Integer updatePassword(@Param("employeeId") Integer employeeId, @Param("password") String password);

}