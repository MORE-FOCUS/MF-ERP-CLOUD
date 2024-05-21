package cn.morefocus.admin.module.business.spuunit.mapper;

import cn.morefocus.admin.module.business.spuunit.domain.entity.SpuUnitEntity;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitPageQueryForm;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitQueryForm;
import cn.morefocus.admin.module.business.spuunit.domain.vo.SpuUnitVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 单位 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface SpuUnitMapper extends BaseMapper<SpuUnitEntity> {

    /**
     * 分页 查询
     */
    List<SpuUnitVO> queryPage(Page page, @Param("queryForm") SpuUnitPageQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SpuUnitVO> queryAll(@Param("queryForm") SpuUnitQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);
}