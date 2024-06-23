package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuWarnConfigEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnConfigForm;
import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnConfigQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuWarnConfigVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuWarnConfigMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 商品库存预警 Service
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@Service
public class SkuWarnConfigService {

    @Resource
    private SkuWarnConfigMapper skuWarnConfigMapper;

    /**
     * 查询商品sku单价列表
     */
    public List<SkuWarnConfigVO> querySkuWarnConfigList(Long spuId) {
        return skuWarnConfigMapper.querySkuWarnConfigBySpuId(spuId);
    }

    /**
     * 分页查询
     */
    public PageResult<SkuWarnConfigVO> queryPage(SkuWarnConfigQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuWarnConfigVO> list = skuWarnConfigMapper.queryPage(page, queryForm);
        PageResult<SkuWarnConfigVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuWarnConfigVO> queryAll() {
        List<SkuWarnConfigVO> list = skuWarnConfigMapper.queryAll();
        return list;
    }

    /**
     * 更新商品库存预警
     */
    public void updateSkuWarnConfig(Long spuId, List<SkuWarnConfigForm> warnConfigList) {
        Wrapper<SkuWarnConfigEntity> spuInitialStockEntityWrapper = new QueryWrapper<SkuWarnConfigEntity>()
                .lambda().eq(SkuWarnConfigEntity::getSpuId, spuId);
        List<SkuWarnConfigEntity> skuEntityList = skuWarnConfigMapper.selectList(spuInitialStockEntityWrapper);
        Set<Long> updateIdList = new HashSet<>();
        for (SkuWarnConfigForm form : warnConfigList) {
            Wrapper<SkuWarnConfigEntity> wrapper = new QueryWrapper<SkuWarnConfigEntity>()
                    .lambda()
                    .eq(SkuWarnConfigEntity::getSkuId, form.getSkuId())
                    .eq(SkuWarnConfigEntity::getUnitId, form.getUnitId());
            SkuWarnConfigEntity skuWarnConfigEntity = skuWarnConfigMapper.selectOne(wrapper);
            if (null == skuWarnConfigEntity) {
                skuWarnConfigEntity = LocalBeanUtil.copy(form, SkuWarnConfigEntity.class);
                skuWarnConfigEntity.setSpuId(spuId);
                skuWarnConfigMapper.insert(skuWarnConfigEntity);
            } else {
                updateIdList.add(skuWarnConfigEntity.getId());
                LocalBeanUtil.copyProperties(form, skuWarnConfigEntity);
                skuWarnConfigMapper.updateById(skuWarnConfigEntity);
            }
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateIdList.add(item.getId())) {
                skuWarnConfigMapper.deleteById(item.getId());
            }
        });
    }
}
