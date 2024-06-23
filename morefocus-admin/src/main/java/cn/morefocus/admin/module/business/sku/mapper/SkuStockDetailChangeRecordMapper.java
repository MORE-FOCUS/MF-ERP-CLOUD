package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuStockDetailChangeRecordEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuStockDetailChangeRecordQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockDetailChangeRecordVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 库存明细变化日志 Mapper
 *
 * @author loki
 * @date 2024-04-01 00:20:24
 */
@Mapper
@Component
public interface SkuStockDetailChangeRecordMapper extends BaseMapper<SkuStockDetailChangeRecordEntity> {

    /**
     * 分页 查询
     */
    List<SkuStockDetailChangeRecordVO> queryPage(Page page, @Param("queryForm") SkuStockDetailChangeRecordQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SkuStockDetailChangeRecordVO> queryAll();

}
