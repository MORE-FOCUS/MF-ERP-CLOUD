package cn.morefocus.admin.module.business.barcode.mapper;

import cn.morefocus.admin.module.business.barcode.domain.entity.SpuBarcodeEntity;
import cn.morefocus.admin.module.business.barcode.domain.vo.SpuBarcodeVO;
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
public interface SpuBarcodeMapper extends BaseMapper<SpuBarcodeEntity> {
    /**
     * 查询条形码
     */
    List<SpuBarcodeVO> queryBarcodeBySpuId(@Param("spuId") Long spuId);
}
