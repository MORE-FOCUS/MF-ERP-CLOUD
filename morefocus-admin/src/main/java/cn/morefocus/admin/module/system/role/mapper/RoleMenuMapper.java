package cn.morefocus.admin.module.system.role.mapper;

import cn.morefocus.admin.module.system.menu.domain.entity.MenuEntity;
import cn.morefocus.admin.module.system.role.domain.entity.RoleMenuEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 角色 菜单 mapper
 */
@Mapper
@Component
public interface RoleMenuMapper extends BaseMapper<RoleMenuEntity> {

    /**
     * 根据角色ID删除菜单权限
     */
    void deleteByRoleId(@Param("roleId") Long roleId);

    /**
     * 根据角色ID查询选择的菜单权限
     */
    List<Long> queryMenuIdByRoleId(@Param("roleId") Long roleId);

    /**
     * 根据角色ID集合查询选择的菜单权限
     */
    List<MenuEntity> selectMenuListByRoleIdList(@Param("roleIdList") List<Long> roleIdList, @Param("isDeleted") Boolean isDeleted);

    /**
     * 查询所有的菜单角色
     */
    List<RoleMenuEntity> queryAllRoleMenu();
}
