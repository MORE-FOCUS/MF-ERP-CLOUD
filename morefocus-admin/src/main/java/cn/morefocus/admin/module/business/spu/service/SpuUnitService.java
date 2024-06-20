package cn.morefocus.admin.module.business.spu.service;

import cn.morefocus.admin.module.business.spu.domain.entity.SpuUnitEntity;
import cn.morefocus.admin.module.business.spu.domain.form.SpuUnitForm;
import cn.morefocus.admin.module.business.spu.domain.form.SpuUnitPageQueryForm;
import cn.morefocus.admin.module.business.spu.domain.form.SpuUnitQueryForm;
import cn.morefocus.admin.module.business.spu.domain.vo.SpuUnitVO;
import cn.morefocus.admin.module.business.spu.mapper.SpuUnitMapper;
import cn.morefocus.admin.module.business.unit.domain.entity.UnitEntity;
import cn.morefocus.admin.module.business.unit.manager.UnitManager;
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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    @Resource
    private UnitManager unitManager;

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
     * 查询商品基础单位
     */
    public SpuUnitVO querySpuBasicUnit(Long spuId) {
        return spuUnitMapper.querySpuBasicUnit(spuId);
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateIsDisabled(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        SpuUnitEntity spuUnitEntity = spuUnitMapper.selectById(id);
        if (null == spuUnitEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        spuUnitMapper.updateIsDisabled(id, !spuUnitEntity.getIsDisabled());

        return R.ok();
    }

    /**
     * 删除商品多单位
     */
    public void deleteBySpuId(Long spuId) {
        spuUnitMapper.deleteBySpuId(spuId);
    }

    /**
     * 删除商品多单位
     */
    public void deleteBySpuIdExcludeBasicUnit(Long spuId) {
        spuUnitMapper.deleteBySpuIdExcludeBasicUnit(spuId);
    }

    /**
     * 更新基础单位
     */
    public void updateSpuBasicUnit(Long spuId, Long unitId) {
        Wrapper<SpuUnitEntity> wrapper = new QueryWrapper<SpuUnitEntity>()
                .lambda().eq(SpuUnitEntity::getSpuId, spuId)
                .eq(SpuUnitEntity::getIsBasicUnit, Boolean.TRUE);
        SpuUnitEntity basicUnit = spuUnitMapper.selectOne(wrapper);
        if (null == basicUnit) {
            basicUnit = new SpuUnitEntity();
            basicUnit.setSpuId(spuId);
            basicUnit.setUnitId(unitId);
            basicUnit.setIsBasicUnit(Boolean.TRUE);
            basicUnit.setIsDisabled(Boolean.FALSE);
            UnitEntity unitEntity = unitManager.queryUnit(unitId);
            if (null != unitEntity) {
                basicUnit.setUnitName(unitEntity.getName());
            }
            spuUnitMapper.insert(basicUnit);
        } else {
            basicUnit.setUnitId(unitId);
            UnitEntity unitEntity = unitManager.queryUnit(unitId);
            if (null != unitEntity) {
                basicUnit.setUnitName(unitEntity.getName());
            }
            spuUnitMapper.updateById(basicUnit);
        }
    }

    /**
     * 更新多单位
     */
    public void updateSpuUnit(Long spuId, List<SpuUnitForm> unitList) {
        if (CollectionUtils.isEmpty(unitList)) {
            spuUnitMapper.deleteBySpuIdExcludeBasicUnit(spuId);
            return;
        }

        Wrapper<SpuUnitEntity> wrapper = new QueryWrapper<SpuUnitEntity>()
                .lambda().eq(SpuUnitEntity::getSpuId, spuId);
        List<SpuUnitEntity> orginalSpuUnitList = spuUnitMapper.selectList(wrapper);

        Set<Long> keepUnitList = new HashSet<>();
        for (SpuUnitForm form : unitList) {
            wrapper = new QueryWrapper<SpuUnitEntity>()
                    .lambda().eq(SpuUnitEntity::getSpuId, spuId)
                    .eq(SpuUnitEntity::getUnitId, form.getUnitId());
            SpuUnitEntity spuUnit = spuUnitMapper.selectOne(wrapper);
            if (null == spuUnit) {
                spuUnit = LocalBeanUtil.copy(form, SpuUnitEntity.class);
                spuUnit.setSpuId(spuId);

                UnitEntity unitEntity = unitManager.queryUnit(form.getUnitId());
                if (null != unitEntity) {
                    spuUnit.setUnitName(unitEntity.getName());
                }

                spuUnitMapper.insert(spuUnit);
            } else {
                keepUnitList.add(spuUnit.getId());
                spuUnit.setSpuId(spuId);
                spuUnit.setIsBasicUnit(form.getIsBasicUnit());
                spuUnit.setBasicUnitId(form.getBasicUnitId());
                spuUnit.setBasicUnitName(form.getBasicUnitName());
                spuUnit.setExchange(form.getExchange());
                spuUnit.setIsDisabled(form.getIsDisabled());

                UnitEntity unitEntity = unitManager.queryUnit(form.getUnitId());
                if (null != unitEntity) {
                    spuUnit.setUnitName(unitEntity.getName());
                }
                spuUnitMapper.updateById(spuUnit);
            }
        }

        //清除已经被删除的
        orginalSpuUnitList.forEach(item -> {
            if (!keepUnitList.contains(item.getId())) {
                spuUnitMapper.deleteById(item.getId(), Boolean.TRUE);
            }
        });
    }
}
