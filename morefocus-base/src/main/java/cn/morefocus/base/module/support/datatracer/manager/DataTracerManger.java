package cn.morefocus.base.module.support.datatracer.manager;

import cn.morefocus.base.module.support.datatracer.domain.entity.DataTracerEntity;
import cn.morefocus.base.module.support.datatracer.mapper.DataTracerMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * manager层
 *
 *
 */
@Service
public class DataTracerManger extends ServiceImpl<DataTracerMapper, DataTracerEntity> {
}
