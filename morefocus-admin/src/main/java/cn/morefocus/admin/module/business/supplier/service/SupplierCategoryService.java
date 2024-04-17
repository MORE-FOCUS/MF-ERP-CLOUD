package cn.morefocus.admin.module.business.supplier.service;

import cn.morefocus.admin.module.business.supplier.domain.entity.SupplierCategoryEntity;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryAddForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryQueryForm;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryUpdateForm;
import cn.morefocus.admin.module.business.supplier.domain.vo.SupplierCategoryVO;
import cn.morefocus.admin.module.business.supplier.mapper.SupplierCategoryMapper;
import cn.morefocus.base.common.code.UserErrorCode;
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
 * ERP供应商类别 Service
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@Service
public class SupplierCategoryService {

    @Resource
    private SupplierCategoryMapper supplierCategoryMapper;

    /**
     * 分页查询
     */
    public PageResult<SupplierCategoryVO> queryPage(SupplierCategoryQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SupplierCategoryVO> list = supplierCategoryMapper.queryPage(page, queryForm);
        PageResult<SupplierCategoryVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 分页查询
     */
    public List<SupplierCategoryVO> queryAll() {
        List<SupplierCategoryVO> list = supplierCategoryMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(SupplierCategoryAddForm addForm) {
        //父节点
        if (null != addForm.getPid()) {
            SupplierCategoryEntity parent = supplierCategoryMapper.selectById(addForm.getPid());
            if (null == parent) {
                return R.error(UserErrorCode.DATA_NOT_EXIST, "");
            }
        }

        SupplierCategoryEntity supplierCategoryEntity = LocalBeanUtil.copy(addForm, SupplierCategoryEntity.class);

        supplierCategoryMapper.insert(supplierCategoryEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(SupplierCategoryUpdateForm updateForm) {
        SupplierCategoryEntity supplierCategoryEntity = LocalBeanUtil.copy(updateForm, SupplierCategoryEntity.class);
        supplierCategoryMapper.updateById(supplierCategoryEntity);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        supplierCategoryMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        supplierCategoryMapper.deleteById(id);
        return R.ok();
    }
}
