package cn.morefocus.admin.module.business.warehouse.mapper;

import cn.morefocus.admin.module.business.warehouse.domain.entity.WarehouseEntity;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseQueryForm;
import cn.morefocus.admin.module.business.warehouse.domain.vo.WarehouseVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 仓库 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface WarehouseMapper extends BaseMapper<WarehouseEntity> {

    /**
     * 分页 查询
     */
    List<WarehouseVO> queryPage(Page page, @Param("queryForm") WarehouseQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<WarehouseVO> queryAll();

}
