package cn.morefocus.admin.module.system.role.service;

import cn.morefocus.admin.module.system.role.mapper.RoleMapper;
import cn.morefocus.admin.module.system.role.mapper.RoleEmployeeMapper;
import cn.morefocus.admin.module.system.role.mapper.RoleMenuMapper;
import cn.morefocus.admin.module.system.role.domain.entity.RoleEntity;
import cn.morefocus.admin.module.system.role.domain.form.RoleAddForm;
import cn.morefocus.admin.module.system.role.domain.form.RoleUpdateForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleVO;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色
 *
 * @author loki
 */
@Service
public class RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Resource
    private RoleEmployeeMapper roleEmployeeMapper;

    /**
     * 新增添加角色
     */
    public R<String> addRole(RoleAddForm roleAddForm) {
        RoleEntity existRoleEntity = roleMapper.getByRoleName(roleAddForm.getRoleName());
        if (null != existRoleEntity) {
            return R.userErrorParam("角色名称重复");
        }

        existRoleEntity = roleMapper.getByRoleCode(roleAddForm.getRoleCode());
        if (null != existRoleEntity) {
            return R.userErrorParam("角色编码重复，重复的角色为：" + existRoleEntity.getRoleName());
        }

        RoleEntity roleEntity = LocalBeanUtil.copy(roleAddForm, RoleEntity.class);
        roleMapper.insert(roleEntity);
        return R.ok();
    }

    /**
     * 根据角色id 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> deleteRole(Long roleId) {
        RoleEntity roleEntity = roleMapper.selectById(roleId);
        if (null == roleEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        roleMapper.deleteById(roleId);
        roleMenuMapper.deleteByRoleId(roleId);
        roleEmployeeMapper.deleteByRoleId(roleId);
        return R.ok();
    }

    /**
     * 更新角色
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateRole(RoleUpdateForm roleUpdateForm) {
        if (null == roleMapper.selectById(roleUpdateForm.getRoleId())) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        RoleEntity existRoleEntity = roleMapper.getByRoleName(roleUpdateForm.getRoleName());
        if (null != existRoleEntity && !existRoleEntity.getRoleId().equals(roleUpdateForm.getRoleId())) {
            return R.userErrorParam("角色名称重复");
        }

        existRoleEntity = roleMapper.getByRoleCode(roleUpdateForm.getRoleCode());
        if (null != existRoleEntity) {
            return R.userErrorParam("角色编码重复，重复的角色为：" + existRoleEntity.getRoleName());
        }

        RoleEntity roleEntity = LocalBeanUtil.copy(roleUpdateForm, RoleEntity.class);
        roleMapper.updateById(roleEntity);
        return R.ok();
    }

    /**
     * 根据id获取角色数据
     */
    public R<RoleVO> getRoleById(Long roleId) {
        RoleEntity roleEntity = roleMapper.selectById(roleId);
        if (null == roleEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        RoleVO role = LocalBeanUtil.copy(roleEntity, RoleVO.class);
        return R.ok(role);
    }

    /**
     * 获取所有角色列表
     */
    public R<List<RoleVO>> getAllRole() {
        List<RoleEntity> roleEntityList = roleMapper.selectList(null);
        List<RoleVO> roleList = LocalBeanUtil.copyList(roleEntityList, RoleVO.class);
        return R.ok(roleList);
    }
}
