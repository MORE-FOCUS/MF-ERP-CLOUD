package cn.morefocus.base.module.support.codegenerator.mapper;

import cn.morefocus.base.module.support.codegenerator.domain.entity.CodeGeneratorConfigEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 表的 代码生成配置 mapper
 *
 *
 */
@Mapper
@Component
public interface CodeGeneratorConfigMapper extends BaseMapper<CodeGeneratorConfigEntity> {

}