package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuWarnConfigEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnConfigQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuWarnConfigVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品库存预警 Mapper
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@Mapper
@Component
public interface SkuWarnConfigMapper extends BaseMapper<SkuWarnConfigEntity> {

    /**
     * 分页 查询
     */
    List<SkuWarnConfigVO> queryPage(Page page, @Param("queryForm") SkuWarnConfigQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SkuWarnConfigVO> queryAll();

    /**
     * 查询商品预警预警列表
     */
    List<SkuWarnConfigVO> querySkuWarnConfigBySpuId(@Param("spuId") Long spuId);
}
