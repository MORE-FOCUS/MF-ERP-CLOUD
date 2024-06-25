package cn.morefocus.admin.module.system.department.mapper;

import cn.morefocus.admin.module.system.department.domain.entity.DepartmentEntity;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentPageQueryForm;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentQueryForm;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 部门
 */
@Component
@Mapper
public interface DepartmentMapper extends BaseMapper<DepartmentEntity> {
    /**
     * 获取全部部门列表
     */
    List<DepartmentVO> queryPage(Page<?> page, @Param("queryForm") DepartmentPageQueryForm queryForm);

    /**
     * 获取全部部门列表
     */
    List<DepartmentVO> queryAll(@Param("queryForm") DepartmentQueryForm queryForm);

    /**
     * 根据部门id，查询此部门直接子部门的数量
     */
    Integer countSubDepartment(@Param("deptId") Long deptId);
}
