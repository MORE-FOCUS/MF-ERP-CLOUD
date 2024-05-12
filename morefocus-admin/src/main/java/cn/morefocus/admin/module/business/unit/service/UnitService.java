package cn.morefocus.admin.module.business.unit.service;

import cn.morefocus.admin.module.business.unit.domain.entity.UnitEntity;
import cn.morefocus.admin.module.business.unit.domain.form.UnitAddForm;
import cn.morefocus.admin.module.business.unit.domain.form.UnitPageQueryForm;
import cn.morefocus.admin.module.business.unit.domain.form.UnitUpdateForm;
import cn.morefocus.admin.module.business.unit.domain.vo.UnitVO;
import cn.morefocus.admin.module.business.unit.mapper.UnitMapper;
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
public class UnitService {

    @Resource
    private UnitMapper unitMapper;

    /**
     * 分页查询
     */
    public PageResult<UnitVO> queryPage(UnitPageQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<UnitVO> list = unitMapper.queryPage(page, queryForm);
        PageResult<UnitVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<UnitVO> queryAll(UnitPageQueryForm queryForm) {
        List<UnitVO> list = unitMapper.queryAll(queryForm);
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(UnitAddForm addForm) {
        UnitEntity warehouseEntity = LocalBeanUtil.copy(addForm, UnitEntity.class);
        unitMapper.insert(warehouseEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(UnitUpdateForm updateForm) {
        UnitEntity warehouseEntity = LocalBeanUtil.copy(updateForm, UnitEntity.class);
        unitMapper.updateById(warehouseEntity);
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

        unitMapper.deleteBatchIds(idList);
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

        unitMapper.deleteById(id);
        return R.ok();
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateIsDisabled(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        UnitEntity warehouseEntity = unitMapper.selectById(id);
        if (null == warehouseEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        unitMapper.updateIsDisabled(id, !warehouseEntity.getIsDisabled());

        return R.ok();
    }
}
