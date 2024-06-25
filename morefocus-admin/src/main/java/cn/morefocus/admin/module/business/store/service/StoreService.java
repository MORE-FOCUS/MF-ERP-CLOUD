package cn.morefocus.admin.module.business.store.service;

import cn.morefocus.admin.module.business.store.domain.entity.StoreEntity;
import cn.morefocus.admin.module.business.store.domain.form.StoreAddForm;
import cn.morefocus.admin.module.business.store.domain.form.StoreQueryForm;
import cn.morefocus.admin.module.business.store.domain.form.StoreUpdateForm;
import cn.morefocus.admin.module.business.store.domain.vo.StoreVO;
import cn.morefocus.admin.module.business.store.mapper.StoreMapper;
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
 * 门店 Service
 * 合并到组织机构
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Service
public class StoreService {

    @Resource
    private StoreMapper storeMapper;

    /**
     * 分页查询
     */
    public PageResult<StoreVO> queryPage(StoreQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<StoreVO> list = storeMapper.queryPage(page, queryForm);
        PageResult<StoreVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<StoreVO> queryAll() {
        List<StoreVO> list = storeMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(StoreAddForm addForm) {
        StoreEntity storeEntity = LocalBeanUtil.copy(addForm, StoreEntity.class);
        storeMapper.insert(storeEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(StoreUpdateForm updateForm) {
        StoreEntity storeEntity = LocalBeanUtil.copy(updateForm, StoreEntity.class);
        storeMapper.updateById(storeEntity);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        storeMapper.batchUpdateDeleted(idList, true);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        storeMapper.updateDeleted(id, true);
        return R.ok();
    }
}
