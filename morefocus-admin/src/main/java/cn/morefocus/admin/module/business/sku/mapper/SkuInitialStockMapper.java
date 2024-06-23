package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuInitialStockEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuInitialStockVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品初始库存 Mapper
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@Mapper
@Component
public interface SkuInitialStockMapper extends BaseMapper<SkuInitialStockEntity> {

    /**
     * 分页 查询
     */
    List<SkuInitialStockVO> queryPage(Page page, @Param("queryForm") SkuInitialStockQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SkuInitialStockVO> queryAll();

    /**
     * 查询搜初始库存
     */
    List<SkuInitialStockVO> querySkuInitalStockList(@Param("spuId") Long spuId);
}
