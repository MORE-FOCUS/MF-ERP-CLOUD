package cn.morefocus.admin.module.tenantindustry.service;

import cn.morefocus.admin.module.tenantindustry.domain.entity.TenantIndustryEntity;
import cn.morefocus.admin.module.tenantindustry.domain.form.TenantIndustryAddForm;
import cn.morefocus.admin.module.tenantindustry.domain.form.TenantIndustryQueryForm;
import cn.morefocus.admin.module.tenantindustry.domain.form.TenantIndustryUpdateForm;
import cn.morefocus.admin.module.tenantindustry.domain.vo.TenantIndustryVO;
import cn.morefocus.admin.module.tenantindustry.mapper.TenantIndustryMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 租户所属行业 Service
 *
 * @author loki
 * @date 2024-04-09 00:06:08
 */
@Service
public class TenantIndustryService {

    @Resource
    private TenantIndustryMapper tenantIndustryMapper;

    /**
     * 分页查询
     *
     * @param queryForm
     * @return
     */
    public PageResult<TenantIndustryVO> queryPage(TenantIndustryQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<TenantIndustryVO> list = tenantIndustryMapper.queryPage(page, queryForm);
        PageResult<TenantIndustryVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 添加
     */
    public R<String> add(TenantIndustryAddForm addForm) {
        TenantIndustryEntity tenantIndustryEntity = LocalBeanUtil.copy(addForm, TenantIndustryEntity.class);
        tenantIndustryMapper.insert(tenantIndustryEntity);
        return R.ok();
    }

    /**
     * 更新
     *
     * @param updateForm
     * @return
     */
    public R<String> update(TenantIndustryUpdateForm updateForm) {
        TenantIndustryEntity tenantIndustryEntity = LocalBeanUtil.copy(updateForm, TenantIndustryEntity.class);
        tenantIndustryMapper.updateById(tenantIndustryEntity);
        return R.ok();
    }

    /**
     * 批量删除
     *
     * @param idList
     * @return
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        tenantIndustryMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        tenantIndustryMapper.deleteById(id);
        return R.ok();
    }
}
