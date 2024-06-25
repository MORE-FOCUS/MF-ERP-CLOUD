package cn.morefocus.admin.module.business.store.mapper;

import cn.morefocus.admin.module.business.store.domain.entity.StoreEntity;
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
 * 门店 Mapper
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Mapper
@Component
public interface StoreMapper extends BaseMapper<StoreEntity> {
    /**
     * 获取全部部门列表
     */
    List<DepartmentVO> queryPage(Page<?> page, @Param("queryForm") DepartmentPageQueryForm queryForm);

    /**
     * 获取全部部门列表
     */
    List<DepartmentVO> queryAll(@Param("queryForm") DepartmentQueryForm queryForm);
}
