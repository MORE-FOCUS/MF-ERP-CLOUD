package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuStockDetailEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuStockDetailQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockDetailVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品库存明细 Mapper
 *
 * @author loki
 * @date 2024-06-23 11:57:24
 */
@Mapper
@Component
public interface SkuStockDetailMapper extends BaseMapper<SkuStockDetailEntity> {

    /**
     * 分页 查询
     */
    List<SkuStockDetailVO> queryPage(Page page, @Param("queryForm") SkuStockDetailQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SkuStockDetailVO> queryAll();

    /**
     * 更新删除状态
     */
    long updateDeleted(@Param("id") Integer id, @Param("${isDeleted}") boolean isDeleted);

    /**
     * 批量更新删除状态
     */
    void batchUpdateDeleted(@Param("idList") List<Integer> idList, @Param("${isDeleted}") boolean isDeleted);

}
