package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuStockEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品库存 Mapper
 *
 * @author loki
 * @date 2024-06-23 11:57:19
 */
@Mapper
@Component
public interface SkuStockMapper extends BaseMapper<SkuStockEntity> {

    /**
     * 分页 查询
     */
    List<SkuStockVO> queryPage(Page page, @Param("queryForm") SkuStockQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SkuStockVO> queryAll();
}
