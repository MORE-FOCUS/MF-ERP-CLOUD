package cn.morefocus.admin.module.system.role.mapper;

import cn.morefocus.admin.module.system.role.domain.entity.RoleDataScopeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * 角色 数据权限 mapper
 *
 * @author loki
 */
@Mapper
@Component
public interface RoleDataScopeMapper extends BaseMapper<RoleDataScopeEntity> {

    /**
     * 获取某个角色的设置信息
     */
    List<RoleDataScopeEntity> listByRoleId(@Param("roleId") Long roleId);

    /**
     * 获取某批角色的所有数据范围配置信息
     */
    List<RoleDataScopeEntity> listByRoleIdList(@Param("roleIdList") List<Long> roleIdList);

    /**
     * 删除某个角色的设置信息
     */
    void deleteByRoleId(@Param("roleId") Long roleId);

}
