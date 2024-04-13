package cn.morefocus.admin.module.business.tenant.service;

import cn.morefocus.admin.module.business.tenant.domain.entity.TenantEntity;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantAddForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantRegisterForm;
import cn.morefocus.admin.module.business.tenant.domain.form.TenantUpdateForm;
import cn.morefocus.admin.module.business.tenant.domain.vo.TenantVO;
import cn.morefocus.admin.module.business.tenant.mapper.TenantIndustryMapper;
import cn.morefocus.admin.module.business.tenant.mapper.TenantMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 租户 Service
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@Service
public class TenantService {

    @Resource
    private TenantMapper tenantMapper;
    @Resource
    private TenantIndustryMapper tenantIndustryMapper;
    
    /**
     * 分页查询
     */
    public PageResult<TenantVO> queryPage(TenantQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<TenantVO> list = tenantMapper.queryPage(page, queryForm);
        PageResult<TenantVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 添加
     */
    public R<String> add(TenantAddForm addForm) {
        TenantEntity tenantEntity = LocalBeanUtil.copy(addForm, TenantEntity.class);
        tenantMapper.insert(tenantEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(TenantUpdateForm updateForm) {
        TenantEntity ttenantEntity = LocalBeanUtil.copy(updateForm, TenantEntity.class);
        tenantMapper.updateById(ttenantEntity);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        tenantMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        tenantMapper.deleteById(id);
        return R.ok();
    }

    /**
     * 注册
     */
    public void register(@RequestBody @Valid TenantRegisterForm registerForm) {
        //TODO
    }
}
