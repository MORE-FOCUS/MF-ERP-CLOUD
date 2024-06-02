package cn.morefocus.admin.module.business.spuattrs.service;

import cn.morefocus.admin.module.business.attrs.domain.entity.AttrsEntity;
import cn.morefocus.admin.module.business.attrs.manager.AttrsManager;
import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import cn.morefocus.admin.module.business.category.manager.CategoryManager;
import cn.morefocus.admin.module.business.spuattrs.domain.entity.SpuAttrsEntity;
import cn.morefocus.admin.module.business.spuattrs.domain.form.SpuAttrsSelectedForm;
import cn.morefocus.admin.module.business.spuattrs.mapper.SpuAttrsMapper;
import cn.morefocus.base.common.exception.BusinessException;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

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
    @Resource
    private CategoryManager categoryManager;
    @Resource
    private AttrsManager attrsManager;

    /**
     * 更新商品属性
     */
    @Transactional(rollbackFor = Exception.class)
    public synchronized void updateSpuAttrs(Long spuId, List<SpuAttrsSelectedForm> attrsList) {
        SpuAttrsEntity entity = querySpuAttrs(spuId);
        if (null == entity) {
            entity = new SpuAttrsEntity();
            entity.setSpuId(spuId);
            entity.setAttrs(buildAttrs(attrsList));
            spuAttrsMapper.insert(entity);
        } else {
            entity.setAttrs(buildAttrs(attrsList));
            spuAttrsMapper.updateById(entity);
        }
    }

    /**
     * 构建属性
     */
    private String buildAttrs(List<SpuAttrsSelectedForm> selectedSpuAttrsList) {
        for (SpuAttrsSelectedForm selected : selectedSpuAttrsList) {
            CategoryEntity categoryEntity = categoryManager.queryCategory(selected.getCategoryId());
            if (null == categoryEntity) {
                throw new BusinessException("属性类目不存在");
            }
            selected.setCategoryName(categoryEntity.getCategoryName());

            selected.getSelectedAttrsList().forEach(attrs -> {
                AttrsEntity attrsEntity = attrsManager.queryAttrs(attrs.getId());
                if (null == attrsEntity) {
                    throw new BusinessException("属性不存在");
                }

                attrs.setName(attrsEntity.getName());
            });
        }

        return JSON.toJSONString(selectedSpuAttrsList);
    }

    /**
     * 查询Spu属性
     */
    public SpuAttrsEntity querySpuAttrs(Long spuId) {
        Wrapper<SpuAttrsEntity> wrapper = new QueryWrapper<SpuAttrsEntity>()
                .lambda().eq(SpuAttrsEntity::getSpuId, spuId);
        return spuAttrsMapper.selectOne(wrapper);
    }
}
