package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuPriceEntity;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuPriceVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品价格 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface SkuPriceMapper extends BaseMapper<SkuPriceEntity> {
    /**
     * 查询条形码
     */
    List<SkuPriceVO> querySkuPriceBySpuId(@Param("spuId") Long spuId);
}
