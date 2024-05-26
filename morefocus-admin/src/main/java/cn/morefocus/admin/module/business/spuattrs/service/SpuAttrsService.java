package cn.morefocus.admin.module.business.spuattrs.service;

import cn.morefocus.admin.module.business.spuattrs.domain.entity.SpuAttrsEntity;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsForm;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsPageQueryForm;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsQueryForm;
import cn.morefocus.admin.module.business.spuattrs.domain.vo.SpuAttrsVO;
import cn.morefocus.admin.module.business.spuattrs.mapper.SpuAttrsMapper;
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
 * 商品附加属性 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class SpuAttrsService {

    @Resource
    private SpuAttrsMapper spuAttrsMapper;

    /**
     * 分页查询
     */
    public PageResult<SpuAttrsVO> queryPage(SpuAttrsPageQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SpuAttrsVO> list = spuAttrsMapper.queryPage(page, queryForm);
        PageResult<SpuAttrsVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SpuAttrsVO> queryAll(SpuAttrsQueryForm queryForm) {
        List<SpuAttrsVO> list = spuAttrsMapper.queryAll(queryForm);
        return list;
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateIsDisabled(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        SpuAttrsEntity spuUnitEntity = spuAttrsMapper.selectById(id);
        if (null == spuUnitEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        spuAttrsMapper.updateIsDisabled(id, !spuUnitEntity.getIsDisabled());

        return R.ok();
    }

    /**
     * 删除商品多单位
     */
    public void deleteBySpuId(Long spuId) {
        spuAttrsMapper.deleteBySpuId(spuId, Boolean.TRUE);
    }

    /**
     * 更新多单位
     */
    public void updateSpuUnit(Long spuId, List<SpuAttrsForm> spuUnitList) {
        if (CollectionUtils.isEmpty(spuUnitList)) {
            spuAttrsMapper.deleteBySpuId(spuId, Boolean.TRUE);
            return;
        }

        Wrapper<SpuAttrsEntity> wrapper = new QueryWrapper<SpuAttrsEntity>()
                .lambda().eq(SpuAttrsEntity::getSpuId, spuId);
        List<SpuAttrsEntity> orginalSpuUnitList = spuAttrsMapper.selectList(wrapper);

        Set<Long> keepUnitList = new HashSet<>();
        for (SpuAttrsForm form : spuUnitList) {
            wrapper = new QueryWrapper<SpuAttrsEntity>()
                    .lambda().eq(SpuAttrsEntity::getSpuId, spuId)
                    .eq(SpuAttrsEntity::getUnitId, form.getUnitId());
            SpuAttrsEntity spuUnit = spuAttrsMapper.selectOne(wrapper);
            if (null == spuUnit) {
                spuUnit = LocalBeanUtil.copy(form, SpuAttrsEntity.class);
                spuAttrsMapper.insert(spuUnit);
            } else {
                keepUnitList.add(spuUnit.getSpuId());
                spuUnit.setBasicUnitId(form.getBasicUnitId());
                spuUnit.setBasicUnitName(form.getBasicUnitName());
                spuUnit.setUnitName(form.getUnitName());
                spuUnit.setExchange(form.getExchange());
                spuUnit.setIsDisabled(form.getIsDisabled());
                spuAttrsMapper.updateById(spuUnit);
            }
        }

        //清除已经被删除的
        orginalSpuUnitList.forEach(item -> {
            if (!keepUnitList.contains(item.getId())) {
                spuAttrsMapper.deleteById(item.getId(), Boolean.TRUE);
            }
        });
    }
}
