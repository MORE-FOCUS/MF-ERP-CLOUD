package cn.morefocus.admin.module.business.tenant.mapper;

import cn.morefocus.admin.module.business.tenant.domain.entity.TenantEntity;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.business.tenant.domain.vo.TenantVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 租户 Mapper
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@Mapper
@Component
public interface TenantMapper extends BaseMapper<TenantEntity> {

    /**
     * 分页 查询
     */
    List<TenantVO> queryPage(Page page, @Param("queryForm") TenantQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);
}
