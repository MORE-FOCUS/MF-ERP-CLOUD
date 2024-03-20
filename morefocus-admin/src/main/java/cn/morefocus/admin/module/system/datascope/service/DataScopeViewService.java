package cn.morefocus.admin.module.system.datascope.service;

import cn.morefocus.admin.module.system.datascope.constant.DataScopeTypeEnum;
import cn.morefocus.admin.module.system.datascope.constant.DataScopeViewTypeEnum;
import cn.morefocus.admin.module.system.department.service.DepartmentService;
import cn.morefocus.admin.module.system.employee.mapper.EmployeeMapper;
import cn.morefocus.admin.module.system.employee.domain.entity.EmployeeEntity;
import cn.morefocus.admin.module.system.role.mapper.RoleDataScopeMapper;
import cn.morefocus.admin.module.system.role.mapper.RoleEmployeeMapper;
import cn.morefocus.admin.module.system.role.domain.entity.RoleDataScopeEntity;
import cn.morefocus.base.common.util.LocalEnumUtil;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 数据范围
 *
 * @author loki
 */
@Service
public class DataScopeViewService {

    @Resource
    private RoleEmployeeMapper roleEmployeeMapper;

    @Resource
    private RoleDataScopeMapper roleDataScopeMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private DepartmentService departmentService;

    /**
     * 获取某人可以查看的所有人员信息
     */
    public List<Long> getCanViewEmployeeId(DataScopeTypeEnum dataScopeTypeEnum, Long employeeId) {
        DataScopeViewTypeEnum viewType = this.getEmployeeDataScopeViewType(dataScopeTypeEnum, employeeId);
        if (DataScopeViewTypeEnum.ME == viewType) {
            return this.getMeEmployeeIdList(employeeId);
        }
        if (DataScopeViewTypeEnum.DEPARTMENT == viewType) {
            return this.getDepartmentEmployeeIdList(employeeId);
        }
        if (DataScopeViewTypeEnum.DEPARTMENT_AND_SUB == viewType) {
            return this.getDepartmentAndSubEmployeeIdList(employeeId);
        }
        return Lists.newArrayList();
    }

    /**
     * 获取某人可以查看的所有部门信息
     */
    public List<Long> getCanViewDepartmentId(DataScopeTypeEnum dataScopeTypeEnum, Long employeeId) {
        DataScopeViewTypeEnum viewType = this.getEmployeeDataScopeViewType(dataScopeTypeEnum, employeeId);
        if (DataScopeViewTypeEnum.ME == viewType) {
            return this.getMeDepartmentIdList(employeeId);
        }
        if (DataScopeViewTypeEnum.DEPARTMENT == viewType) {
            return this.getMeDepartmentIdList(employeeId);
        }
        if (DataScopeViewTypeEnum.DEPARTMENT_AND_SUB == viewType) {
            return this.getDepartmentAndSubIdList(employeeId);
        }
        return Lists.newArrayList();
    }

    public List<Long> getMeDepartmentIdList(Long employeeId) {
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        return Lists.newArrayList(employeeEntity.getDeptId());
    }

    public List<Long> getDepartmentAndSubIdList(Long employeeId) {
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        return departmentService.selfAndChildrenIdList(employeeEntity.getDeptId());
    }

    /**
     * 根据员工id 获取各数据范围最大的可见范围 map<dataScopeType,viewType></>
     */
    public DataScopeViewTypeEnum getEmployeeDataScopeViewType(DataScopeTypeEnum dataScopeTypeEnum, Long employeeId) {
        if (employeeId == null) {
            return DataScopeViewTypeEnum.ME;
        }

        List<Long> roleIdList = roleEmployeeMapper.selectRoleIdByEmployeeId(employeeId);
        //未设置角色 默认本人
        if (CollectionUtils.isEmpty(roleIdList)) {
            return DataScopeViewTypeEnum.ME;
        }
        //未设置角色数据范围 默认本人
        List<RoleDataScopeEntity> dataScopeRoleList = roleDataScopeMapper.listByRoleIdList(roleIdList);
        if (CollectionUtils.isEmpty(dataScopeRoleList)) {
            return DataScopeViewTypeEnum.ME;
        }
        Map<Integer, List<RoleDataScopeEntity>> listMap = dataScopeRoleList.stream().collect(Collectors.groupingBy(RoleDataScopeEntity::getDataScopeType));
        List<RoleDataScopeEntity> viewLevelList = listMap.getOrDefault(dataScopeTypeEnum.getValue(), Lists.newArrayList());
        if (CollectionUtils.isEmpty(viewLevelList)) {
            return DataScopeViewTypeEnum.ME;
        }
        RoleDataScopeEntity maxLevel = viewLevelList.stream().max(Comparator.comparing(e -> LocalEnumUtil.getEnumByValue(e.getViewType(), DataScopeViewTypeEnum.class).getLevel())).get();
        return LocalEnumUtil.getEnumByValue(maxLevel.getViewType(), DataScopeViewTypeEnum.class);
    }

    /**
     * 获取本人相关 可查看员工id
     */
    private List<Long> getMeEmployeeIdList(Long employeeId) {
        return Lists.newArrayList(employeeId);
    }

    /**
     * 获取本部门相关 可查看员工id
     */
    private List<Long> getDepartmentEmployeeIdList(Long employeeId) {
        EmployeeEntity employeeEntity = employeeMapper.selectById(employeeId);
        return employeeMapper.getEmployeeIdByDepartmentId(employeeEntity.getDeptId(), false);
    }

    /**
     * 获取本部门及下属子部门相关 可查看员工id
     */
    private List<Long> getDepartmentAndSubEmployeeIdList(Long employeeId) {
        List<Long> allDepartmentIds = getDepartmentAndSubIdList(employeeId);
        return employeeMapper.getEmployeeIdByDepartmentIdList(allDepartmentIds, false);
    }
}
