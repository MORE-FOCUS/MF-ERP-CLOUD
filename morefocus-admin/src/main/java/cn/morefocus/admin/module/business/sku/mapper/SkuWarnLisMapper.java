package cn.morefocus.admin.module.business.sku.mapper;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuWarnLisEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnLisQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuWarnLisVO;
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
public interface SkuWarnLisMapper extends BaseMapper<SkuWarnLisEntity> {

    /**
     * 分页 查询
     */
    List<SkuWarnLisVO> queryPage(Page page, @Param("queryForm") SkuWarnLisQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SkuWarnLisVO> queryAll();
}
