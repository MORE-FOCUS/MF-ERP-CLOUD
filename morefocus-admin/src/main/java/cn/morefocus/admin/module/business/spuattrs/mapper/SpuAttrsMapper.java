package cn.morefocus.admin.module.business.spuattrs.mapper;

import cn.morefocus.admin.module.business.spuattrs.domain.entity.SpuAttrsEntity;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsPageQueryForm;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsQueryForm;
import cn.morefocus.admin.module.business.spuattrs.domain.vo.SpuAttrsVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品附加属性 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface SpuAttrsMapper extends BaseMapper<SpuAttrsEntity> {

    /**
     * 分页 查询
     */
    List<SpuAttrsVO> queryPage(Page page, @Param("queryForm") SpuAttrsPageQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SpuAttrsVO> queryAll(@Param("queryForm") SpuAttrsQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);

    /**
     * 根据商品ID删除
     */
    void deleteBySpuId(@Param("spuId") Long spuId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 根据商品ID删除
     */
    void deleteById(@Param("id") Long id, @Param("isDeleted") Boolean isDeleted);
}
