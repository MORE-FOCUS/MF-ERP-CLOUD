package cn.morefocus.admin.module.business.spu.mapper;

import cn.morefocus.admin.module.business.spu.domain.entity.SpuEntity;
import cn.morefocus.admin.module.business.spu.domain.form.SpuPageQueryForm;
import cn.morefocus.admin.module.business.spu.domain.vo.SpuVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品
 */
@Mapper
@Component
public interface SpuMapper extends BaseMapper<SpuEntity> {

    /**
     * 分页 查询商品
     */
    List<SpuVO> query(Page page, @Param("query") SpuPageQueryForm query);

    /**
     * 批量更新删除状态
     */
    void batchUpdateDeleted(@Param("ids") List<Long> ids, @Param("isDeleted") Boolean isDeleted);
}
