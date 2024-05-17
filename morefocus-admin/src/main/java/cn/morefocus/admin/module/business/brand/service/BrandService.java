package cn.morefocus.admin.module.business.brand.service;

import cn.morefocus.admin.module.business.brand.domain.entity.BrandEntity;
import cn.morefocus.admin.module.business.brand.domain.form.BrandAddForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandPageQueryForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandQueryForm;
import cn.morefocus.admin.module.business.brand.domain.form.BrandUpdateForm;
import cn.morefocus.admin.module.business.brand.domain.vo.BrandVO;
import cn.morefocus.admin.module.business.brand.mapper.BrandMapper;
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
 * 品牌 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class BrandService {

    @Resource
    private BrandMapper brandMapper;

    /**
     * 分页查询
     */
    public PageResult<BrandVO> queryPage(BrandPageQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<BrandVO> list = brandMapper.queryPage(page, queryForm);
        PageResult<BrandVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<BrandVO> queryAll(BrandQueryForm queryForm) {
        List<BrandVO> list = brandMapper.queryAll(queryForm);
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(BrandAddForm addForm) {
        BrandEntity warehouseEntity = LocalBeanUtil.copy(addForm, BrandEntity.class);
        brandMapper.insert(warehouseEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(BrandUpdateForm updateForm) {
        BrandEntity warehouseEntity = LocalBeanUtil.copy(updateForm, BrandEntity.class);
        brandMapper.updateById(warehouseEntity);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        //TODO 单位被使用不能删除

        brandMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        //TODO 单位被使用不能删除

        brandMapper.deleteById(id);
        return R.ok();
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateIsDisabled(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        BrandEntity warehouseEntity = brandMapper.selectById(id);
        if (null == warehouseEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        brandMapper.updateIsDisabled(id, !warehouseEntity.getIsDisabled());

        return R.ok();
    }
}
