package cn.morefocus.admin.module.business.attrs.manager;

import cn.morefocus.admin.constant.AdminCacheConst;
import cn.morefocus.admin.module.business.attrs.domain.entity.AttrsEntity;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import cn.morefocus.admin.module.business.attrs.mapper.AttrsMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 辅助属性  Manager
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Slf4j
@Service
public class AttrsManager extends ServiceImpl<AttrsMapper, AttrsEntity> {
    @Resource
    private AttrsMapper attrsMapper;

    @CacheEvict(value = {AdminCacheConst.Attrs.ATTRS_LIST}, allEntries = true)
    public void removeCache() {
        log.info("clear ATTRS_LIST");
    }

    /**
     * 查询辅助属性
     */
    @Cacheable(AdminCacheConst.Attrs.ATTRS_LIST)
    public List<AttrsVO> queryAttrs(AttrsQueryForm form) {
        return attrsMapper.queryAll(form);
    }
}
