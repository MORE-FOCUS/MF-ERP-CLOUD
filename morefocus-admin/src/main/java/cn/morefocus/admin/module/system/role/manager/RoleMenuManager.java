package cn.morefocus.admin.module.system.role.manager;

import cn.morefocus.admin.module.system.role.mapper.RoleMenuMapper;
import cn.morefocus.admin.module.system.role.domain.entity.RoleMenuEntity;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色-菜单 manager
 *
 * @author loki
 */
@Service
public class RoleMenuManager extends ServiceImpl<RoleMenuMapper, RoleMenuEntity> {

    @Resource
    private RoleMenuMapper roleMenuMapper;

    /**
     * 更新角色权限
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateRoleMenu(Long roleId, List<RoleMenuEntity> roleMenuEntityList) {
        // 根据角色ID删除菜单权限
        roleMenuMapper.deleteByRoleId(roleId);
        // 批量添加菜单权限
        saveBatch(roleMenuEntityList);
    }
}
