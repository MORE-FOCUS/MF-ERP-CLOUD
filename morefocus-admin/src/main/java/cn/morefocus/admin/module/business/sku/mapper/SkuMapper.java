package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuEntity;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * SKU Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface SkuMapper extends BaseMapper<SkuEntity> {
    /**
     * 查询sku spu
     */
    List<SkuVO> querySkuBySpuId(@Param("spuId") Long spuId);
}
