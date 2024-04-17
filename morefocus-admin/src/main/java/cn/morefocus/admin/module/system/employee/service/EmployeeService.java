package cn.morefocus.admin.module.system.employee.service;

import cn.dev33.satoken.stp.StpUtil;
import cn.morefocus.admin.module.system.department.domain.entity.DepartmentEntity;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentVO;
import cn.morefocus.admin.module.system.department.mapper.DepartmentMapper;
import cn.morefocus.admin.module.system.department.service.DepartmentService;
import cn.morefocus.admin.module.system.employee.domain.entity.EmployeeEntity;
import cn.morefocus.admin.module.system.employee.domain.form.*;
import cn.morefocus.admin.module.system.employee.domain.vo.EmployeeVO;
import cn.morefocus.admin.module.system.employee.manager.EmployeeManager;
import cn.morefocus.admin.module.system.employee.mapper.EmployeeMapper;
import cn.morefocus.admin.module.system.role.domain.vo.RoleEmployeeVO;
import cn.morefocus.admin.module.system.role.mapper.RoleEmployeeMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.enumeration.UserTypeEnum;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.securityprotect.service.ProtectPasswordService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 员工 service
 */
@Service
public class EmployeeService {

    private static final String PASSWORD_SALT_FORMAT = "smart_%s_admin_$^&*";

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private DepartmentMapper departmentMapper;

    @Resource
    private EmployeeManager employeeManager;

    @Resource
    private RoleEmployeeMapper roleEmployeeMapper;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private ProtectPasswordService protectPasswordService;

    public EmployeeEntity getById(Long employeeId) {
        return employeeMapper.selectById(employeeId);
    }

    /**
     * 查询员工列表
     */
    public PageResult<EmployeeVO> queryPage(EmployeePageQueryForm employeeQueryForm) {
        employeeQueryForm.setIsDeleted(false);
        Page pageParam = PageUtil.convert2PageQuery(employeeQueryForm);

        List<Long> deptIdList = new ArrayList<>();
        if (employeeQueryForm.getDeptId() != null) {
            deptIdList.addAll(departmentService.selfAndChildrenIdList(employeeQueryForm.getDeptId()));
        }

        List<EmployeeVO> employeeList = employeeMapper.queryEmployee(pageParam, employeeQueryForm, deptIdList);
        if (CollectionUtils.isEmpty(employeeList)) {
            return PageUtil.convert2PageResult(pageParam, employeeList);
        }

        List<Long> employeeIdList = employeeList.stream().map(EmployeeVO::getEmployeeId).collect(Collectors.toList());
        // 查询员工角色
        List<RoleEmployeeVO> roleEmployeeEntityList = roleEmployeeMapper.selectRoleByEmployeeIdList(employeeIdList);
        Map<Long, List<Long>> employeeRoleIdListMap = roleEmployeeEntityList.stream().collect(Collectors.groupingBy(RoleEmployeeVO::getEmployeeId, Collectors.mapping(RoleEmployeeVO::getRoleId, Collectors.toList())));
        Map<Long, List<String>> employeeRoleNameListMap = roleEmployeeEntityList.stream().collect(Collectors.groupingBy(RoleEmployeeVO::getEmployeeId, Collectors.mapping(RoleEmployeeVO::getRoleName, Collectors.toList())));

        employeeList.forEach(e -> {
            e.setRoleIdList(employeeRoleIdListMap.getOrDefault(e.getEmployeeId(), Lists.newArrayList()));
            e.setRoleNameList(employeeRoleNameListMap.getOrDefault(e.getEmployeeId(), Lists.newArrayList()));
            e.setDepartmentName(departmentService.getDepartmentPath(e.getDeptId()));
        });
        return PageUtil.convert2PageResult(pageParam, employeeList);
    }

    /**
     * 新增员工
     */
    public synchronized R<String> addEmployee(EmployeeAddForm employeeAddForm) {
        // 校验名称是否重复
        EmployeeEntity employeeEntity = employeeMapper.getByLoginName(employeeAddForm.getLoginName(), null);
        if (null != employeeEntity) {
            return R.userErrorParam("登录名重复");
        }
        // 校验姓名是否重复
        employeeEntity = employeeMapper.getByActualName(employeeAddForm.getActualName(), null);
        if (null != employeeEntity) {
            return R.userErrorParam("姓名重复");
        }
        // 校验电话是否存在
        employeeEntity = employeeMapper.getByPhone(employeeAddForm.getPhone(), null);
        if (null != employeeEntity) {
            return R.userErrorParam("手机号已存在");
        }
        // 部门是否存在
        Long deptId = employeeAddForm.getDeptId();
        DepartmentEntity department = departmentMapper.selectById(deptId);
        if (department == null) {
            return R.userErrorParam("部门不存在");
        }

        EmployeeEntity entity = LocalBeanUtil.copy(employeeAddForm, EmployeeEntity.class);

        // 设置密码 默认密码
        String password = protectPasswordService.randomPassword();
        entity.setLoginPwd(getEncryptPwd(password));

        // 保存数据
        entity.setIsDeleted(Boolean.FALSE);
        employeeManager.saveEmployee(entity, employeeAddForm.getRoleIdList());

        return R.ok(password);
    }

    /**
     * 更新员工
     */
    public synchronized R<String> updateEmployee(EmployeeUpdateForm employeeUpdateForm) {

        Long employeeId = employeeUpdateForm.getEmployeeId();
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        if (null == employeeEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        // 部门是否存在
        Long deptId = employeeUpdateForm.getDeptId();
        DepartmentEntity departmentEntity = departmentMapper.selectById(deptId);
        if (departmentEntity == null) {
            return R.userErrorParam("部门不存在");
        }

        EmployeeEntity existEntity = employeeMapper.getByLoginName(employeeUpdateForm.getLoginName(), null);
        if (null != existEntity && !Objects.equals(existEntity.getEmployeeId(), employeeId)) {
            return R.userErrorParam("登录名重复");
        }

        existEntity = employeeMapper.getByPhone(employeeUpdateForm.getPhone(), null);
        if (null != existEntity && !Objects.equals(existEntity.getEmployeeId(), employeeId)) {
            return R.userErrorParam("手机号已存在");
        }

        existEntity = employeeMapper.getByActualName(employeeUpdateForm.getActualName(), null);
        if (null != existEntity && !Objects.equals(existEntity.getEmployeeId(), employeeId)) {
            return R.userErrorParam("姓名重复");
        }

        // 不更新密码
        EmployeeEntity entity = LocalBeanUtil.copy(employeeUpdateForm, EmployeeEntity.class);
        entity.setLoginPwd(null);

        // 更新数据
        employeeManager.updateEmployee(entity, employeeUpdateForm.getRoleIdList());

        return R.ok();
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateDisableFlag(Long employeeId) {
        if (null == employeeId) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        if (null == employeeEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        employeeMapper.updateDisableFlag(employeeId, !employeeEntity.getIsDisabled());

        if (employeeEntity.getIsDisabled()) {
            // 强制退出登录
            StpUtil.logout(UserTypeEnum.ADMIN_EMPLOYEE.getValue() + StringConst.COLON + employeeId);
        }

        return R.ok();
    }

    /**
     * 批量删除员工
     */
    public R<String> batchUpdateDeleteFlag(List<Long> employeeIdList) {
        if (CollectionUtils.isEmpty(employeeIdList)) {
            return R.ok();
        }
        List<EmployeeEntity> employeeEntityList = employeeManager.listByIds(employeeIdList);
        if (CollectionUtils.isEmpty(employeeEntityList)) {
            return R.ok();
        }
        // 更新删除
        List<EmployeeEntity> deleteList = employeeIdList.stream().map(e -> {
            EmployeeEntity updateEmployee = new EmployeeEntity();
            updateEmployee.setEmployeeId(e);
            updateEmployee.setIsDeleted(true);
            return updateEmployee;
        }).collect(Collectors.toList());
        employeeManager.updateBatchById(deleteList);

        for (Long employeeId : employeeIdList) {
            // 强制退出登录
            StpUtil.logout(UserTypeEnum.ADMIN_EMPLOYEE.getValue() + StringConst.COLON + employeeId);
        }
        return R.ok();
    }

    /**
     * 批量更新部门
     */
    public R<String> batchUpdateDepartment(EmployeeBatchUpdateDepartmentForm batchUpdateDepartmentForm) {
        List<Long> employeeIdList = batchUpdateDepartmentForm.getEmployeeIdList();
        List<EmployeeEntity> employeeEntityList = employeeMapper.selectBatchIds(employeeIdList);
        if (employeeIdList.size() != employeeEntityList.size()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        // 更新
        List<EmployeeEntity> updateList = employeeIdList.stream().map(e -> {
            EmployeeEntity updateEmployee = new EmployeeEntity();
            updateEmployee.setEmployeeId(e);
            updateEmployee.setDeptId(batchUpdateDepartmentForm.getDeptId());
            return updateEmployee;
        }).collect(Collectors.toList());
        employeeManager.updateBatchById(updateList);

        return R.ok();
    }

    /**
     * 更新密码
     */
    public R<String> updatePassword(EmployeeUpdatePasswordForm updatePasswordForm) {
        Long employeeId = updatePasswordForm.getEmployeeId();
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        if (employeeEntity == null) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        // 校验原始密码
        String encryptPwd = getEncryptPwd(updatePasswordForm.getOldPassword());
        if (!Objects.equals(encryptPwd, employeeEntity.getLoginPwd())) {
            return R.userErrorParam("原密码有误，请重新输入");
        }

        // 新旧密码相同
        String newPassword = updatePasswordForm.getNewPassword();
        if (Objects.equals(updatePasswordForm.getOldPassword(), newPassword)) {
            return R.userErrorParam("新密码与原始密码相同，请重新输入");
        }

        // 校验密码复杂度
        R<String> validatePassComplexity = protectPasswordService.validatePassComplexity(newPassword);
        if (!validatePassComplexity.getOk()) {
            return validatePassComplexity;
        }

        // 更新密码
        EmployeeEntity updateEntity = new EmployeeEntity();
        updateEntity.setEmployeeId(employeeId);
        updateEntity.setLoginPwd(getEncryptPwd(newPassword));
        employeeMapper.updateById(updateEntity);

        return R.ok();
    }

    /**
     * 获取某个部门的员工信息
     */
    public R<List<EmployeeVO>> getAllEmployeeByDepartmentId(Long deptId, Boolean isDisabled) {
        List<EmployeeEntity> employeeEntityList = employeeMapper.selectByDepartmentId(deptId, isDisabled);
        if (isDisabled != null) {
            employeeEntityList = employeeEntityList.stream().filter(e -> e.getIsDisabled().equals(isDisabled)).collect(Collectors.toList());
        }

        if (CollectionUtils.isEmpty(employeeEntityList)) {
            return R.ok(Collections.emptyList());
        }

        DepartmentVO department = departmentService.getDepartmentById(deptId);

        List<EmployeeVO> voList = employeeEntityList.stream().map(e -> {
            EmployeeVO employeeVO = LocalBeanUtil.copy(e, EmployeeVO.class);
            if (department != null) {
                employeeVO.setDepartmentName(department.getName());
            }
            return employeeVO;
        }).collect(Collectors.toList());
        return R.ok(voList);
    }

    /**
     * 重置密码
     */
    public R<String> resetPassword(Integer employeeId) {
        String password = protectPasswordService.randomPassword();
        employeeMapper.updatePassword(employeeId, getEncryptPwd(password));
        return R.ok(password);
    }

    /**
     * 获取 加密后 的密码
     */
    public static String getEncryptPwd(String password) {
        return DigestUtils.md5Hex(String.format(PASSWORD_SALT_FORMAT, password));
    }

    /**
     * 查询全部员工
     */
    public R<List<EmployeeVO>> queryAllEmployee(Boolean isDisabled) {
        List<EmployeeVO> employeeList = employeeMapper.selectEmployeeByDisabledAndDeleted(isDisabled, Boolean.FALSE);
        return R.ok(employeeList);
    }

    /**
     * 根据登录名获取员工
     */
    public EmployeeEntity getByLoginName(String loginName) {
        return employeeMapper.getByLoginName(loginName, null);
    }

}
