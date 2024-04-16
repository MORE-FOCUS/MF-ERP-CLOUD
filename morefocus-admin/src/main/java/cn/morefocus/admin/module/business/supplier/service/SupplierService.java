package cn.morefocus.admin.module.business.supplier.service;

import cn.morefocus.admin.module.business.supplier.domain.entity.SupplierEntity;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierAddForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierQueryForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierUpdateForm;
import cn.morefocus.admin.module.business.supplier.domain.vo.SupplierVO;
import cn.morefocus.admin.module.business.supplier.mapper.SupplierMapper;
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
 * 供应商 Service
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@Service
public class SupplierService {

    @Resource
    private SupplierMapper supplierMapper;

    /**
     * 分页查询
     */
    public PageResult<SupplierVO> queryPage(SupplierQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SupplierVO> list = supplierMapper.queryPage(page, queryForm);
        PageResult<SupplierVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 添加
     */
    public R<String> add(SupplierAddForm addForm) {
        SupplierEntity supplierEntity = LocalBeanUtil.copy(addForm, SupplierEntity.class);
        supplierMapper.insert(supplierEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(SupplierUpdateForm updateForm) {
        SupplierEntity supplierEntity = LocalBeanUtil.copy(updateForm, SupplierEntity.class);
        supplierMapper.updateById(supplierEntity);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        supplierMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        supplierMapper.deleteById(id);
        return R.ok();
    }
}
