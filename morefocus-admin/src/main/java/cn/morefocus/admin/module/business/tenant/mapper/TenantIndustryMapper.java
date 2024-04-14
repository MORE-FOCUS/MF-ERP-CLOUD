package cn.morefocus.admin.module.business.tenant.mapper;

import cn.morefocus.admin.module.business.tenant.domain.entity.TenantIndustryEntity;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryQueryForm;
import cn.morefocus.admin.module.business.tenant.domain.vo.TenantIndustryVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 租户所属行业 Mapper
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@Mapper
@Component
public interface TenantIndustryMapper extends BaseMapper<TenantIndustryEntity> {

    /**
     * 分页查询
     */
    List<TenantIndustryVO> queryPage(Page page, @Param("queryForm") TenantIndustryQueryForm queryForm);

    /**
     * 更新禁用启用
     */
    void updateDisableFlag(@Param("id") Long id, @Param("disabledFlag") Boolean disabledFlag);
}
