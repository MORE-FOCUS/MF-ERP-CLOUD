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
        spuUnitMapper.deleteBySpuId(spuId, Boolean.TRUE);
    }

    /**
     * 更新多单位
     */
    public void updateSpuUnit(Long spuId, List<SpuUnitForm> spuUnitList) {
        if (CollectionUtils.isEmpty(spuUnitList)) {
            spuUnitMapper.deleteBySpuId(spuId, Boolean.TRUE);
            return;
        }

        Wrapper<SpuUnitEntity> wrapper = new QueryWrapper<SpuUnitEntity>()
                .lambda().eq(SpuUnitEntity::getSpuId, spuId);
        List<SpuUnitEntity> orginalSpuUnitList = spuUnitMapper.selectList(wrapper);

        Set<Long> keepUnitList = new HashSet<>();
        for (SpuUnitForm form : spuUnitList) {
            wrapper = new QueryWrapper<SpuUnitEntity>()
                    .lambda().eq(SpuUnitEntity::getSpuId, spuId)
                    .eq(SpuUnitEntity::getUnitId, form.getUnitId());
            SpuUnitEntity spuUnit = spuUnitMapper.selectOne(wrapper);
            if (null == spuUnit) {
                spuUnit = LocalBeanUtil.copy(form, SpuUnitEntity.class);
                spuUnitMapper.insert(spuUnit);
            } else {
                keepUnitList.add(spuUnit.getSpuId());
                spuUnit.setBasicUnitId(form.getBasicUnitId());
                spuUnit.setBasicUnitName(form.getBasicUnitName());
                spuUnit.setUnitName(form.getUnitName());
                spuUnit.setExchange(form.getExchange());
                spuUnit.setIsDisabled(form.getIsDisabled());
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
