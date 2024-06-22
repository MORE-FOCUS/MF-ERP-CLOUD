package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuBarcodeEntity;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuBarcodeVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 条形码 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface SkuBarcodeMapper extends BaseMapper<SkuBarcodeEntity> {
    /**
     * 查询条形码
     */
    List<SkuBarcodeVO> queryBarcodeBySpuId(@Param("spuId") Long spuId);
}
