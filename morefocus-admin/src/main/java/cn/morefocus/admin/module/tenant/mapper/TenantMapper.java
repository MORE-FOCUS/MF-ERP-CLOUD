package cn.morefocus.admin.module.tenant.mapper;

import cn.morefocus.admin.module.tenant.domain.entity.TenantEntity;
import cn.morefocus.admin.module.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.tenant.domain.vo.TenantVO;
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
     *
     * @param page
     * @param queryForm
     * @return
     */
    List<TenantVO> queryPage(Page page, @Param("queryForm") TenantQueryForm queryForm);

}