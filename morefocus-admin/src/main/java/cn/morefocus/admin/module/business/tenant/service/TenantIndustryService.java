package cn.morefocus.admin.module.business.tenant.service;

import cn.morefocus.admin.module.business.tenant.domain.entity.TenantIndustryEntity;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryAddForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryQueryForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantIndustryUpdateForm;
import cn.morefocus.admin.module.business.tenant.domain.vo.TenantIndustryVO;
import cn.morefocus.admin.module.business.tenant.mapper.TenantIndustryMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
     */
    public PageResult<TenantIndustryVO> queryPage(TenantIndustryQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<TenantIndustryVO> list = tenantIndustryMapper.queryPage(page, queryForm);
        PageResult<TenantIndustryVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<TenantIndustryVO> queryAll() {
        Wrapper<TenantIndustryEntity> wrapper = new QueryWrapper<TenantIndustryEntity>()
                .eq("enabled", Boolean.TRUE);
        List<TenantIndustryEntity> list = tenantIndustryMapper.selectList(wrapper);
        return LocalBeanUtil.copyList(list, TenantIndustryVO.class);
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
     */
    public R<String> update(TenantIndustryUpdateForm updateForm) {
        TenantIndustryEntity tenantIndustryEntity = LocalBeanUtil.copy(updateForm, TenantIndustryEntity.class);
        tenantIndustryMapper.updateById(tenantIndustryEntity);
        return R.ok();
    }

    /**
     * 批量更新行业状态
     */
    public R<String> updateDisableFlag(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        TenantIndustryEntity tenantIndustryEntity = tenantIndustryMapper.selectById(id);
        if (null == tenantIndustryEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        tenantIndustryMapper.updateDisableFlag(id, !tenantIndustryEntity.getDisabledFlag());

        return R.ok();
    }

    /**
     * 批量删除
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
