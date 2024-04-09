package cn.morefocus.admin.module.tenant.service;

import cn.morefocus.admin.module.tenant.domain.entity.TenantEntity;
import cn.morefocus.admin.module.tenant.domain.form.TenantAddForm;
import cn.morefocus.admin.module.tenant.domain.form.TenantQueryForm;
import cn.morefocus.admin.module.tenant.domain.form.TenantUpdateForm;
import cn.morefocus.admin.module.tenant.domain.vo.TenantVO;
import cn.morefocus.admin.module.tenant.mapper.TenantMapper;
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
 * 租户 Service
 *
 * @author loki
 * @date 2024-04-09 00:06:01
 */
@Service
public class TenantService {

    @Resource
    private TenantMapper ttenantMapper;

    /**
     * 分页查询
     *
     * @param queryForm
     * @return
     */
    public PageResult<TenantVO> queryPage(TenantQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<TenantVO> list = ttenantMapper.queryPage(page, queryForm);
        PageResult<TenantVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 添加
     */
    public R<String> add(TenantAddForm addForm) {
        TenantEntity tenantEntity = LocalBeanUtil.copy(addForm, TenantEntity.class);
        ttenantMapper.insert(tenantEntity);
        return R.ok();
    }

    /**
     * 更新
     *
     * @param updateForm
     * @return
     */
    public R<String> update(TenantUpdateForm updateForm) {
        TenantEntity ttenantEntity = LocalBeanUtil.copy(updateForm, TenantEntity.class);
        ttenantMapper.updateById(ttenantEntity);
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

        ttenantMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        ttenantMapper.deleteById(id);
        return R.ok();
    }
}
