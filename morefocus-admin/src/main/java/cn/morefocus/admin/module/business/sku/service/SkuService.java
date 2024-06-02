package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.entity.SkuEntity;
import cn.morefocus.admin.module.business.sku.domain.form.SkuForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuMapper;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * SKU Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class SkuService {

    @Resource
    private SkuMapper skuMapper;

    /**
     * 查询商品sku列表
     */
    public List<SkuVO> querySpuSku(Long spuId) {
        return skuMapper.querySkuBySpuId(spuId);
    }

    /**
     * 更新商品sku
     */
    public synchronized void updateSku(Long spuId, List<SkuForm> skuList) {
        List<SkuEntity> skuEntityList = querySpuSkuList(spuId);
        Set<Long> updateSkuIdList = new HashSet<>();
        for (SkuForm form : skuList) {
            Wrapper<SkuEntity> wrapper = new QueryWrapper<SkuEntity>()
                    .lambda().eq(SkuEntity::getSpuId, spuId)
                    .eq(SkuEntity::getSkuNo, form.getSkuNo());
            SkuEntity skuEntity = skuMapper.selectOne(wrapper);
            if (null == skuEntity) {
                skuEntity = new SkuEntity();
                skuEntity.setSpuId(spuId);
                skuEntity.setAttrsName(form.getAttrsName());
                skuEntity.setAttrs(JSON.toJSONString(form.getAttrsList()));
                skuEntity.setSkuName(form.getSkuName());
                skuMapper.insert(skuEntity);
            } else {
                updateSkuIdList.add(skuEntity.getId());
                skuEntity.setAttrsName(form.getAttrsName());
                skuEntity.setAttrs(JSON.toJSONString(form.getAttrsList()));
                skuEntity.setSkuName(form.getSkuName());
                skuMapper.updateById(skuEntity);
            }
        }

        //移除删除
        skuEntityList.forEach(item -> {
            if (updateSkuIdList.add(item.getId())) {
                skuMapper.updateIsDeleted(item.getId());
            }
        });
    }

    /**
     * 查询Spu属性
     */
    public List<SkuEntity> querySpuSkuList(Long spuId) {
        Wrapper<SkuEntity> wrapper = new QueryWrapper<SkuEntity>()
                .lambda().eq(SkuEntity::getSpuId, spuId);
        return skuMapper.selectList(wrapper);
    }
}
