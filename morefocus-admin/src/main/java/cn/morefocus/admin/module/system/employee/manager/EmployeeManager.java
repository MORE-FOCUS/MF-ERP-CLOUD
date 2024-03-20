package cn.morefocus.admin.module.system.employee.manager;


import cn.morefocus.admin.module.system.employee.mapper.EmployeeMapper;
import cn.morefocus.admin.module.system.employee.domain.entity.EmployeeEntity;
import cn.morefocus.admin.module.system.role.mapper.RoleEmployeeMapper;
import cn.morefocus.admin.module.system.role.domain.entity.RoleEmployeeEntity;
import cn.morefocus.admin.module.system.role.service.RoleEmployeeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 员工 manager
 *
 * @author loki
 */
@Service
public class EmployeeManager extends ServiceImpl<EmployeeMapper, EmployeeEntity> {

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private RoleEmployeeService roleEmployeeService;

    @Resource
    private RoleEmployeeMapper roleEmployeeMapper;

    /**
     * 保存员工
     */
    @Transactional(rollbackFor = Throwable.class)
    public void saveEmployee(EmployeeEntity employee, List<Long> roleIdList) {
        // 保存员工 获得id
        employeeMapper.insert(employee);

        if (CollectionUtils.isNotEmpty(roleIdList)) {
            List<RoleEmployeeEntity> roleEmployeeList = roleIdList.stream().map(e -> new RoleEmployeeEntity(e, employee.getEmployeeId())).collect(Collectors.toList());
            roleEmployeeService.batchInsert(roleEmployeeList);
        }
    }

    /**
     * 更新员工
     */
    @Transactional(rollbackFor = Throwable.class)
    public void updateEmployee(EmployeeEntity employee, List<Long> roleIdList) {
        // 保存员工 获得id
        employeeMapper.updateById(employee);

        if (CollectionUtils.isNotEmpty(roleIdList)) {
            List<RoleEmployeeEntity> roleEmployeeList = roleIdList.stream().map(e -> new RoleEmployeeEntity(e, employee.getEmployeeId())).collect(Collectors.toList());
            this.updateEmployeeRole(employee.getEmployeeId(), roleEmployeeList);
        }
    }

    /**
     * 更新员工角色
     */
    @Transactional(rollbackFor = Throwable.class)
    public void updateEmployeeRole(Long employeeId, List<RoleEmployeeEntity> roleEmployeeList) {

        roleEmployeeMapper.deleteByEmployeeId(employeeId);

        if (CollectionUtils.isNotEmpty(roleEmployeeList)) {
            roleEmployeeService.batchInsert(roleEmployeeList);
        }
    }

}
