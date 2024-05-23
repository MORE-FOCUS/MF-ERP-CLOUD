package cn.morefocus.admin.module.business.spuunit.service;

import cn.morefocus.admin.module.business.spuunit.domain.entity.SpuUnitEntity;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitForm;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitPageQueryForm;
import cn.morefocus.admin.module.business.spuunit.domain.form.SpuUnitQueryForm;
import cn.morefocus.admin.module.business.spuunit.domain.vo.SpuUnitVO;
import cn.morefocus.admin.module.business.spuunit.mapper.SpuUnitMapper;
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
 * 单位 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class SpuUnitService {

    @Resource
    private SpuUnitMapper spuUnitMapper;

    /**
     * 分页查询
     */
    public PageResult<SpuUnitVO> queryPage(SpuUnitPageQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SpuUnitVO> list = spuUnitMapper.queryPage(page, queryForm);
        PageResult<SpuUnitVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SpuUnitVO> queryAll(SpuUnitQueryForm queryForm) {
        List<SpuUnitVO> list = spuUnitMapper.queryAll(queryForm);
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(SpuUnitForm addForm) {
        SpuUnitEntity warehouseEntity = LocalBeanUtil.copy(addForm, SpuUnitEntity.class);
        spuUnitMapper.insert(warehouseEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(SpuUnitUpdateForm updateForm) {
        SpuUnitEntity warehouseEntity = LocalBeanUtil.copy(updateForm, SpuUnitEntity.class);
        spuUnitMapper.updateById(warehouseEntity);
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

        spuUnitMapper.deleteBatchIds(idList);
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

        spuUnitMapper.deleteById(id);
        return R.ok();
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateIsDisabled(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        SpuUnitEntity warehouseEntity = spuUnitMapper.selectById(id);
        if (null == warehouseEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        spuUnitMapper.updateIsDisabled(id, !warehouseEntity.getIsDisabled());

        return R.ok();
    }
}
