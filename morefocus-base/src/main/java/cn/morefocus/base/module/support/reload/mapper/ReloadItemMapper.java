package cn.morefocus.base.module.support.reload.mapper;

import cn.morefocus.base.module.support.reload.domain.ReloadItemEntity;
import cn.morefocus.base.module.support.reload.domain.ReloadItemVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * t_reload_item 数据表Mapper
 *
 * @author loki
 */
@Component
@Mapper
public interface ReloadItemMapper extends BaseMapper<ReloadItemEntity> {

    List<ReloadItemVO> query();
}
