package cn.morefocus.base.module.support.datatracer.mapper;

import cn.morefocus.base.module.support.datatracer.domain.entity.DataTracerEntity;
import cn.morefocus.base.module.support.datatracer.domain.form.DataTracerQueryForm;
import cn.morefocus.base.module.support.datatracer.domain.vo.DataTracerVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * mapper： t_data_tracker
 *
 * @author loki
 */
@Mapper
@Component
public interface DataTracerMapper extends BaseMapper<DataTracerEntity> {

    /**
     * 操作记录查询
     */
    List<DataTracerVO> selectRecord(@Param("dataId") Long dataId, @Param("dataType") Integer dataType);

    /**
     * 分页查询
     */
    List<DataTracerVO> query(Page page, @Param("query") DataTracerQueryForm queryForm);
}
