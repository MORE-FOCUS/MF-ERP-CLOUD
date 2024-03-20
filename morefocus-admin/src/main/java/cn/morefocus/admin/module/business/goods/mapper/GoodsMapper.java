package cn.morefocus.admin.module.business.goods.mapper;

import cn.morefocus.admin.module.business.goods.domain.entity.GoodsEntity;
import cn.morefocus.admin.module.business.goods.domain.form.GoodsQueryForm;
import cn.morefocus.admin.module.business.goods.domain.vo.GoodsVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品
 *
 * @author loki
 */
@Mapper
@Component
public interface GoodsMapper extends BaseMapper<GoodsEntity> {

    /**
     * 分页 查询商品
     */
    List<GoodsVO> query(Page page, @Param("query") GoodsQueryForm query);

    /**
     * 批量更新删除状态
     */
    void batchUpdateDeleted(@Param("goodsIdList") List<Long> goodsIdList, @Param("deleteFlag") Boolean deleteFlag);
}
