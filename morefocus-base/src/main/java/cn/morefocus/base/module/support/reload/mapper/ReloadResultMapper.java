package cn.morefocus.base.module.support.reload.mapper;

import cn.morefocus.base.module.support.reload.domain.ReloadResultEntity;
import cn.morefocus.base.module.support.reload.domain.ReloadResultVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * t_reload_result 数据表Mapper
 *
 *
 */
@Component
@Mapper
public interface ReloadResultMapper extends BaseMapper<ReloadResultEntity> {

    List<ReloadResultVO> query(@Param("tag") String tag);
}
