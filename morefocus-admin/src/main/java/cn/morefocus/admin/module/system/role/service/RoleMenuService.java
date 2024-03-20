package cn.morefocus.admin.module.system.role.service;

import cn.morefocus.admin.module.system.menu.mapper.MenuMapper;
import cn.morefocus.admin.module.system.menu.domain.entity.MenuEntity;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuSimpleTreeVO;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuVO;
import cn.morefocus.admin.module.system.role.mapper.RoleMapper;
import cn.morefocus.admin.module.system.role.mapper.RoleMenuMapper;
import cn.morefocus.admin.module.system.role.domain.entity.RoleEntity;
import cn.morefocus.admin.module.system.role.domain.entity.RoleMenuEntity;
import cn.morefocus.admin.module.system.role.domain.form.RoleMenuUpdateForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleMenuTreeVO;
import cn.morefocus.admin.module.system.role.manager.RoleMenuManager;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 角色-菜单
 *
 * @author loki
 */
@Service
public class RoleMenuService {

    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleMenuMapper roleMenuMapper;
    @Resource
    private RoleMenuManager roleMenuManager;
    @Resource
    private MenuMapper menuMapper;

    /**
     * 更新角色权限
     */
    public R<String> updateRoleMenu(RoleMenuUpdateForm roleMenuUpdateForm) {
        //查询角色是否存在
        Long roleId = roleMenuUpdateForm.getRoleId();
        RoleEntity roleEntity = roleMapper.selectById(roleId);
        if (null == roleEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        List<RoleMenuEntity> roleMenuEntityList = Lists.newArrayList();
        RoleMenuEntity roleMenuEntity;
        for (Long menuId : roleMenuUpdateForm.getMenuIdList()) {
            roleMenuEntity = new RoleMenuEntity();
            roleMenuEntity.setRoleId(roleId);
            roleMenuEntity.setMenuId(menuId);
            roleMenuEntityList.add(roleMenuEntity);
        }
        roleMenuManager.updateRoleMenu(roleMenuUpdateForm.getRoleId(), roleMenuEntityList);
        return R.ok();
    }

    /**
     * 根据角色id集合，查询其所有的菜单权限
     */
    public List<MenuVO> getMenuList(List<Long> roleIdList, Boolean administratorFlag) {
        //管理员返回所有菜单
        if (administratorFlag) {
            List<MenuEntity> menuEntityList = roleMenuMapper.selectMenuListByRoleIdList(Lists.newArrayList(), false);
            return LocalBeanUtil.copyList(menuEntityList, MenuVO.class);
        }
        //非管理员 无角色 返回空菜单
        if (CollectionUtils.isEmpty(roleIdList)) {
            return new ArrayList<>();
        }
        List<MenuEntity> menuEntityList = roleMenuMapper.selectMenuListByRoleIdList(roleIdList, false);
        return LocalBeanUtil.copyList(menuEntityList, MenuVO.class);
    }


    /**
     * 获取角色关联菜单权限
     */
    public R<RoleMenuTreeVO> getRoleSelectedMenu(Long roleId) {
        RoleMenuTreeVO res = new RoleMenuTreeVO();
        res.setRoleId(roleId);
        //查询角色ID选择的菜单权限
        List<Long> selectedMenuId = roleMenuMapper.queryMenuIdByRoleId(roleId);
        res.setSelectedMenuId(selectedMenuId);
        //查询菜单权限
        List<MenuVO> menuVOList = menuMapper.queryMenuList(Boolean.FALSE, Boolean.FALSE, null);
        Map<Long, List<MenuVO>> parentMap = menuVOList.stream().collect(Collectors.groupingBy(MenuVO::getParentId, Collectors.toList()));
        List<MenuSimpleTreeVO> menuTreeList = this.buildMenuTree(parentMap, NumberUtils.LONG_ZERO);
        res.setMenuTreeList(menuTreeList);
        return R.ok(res);
    }

    /**
     * 构建菜单树
     */
    private List<MenuSimpleTreeVO> buildMenuTree(Map<Long, List<MenuVO>> parentMap, Long parentId) {
        // 获取本级菜单树List
        List<MenuSimpleTreeVO> res = parentMap.getOrDefault(parentId, Lists.newArrayList()).stream()
                .map(e -> LocalBeanUtil.copy(e, MenuSimpleTreeVO.class)).collect(Collectors.toList());
        // 循环遍历下级菜单
        res.forEach(e -> {
            e.setChildren(this.buildMenuTree(parentMap, e.getMenuId()));
        });
        return res;
    }
}
