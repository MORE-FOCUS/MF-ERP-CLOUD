package cn.morefocus.admin.module.system.menu.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.morefocus.admin.module.system.menu.constant.MenuTypeEnum;
import cn.morefocus.admin.module.system.menu.domain.entity.MenuEntity;
import cn.morefocus.admin.module.system.menu.domain.form.MenuAddForm;
import cn.morefocus.admin.module.system.menu.domain.form.MenuBaseForm;
import cn.morefocus.admin.module.system.menu.domain.form.MenuUpdateForm;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuTreeVO;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuVO;
import cn.morefocus.admin.module.system.menu.mapper.MenuMapper;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUrlVO;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 菜单
 */
@Service
public class MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private List<RequestUrlVO> authUrl;

    /**
     * 添加菜单
     */
    public synchronized R<String> addMenu(MenuAddForm menuAddForm) {
        // 校验菜单名称
        if (this.validateMenuName(menuAddForm)) {
            return R.userErrorParam("菜单名称已存在");
        }
        // 校验前端权限字符串
        if (this.validateWebPerms(menuAddForm)) {
            return R.userErrorParam("前端权限字符串已存在");
        }
        MenuEntity menuEntity = LocalBeanUtil.copy(menuAddForm, MenuEntity.class);
        menuMapper.insert(menuEntity);
        return R.ok();
    }

    /**
     * 更新菜单
     */
    public synchronized R<String> updateMenu(MenuUpdateForm menuUpdateForm) {
        //校验菜单是否存在
        MenuEntity selectMenu = menuMapper.selectById(menuUpdateForm.getMenuId());
        if (selectMenu == null) {
            return R.userErrorParam("菜单不存在");
        }
        if (selectMenu.getDeleteFlag()) {
            return R.userErrorParam("菜单已被删除");
        }
        //校验菜单名称
        if (this.validateMenuName(menuUpdateForm)) {
            return R.userErrorParam("菜单名称已存在");
        }
        // 校验前端权限字符串
        if (this.validateWebPerms(menuUpdateForm)) {
            return R.userErrorParam("前端权限字符串已存在");
        }
        if (menuUpdateForm.getMenuId().equals(menuUpdateForm.getParentId())) {
            return R.userErrorParam("上级菜单不能为自己");
        }
        MenuEntity menuEntity = LocalBeanUtil.copy(menuUpdateForm, MenuEntity.class);
        menuMapper.updateById(menuEntity);
        return R.ok();
    }

    /**
     * 批量删除菜单
     */
    public synchronized R<String> batchDeleteMenu(List<Long> menuIdList, Long employeeId, String employeeName) {
        if (CollectionUtils.isEmpty(menuIdList)) {
            return R.userErrorParam("所选菜单不能为空");
        }
        menuMapper.deleteByMenuIdList(menuIdList, employeeId, employeeName, Boolean.TRUE);
        //孩子节点也需要删除
        this.recursiveDeleteChildren(menuIdList, employeeId, employeeName);
        return R.ok();
    }

    /**
     * 递归删除菜单
     */
    private void recursiveDeleteChildren(List<Long> menuIdList, Long employeeId, String employeeName) {
        List<Long> childrenMenuIdList = menuMapper.selectMenuIdByParentIdList(menuIdList);
        if (CollectionUtil.isEmpty(childrenMenuIdList)) {
            return;
        }
        menuMapper.deleteByMenuIdList(childrenMenuIdList, employeeId, employeeName, Boolean.TRUE);
        recursiveDeleteChildren(childrenMenuIdList, employeeId, employeeName);
    }

    /**
     * 校验菜单名称
     */
    public <T extends MenuBaseForm> Boolean validateMenuName(T menuDTO) {
        MenuEntity menu = menuMapper.getByMenuName(menuDTO.getMenuName(), menuDTO.getParentId(), Boolean.FALSE);
        if (menuDTO instanceof MenuAddForm) {
            return menu != null;
        }
        if (menuDTO instanceof MenuUpdateForm) {
            Long menuId = ((MenuUpdateForm) menuDTO).getMenuId();
            return menu != null && menu.getMenuId().longValue() != menuId.longValue();
        }
        return true;
    }

    /**
     * 校验前端权限字符串
     *
     * @return true 重复 false 未重复
     */
    public <T extends MenuBaseForm> Boolean validateWebPerms(T menuDTO) {
        MenuEntity menu = menuMapper.getByWebPerms(menuDTO.getWebPerms(), Boolean.FALSE);
        if (menuDTO instanceof MenuAddForm) {
            return menu != null;
        }
        if (menuDTO instanceof MenuUpdateForm) {
            Long menuId = ((MenuUpdateForm) menuDTO).getMenuId();
            return menu != null && menu.getMenuId().longValue() != menuId.longValue();
        }
        return true;
    }

    /**
     * 查询菜单列表
     */
    public List<MenuVO> queryMenuList(Boolean disabledFlag) {
        List<MenuVO> menuVOList = menuMapper.queryMenuList(Boolean.FALSE, disabledFlag, null);
        //根据ParentId进行分组
        Map<Long, List<MenuVO>> parentMap = menuVOList.stream().collect(Collectors.groupingBy(MenuVO::getParentId, Collectors.toList()));
        return this.filterNoParentMenu(parentMap, NumberUtils.LONG_ZERO);
    }

    /**
     * 过滤没有上级菜单的菜单列表
     */
    private List<MenuVO> filterNoParentMenu(Map<Long, List<MenuVO>> parentMap, Long parentId) {
        // 获取本级菜单树List
        List<MenuVO> res = parentMap.getOrDefault(parentId, Lists.newArrayList());
        List<MenuVO> childMenu = Lists.newArrayList();
        // 循环遍历下级菜单
        res.forEach(e -> {
            List<MenuVO> menuList = this.filterNoParentMenu(parentMap, e.getMenuId());
            childMenu.addAll(menuList);
        });
        res.addAll(childMenu);
        return res;
    }

    /**
     * 查询菜单树
     *
     * @param onlyMenu 不查询功能点
     */
    public R<List<MenuTreeVO>> queryMenuTree(Boolean onlyMenu) {
        List<Integer> menuTypeList = Lists.newArrayList();
        if (onlyMenu) {
            menuTypeList = Lists.newArrayList(MenuTypeEnum.CATALOG.getValue(), MenuTypeEnum.MENU.getValue());
        }
        List<MenuVO> menuVOList = menuMapper.queryMenuList(Boolean.FALSE, null, menuTypeList);
        //根据ParentId进行分组
        Map<Long, List<MenuVO>> parentMap = menuVOList.stream().collect(Collectors.groupingBy(MenuVO::getParentId, Collectors.toList()));
        List<MenuTreeVO> menuTreeVOList = this.buildMenuTree(parentMap, NumberUtils.LONG_ZERO);
        return R.ok(menuTreeVOList);
    }

    /**
     * 构建菜单树
     */
    List<MenuTreeVO> buildMenuTree(Map<Long, List<MenuVO>> parentMap, Long parentId) {
        // 获取本级菜单树List
        List<MenuTreeVO> res = parentMap.getOrDefault(parentId, Lists.newArrayList()).stream()
                .map(e -> LocalBeanUtil.copy(e, MenuTreeVO.class)).collect(Collectors.toList());
        // 循环遍历下级菜单
        res.forEach(e -> {
            e.setChildren(this.buildMenuTree(parentMap, e.getMenuId()));
        });
        return res;
    }

    /**
     * 查询菜单详情
     */
    public R<MenuVO> getMenuDetail(Long menuId) {
        //校验菜单是否存在
        MenuEntity selectMenu = menuMapper.selectById(menuId);
        if (selectMenu == null) {
            return R.userErrorParam("菜单不存在");
        }
        if (selectMenu.getDeleteFlag()) {
            return R.userErrorParam("菜单已被删除");
        }
        MenuVO menuVO = LocalBeanUtil.copy(selectMenu, MenuVO.class);
        return R.ok(menuVO);
    }

    /**
     * 获取系统所有请求路径
     */
    public R<List<RequestUrlVO>> getAuthUrl() {
        return R.ok(authUrl);
    }

    /**
     * 复制
     */
    public R<String> copyMenu(Long menuId) {
        MenuEntity selectMenu = menuMapper.selectById(menuId);
        if (selectMenu == null) {
            return R.userErrorParam("菜单不存在");
        }
        if (selectMenu.getDeleteFlag()) {
            return R.userErrorParam("菜单已被删除");
        }

        MenuEntity menuEntity = LocalBeanUtil.copy(selectMenu, MenuEntity.class);
        menuEntity.setMenuId(null);
        menuEntity.setCreateTime();
        menuEntity.setCreateBy();
        menuEntity.setCreateByName();
        menuMapper.insert(menuEntity);
        return R.ok();
    }
}
