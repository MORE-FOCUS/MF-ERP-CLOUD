package cn.morefocus.admin.module.system.menu.mapper;

import cn.morefocus.admin.module.system.menu.domain.entity.MenuEntity;
import cn.morefocus.admin.module.system.menu.domain.vo.MenuVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 菜单 mapper
 */
@Mapper
@Component
public interface MenuMapper extends BaseMapper<MenuEntity> {

    /**
     * 根据名称查询同一级下的菜单
     *
     * @param menuName   菜单名
     * @param pid   父级id
     * @param isDeleted 是否删除
     */
    MenuEntity getByMenuName(@Param("menuName") String menuName, @Param("pid") Long pid, @Param("isDeleted") Boolean isDeleted);

    /**
     * 根据前端权限字符串查询菜单
     *
     * @param webPerms   前端权限字符串
     * @param isDeleted 是否删除
     */
    MenuEntity getByWebPerms(@Param("webPerms") String webPerms, @Param("isDeleted") Boolean isDeleted);

    /**
     * 根据菜单ID删除菜单（逻辑删除）
     *
     * @param menuIdList 菜单id集合
     * @param deleteBy   操作人id
     * @param deleteByName   操作人名称
     * @param isDeleted 是否删除
     */
    void deleteByMenuIdList(@Param("menuIdList") List<Long> menuIdList, @Param("deleteBy") Long deleteBy, @Param("deleteByName") String deleteByName, @Param("isDeleted") Boolean isDeleted);

    /**
     * 查询菜单列表
     *
     * @param isDeleted   是否删除
     * @param isDisabled 是否禁用
     * @param menuTypeList 菜单类型集合
     */
    List<MenuVO> queryMenuList(@Param("isDeleted") Boolean isDeleted, @Param("isDisabled") Boolean isDisabled, @Param("menuTypeList") List<Integer> menuTypeList);

    /**
     * 根据菜单ID 查询功能点列表
     *
     * @param menuId     菜单id
     * @param menuType   菜单类型
     * @param isDeleted 删除标记
     */
    List<MenuEntity> getPointListByMenuId(@Param("menuId") Long menuId, @Param("menuType") Integer menuType, @Param("isDeleted") Boolean isDeleted);

    /**
     * 根据员工ID查询菜单列表
     *
     * @param isDeleted   是否删除
     * @param isDisabled 禁用标识
     * @param employeeId   员工id
     */
    List<MenuVO> queryMenuByEmployeeId(@Param("isDeleted") Boolean isDeleted,
                                       @Param("isDisabled") Boolean isDisabled,
                                       @Param("employeeId") Long employeeId);

    /**
     * 根据菜单类型查询
     *
     * @param menuType     菜单类型
     * @param isDeleted   删除
     * @param isDisabled 禁用
     */
    List<MenuEntity> queryMenuByType(@Param("menuType") Integer menuType,
                                     @Param("isDeleted") Boolean isDeleted,
                                     @Param("isDisabled") Boolean isDisabled);

    /**
     * 查询孩子id
     */
    List<Long> selectMenuIdByParentIdList(@Param("menuIdList") List<Long> menuIdList);
}
