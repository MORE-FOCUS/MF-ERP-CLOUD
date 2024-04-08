package cn.morefocus.base.module.support.helpdoc.mapper;

import cn.morefocus.base.module.support.helpdoc.domain.entity.HelpDocCatalogEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 帮助文档目录
 *
 *
 */
@Mapper
@Component
public interface HelpDocCatalogMapper extends BaseMapper<HelpDocCatalogEntity> {

}
