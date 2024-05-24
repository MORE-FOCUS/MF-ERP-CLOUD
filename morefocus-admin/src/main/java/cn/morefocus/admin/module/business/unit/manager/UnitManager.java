package cn.morefocus.admin.module.business.unit.manager;

import cn.morefocus.admin.constant.AdminCacheConst;
import cn.morefocus.admin.module.business.unit.domain.entity.UnitEntity;
import cn.morefocus.admin.module.business.unit.domain.form.UnitQueryForm;
import cn.morefocus.admin.module.business.unit.domain.vo.UnitVO;
import cn.morefocus.admin.module.business.unit.mapper.UnitMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单位  Manager
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Slf4j
@Service
public class UnitManager extends ServiceImpl<UnitMapper, UnitEntity> {
    @Resource
    private UnitMapper unitMapper;

    @CacheEvict(value = {AdminCacheConst.Unit.UNIT_ENTITY, AdminCacheConst.Unit.UNIT_LIST}, allEntries = true)
    public void removeCache() {
        log.info("clear CATEGORY ,CATEGORY_SUB ,CATEGORY_TREE");
    }

    /**
     * 查询单位
     */
    @Cacheable(AdminCacheConst.Unit.UNIT_ENTITY)
    public UnitEntity queryUnit(Long unitId) {
        return unitMapper.selectById(unitId);
    }

    /**
     * 查询单位
     */
    @Cacheable(AdminCacheConst.Unit.UNIT_LIST)
    public List<UnitVO> queryUnit(UnitQueryForm form) {
        return unitMapper.queryAll(form);
    }
}
