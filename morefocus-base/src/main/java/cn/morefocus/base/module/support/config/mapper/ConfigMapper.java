package cn.morefocus.base.module.support.config.mapper;

import cn.morefocus.base.module.support.config.domain.ConfigEntity;
import cn.morefocus.base.module.support.config.domain.ConfigQueryForm;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 系统参数配置 t_config mapper层
 *
 * @author loki
 */
@Component
@Mapper
public interface ConfigMapper extends BaseMapper<ConfigEntity> {

    /**
     * 分页查询系统配置
     */
    List<ConfigEntity> queryByPage(Page page, @Param("query") ConfigQueryForm queryForm);

    /**
     * 根据key查询获取数据
     */
    ConfigEntity selectByKey(String key);
}
