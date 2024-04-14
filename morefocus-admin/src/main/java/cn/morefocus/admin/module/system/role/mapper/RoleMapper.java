package cn.morefocus.admin.module.system.role.mapper;

import cn.morefocus.admin.module.system.role.domain.entity.RoleEntity;
import cn.morefocus.admin.module.system.role.domain.form.RoleQueryForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 角色 mapper
 */
@Mapper
@Component
public interface RoleMapper extends BaseMapper<RoleEntity> {

    /**
     * 分页查询
     */
    List<RoleVO> queryPage(Page page, @Param("queryForm") RoleQueryForm queryForm);

    /**
     * 根据角色名称查询
     */
    RoleEntity getByRoleName(@Param("roleName") String roleName);

    /**
     * 根据角色编码
     */
    RoleEntity getByRoleCode(@Param("roleCode") String roleCode);
}
