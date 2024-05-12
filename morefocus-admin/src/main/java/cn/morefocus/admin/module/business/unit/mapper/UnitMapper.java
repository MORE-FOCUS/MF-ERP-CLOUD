package cn.morefocus.admin.module.business.unit.mapper;

import cn.morefocus.admin.module.business.unit.domain.entity.UnitEntity;
import cn.morefocus.admin.module.business.unit.domain.form.UnitPageQueryForm;
import cn.morefocus.admin.module.business.unit.domain.vo.UnitVO;
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
public interface UnitMapper extends BaseMapper<UnitEntity> {

    /**
     * 分页 查询
     */
    List<UnitVO> queryPage(Page page, @Param("queryForm") UnitPageQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<UnitVO> queryAll(@Param("queryForm") UnitPageQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);
}
