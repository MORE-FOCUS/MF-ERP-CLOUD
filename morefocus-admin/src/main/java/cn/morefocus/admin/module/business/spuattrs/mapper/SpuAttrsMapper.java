package cn.morefocus.admin.module.business.spuattrs.mapper;

import cn.morefocus.admin.module.business.spuattrs.domain.entity.SpuAttrsEntity;
import cn.morefocus.admin.module.business.spuattrs.domain.vo.SpuAttrsVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * 商品附加属性 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface SpuAttrsMapper extends BaseMapper<SpuAttrsEntity> {
    /**
     * 查询SPU属性
     */
    SpuAttrsVO querySpuAttrs(@Param("spuId") Long spuId);

    /**
     * 根据商品ID删除
     */
    void deleteBySpuId(@Param("spuId") Long spuId);
}
