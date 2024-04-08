package cn.morefocus.admin.module.system.menu.domain.entity;

import cn.morefocus.admin.module.system.menu.constant.MenuTypeEnum;
import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 菜单 表
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName(value = "t_menu")
public class MenuEntity extends BaseEntity {

    /**
     * 菜单ID
     */
    @TableId(type = IdType.AUTO)
    private Long menuId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 类型
     *
     * @see MenuTypeEnum
     */
    private Integer menuType;

    /**
     * 父菜单ID
     */
    private Long parentId;

    /**
     * 路由地址
     */
    private String path;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 是否为外链
     */
    private Boolean frameFlag;

    /**
     * 外链地址
     */
    private String frameUrl;

    /**
     * 是否缓存
     */
    private Boolean cacheFlag;

    /**
     * 显示状态
     */
    private Boolean visibleFlag;

    /**
     * 禁用状态
     */
    private Boolean disabledFlag;

    /**
     * 后端权限字符串
     */
    private String apiPerms;

    /**
     * 权限类型
     */
    private Integer permsType;

    /**
     * 前端权限字符串
     */
    private String webPerms;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 功能点关联菜单ID
     */
    private Long contextMenuId;
}
