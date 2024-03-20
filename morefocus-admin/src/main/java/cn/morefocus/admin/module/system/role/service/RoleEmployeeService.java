package cn.morefocus.admin.module.system.role.service;

import cn.morefocus.admin.module.system.department.mapper.DepartmentMapper;
import cn.morefocus.admin.module.system.department.domain.entity.DepartmentEntity;
import cn.morefocus.admin.module.system.employee.domain.vo.EmployeeVO;
import cn.morefocus.admin.module.system.role.mapper.RoleEmployeeMapper;
import cn.morefocus.admin.module.system.role.mapper.RoleMapper;
import cn.morefocus.admin.module.system.role.domain.entity.RoleEmployeeEntity;
import cn.morefocus.admin.module.system.role.domain.entity.RoleEntity;
import cn.morefocus.admin.module.system.role.domain.form.RoleEmployeeQueryForm;
import cn.morefocus.admin.module.system.role.domain.form.RoleEmployeeUpdateForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleSelectedVO;
import cn.morefocus.admin.module.system.role.domain.vo.RoleVO;
import cn.morefocus.admin.module.system.role.manager.RoleEmployeeManager;
import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 角色-员工
 *
 * @author loki
 */
@Service
public class RoleEmployeeService {

    @Resource
    private RoleEmployeeMapper roleEmployeeMapper;
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private RoleEmployeeManager roleEmployeeManager;


    /**
     * 批量插入
     */
    public void batchInsert(List<RoleEmployeeEntity> roleEmployeeList) {
        roleEmployeeManager.saveBatch(roleEmployeeList);
    }

    /**
     * 通过角色id，分页获取成员员工列表
     */
    public R<PageResult<EmployeeVO>> queryEmployee(RoleEmployeeQueryForm roleEmployeeQueryForm) {
        Page page = PageUtil.convert2PageQuery(roleEmployeeQueryForm);
        List<EmployeeVO> employeeList = roleEmployeeMapper.selectRoleEmployeeByName(page, roleEmployeeQueryForm)
                .stream()
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        List<Long> deptIdList = employeeList.stream().filter(e -> e != null && e.getDeptId() != null).map(EmployeeVO::getDeptId).collect(Collectors.toList());
        if (CollectionUtils.isNotEmpty(deptIdList)) {
            List<DepartmentEntity> departmentEntities = departmentMapper.selectBatchIds(deptIdList);
            Map<Long, String> deptIdNameMap = departmentEntities.stream().collect(Collectors.toMap(DepartmentEntity::getDeptId, DepartmentEntity::getName));
            employeeList.forEach(e -> {
                e.setDepartmentName(deptIdNameMap.getOrDefault(e.getDeptId(), StringConst.EMPTY));
            });
        }
        PageResult<EmployeeVO> pageResult = PageUtil.convert2PageResult(page, employeeList, EmployeeVO.class);
        return R.ok(pageResult);
    }

    public List<EmployeeVO> getAllEmployeeByRoleId(Long roleId) {
        return roleEmployeeMapper.selectEmployeeByRoleId(roleId);
    }

    /**
     * 移除员工角色
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> removeRoleEmployee(Long employeeId, Long roleId) {
        if (null == employeeId || null == roleId) {
            return R.userErrorParam();
        }
        roleEmployeeMapper.deleteByEmployeeIdRoleId(employeeId, roleId);
        return R.ok();
    }

    /**
     * 批量删除角色的成员员工
     */
    public R<String> batchRemoveRoleEmployee(RoleEmployeeUpdateForm roleEmployeeUpdateForm) {
        roleEmployeeMapper.batchDeleteEmployeeRole(roleEmployeeUpdateForm.getRoleId(), roleEmployeeUpdateForm.getEmployeeIdList());
        return R.ok();
    }

    /**
     * 批量添加角色的成员员工
     */
    public R<String> batchAddRoleEmployee(RoleEmployeeUpdateForm roleEmployeeUpdateForm) {
        Long roleId = roleEmployeeUpdateForm.getRoleId();
        List<Long> employeeIdList = roleEmployeeUpdateForm.getEmployeeIdList();
        // 保存新的角色员工
        List<RoleEmployeeEntity> roleEmployeeList = null;
        if (CollectionUtils.isNotEmpty(employeeIdList)) {
            roleEmployeeList = employeeIdList.stream()
                    .map(employeeId -> new RoleEmployeeEntity(roleId, employeeId))
                    .collect(Collectors.toList());
        }
        // 保存数据
        roleEmployeeManager.saveRoleEmployee(roleId, roleEmployeeList);
        return R.ok();
    }

    /**
     * 通过员工id获取员工角色
     */
    public List<RoleSelectedVO> getRoleInfoListByEmployeeId(Long employeeId) {
        List<Long> roleIds = roleEmployeeMapper.selectRoleIdByEmployeeId(employeeId);
        List<RoleEntity> roleList = roleMapper.selectList(null);
        List<RoleSelectedVO> result = LocalBeanUtil.copyList(roleList, RoleSelectedVO.class);
        result.stream().forEach(item -> item.setSelected(roleIds.contains(item.getRoleId())));
        return result;
    }

    /**
     * 根据员工id 查询角色id集合
     */
    public List<RoleVO> getRoleIdList(Long employeeId) {
        return roleEmployeeMapper.selectRoleByEmployeeId(employeeId);
    }


}
