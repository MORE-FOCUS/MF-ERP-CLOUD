package cn.morefocus.admin.module.business.brand.mapper;

import cn.morefocus.admin.module.business.brand.domain.entity.BrandEntity;
import cn.morefocus.admin.module.business.brand.domain.form.BrandPageQueryForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandQueryForm;
import cn.morefocus.admin.module.business.brand.domain.vo.BrandVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 品牌 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface BrandMapper extends BaseMapper<BrandEntity> {

    /**
     * 分页 查询
     */
    List<BrandVO> queryPage(Page page, @Param("queryForm") BrandPageQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<BrandVO> queryAll(@Param("queryForm") BrandQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);
}
