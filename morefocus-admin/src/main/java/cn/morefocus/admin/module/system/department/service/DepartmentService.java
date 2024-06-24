package cn.morefocus.admin.module.system.department.service;

import cn.morefocus.admin.module.system.department.domain.entity.DepartmentEntity;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentAddForm;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentUpdateForm;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentTreeVO;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentVO;
import cn.morefocus.admin.module.system.department.manager.DepartmentCacheManager;
import cn.morefocus.admin.module.system.department.mapper.DepartmentMapper;
import cn.morefocus.admin.module.system.employee.mapper.EmployeeMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 部门 service
 */
@Service
public class DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private DepartmentCacheManager departmentCacheManager;

    /**
     * 新增添加部门
     */
    public R<String> addDepartment(DepartmentAddForm departmentAddForm) {
        DepartmentEntity departmentEntity = LocalBeanUtil.copy(departmentAddForm, DepartmentEntity.class);
        departmentMapper.insert(departmentEntity);
        this.clearCache();
        return R.ok();
    }

    /**
     * 更新部门信息
     */
    public R<String> updateDepartment(DepartmentUpdateForm updateDTO) {
        if (updateDTO.getPid() == null) {
            return R.userErrorParam("父级部门id不能为空");
        }
        DepartmentEntity entity = departmentMapper.selectById(updateDTO.getDeptId());
        if (entity == null) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        DepartmentEntity departmentEntity = LocalBeanUtil.copy(updateDTO, DepartmentEntity.class);
        departmentEntity.setSortValue(updateDTO.getSortValue());
        departmentMapper.updateById(departmentEntity);
        this.clearCache();
        return R.ok();
    }

    /**
     * 根据id删除部门
     * 1、需要判断当前部门是否有子部门,有子部门则不允许删除
     * 2、需要判断当前部门是否有员工，有员工则不能删除
     */
    public R<String> deleteDepartment(Long deptId) {
        DepartmentEntity departmentEntity = departmentMapper.selectById(deptId);
        if (null == departmentEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        // 是否有子级部门
        int subDepartmentNum = departmentMapper.countSubDepartment(deptId);
        if (subDepartmentNum > 0) {
            return R.userErrorParam("请先删除子级部门");
        }

        // 是否有未删除员工
        int employeeNum = employeeMapper.countByDepartmentId(deptId);
        if (employeeNum > 0) {
            return R.userErrorParam("请先删除部门员工");
        }
        departmentMapper.deleteById(deptId);
        // 清除缓存
        this.clearCache();
        return R.ok();
    }

    /**
     * 清除自身以及下级的id列表缓存
     */
    private void clearCache() {
        departmentCacheManager.clearCache();
    }

    // ---------------------------- 查询 ----------------------------

    /**
     * 获取部门树形结构
     */
    public R<List<DepartmentTreeVO>> departmentTree() {
        List<DepartmentTreeVO> treeVOList = departmentCacheManager.getDepartmentTree();
        return R.ok(treeVOList);
    }

    /**
     * 自身以及所有下级的部门id列表
     */
    public List<Long> selfAndChildrenIdList(Long deptId) {
        return departmentCacheManager.getDepartmentSelfAndChildren(deptId);
    }

    /**
     * 获取所有部门
     */
    public List<DepartmentVO> queryAll() {
        return departmentCacheManager.getDepartmentList();
    }

    /**
     * 获取部门
     */
    public DepartmentVO getDepartmentById(Long deptId) {
        return departmentCacheManager.getDepartmentMap().get(deptId);
    }

    /**
     * 获取部门路径：/公司/研发部/产品组
     */
    public String getDepartmentPath(Long deptId) {
        return departmentCacheManager.getDepartmentPathMap().get(deptId);
    }

    /**
     * 查询全部父级部门（不包含自己）
     */
    public List<DepartmentVO> queryAllParentDepartment(Long deptId) {
        List<DepartmentVO> list = new ArrayList<>();

        Map<Long, DepartmentVO> departmentMap = departmentCacheManager.getDepartmentMap();
        DepartmentVO departmentVO = departmentMap.get(deptId);
        while (departmentVO != null) {
            list.add(departmentVO);
            departmentVO = departmentMap.get(departmentVO.getPid());
        }
        Collections.reverse(list);
        return list;
    }

    /**
     * 查询全部父级部门（不包含自己）
     */
    public List<Long> queryAllParentDepartmentIdList(Long deptId) {
        List<Long> list = new ArrayList<>();

        Map<Long, DepartmentVO> departmentMap = departmentCacheManager.getDepartmentMap();
        DepartmentVO departmentVO = departmentMap.get(deptId);
        while (departmentVO != null) {
            list.add(departmentVO.getId());
            departmentVO = departmentMap.get(departmentVO.getPid());
        }
        Collections.reverse(list);
        return list;
    }
}
