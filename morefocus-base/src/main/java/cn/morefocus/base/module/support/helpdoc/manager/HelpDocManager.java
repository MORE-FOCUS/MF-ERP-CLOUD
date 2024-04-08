package cn.morefocus.base.module.support.helpdoc.manager;

import cn.morefocus.base.module.support.helpdoc.domain.entity.HelpDocEntity;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocRelationForm;
import cn.morefocus.base.module.support.helpdoc.mapper.HelpDocMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 帮助文档 manager
 *
 *
 */
@Service
public class HelpDocManager {

    @Resource
    private HelpDocMapper helpDocMapper;

    /**
     * 保存
     *
     * @param helpDocEntity
     * @param relationList
     */
    @Transactional(rollbackFor = Throwable.class)
    public void save(HelpDocEntity helpDocEntity, List<HelpDocRelationForm> relationList) {
        helpDocMapper.insert(helpDocEntity);
        Long helpDocId = helpDocEntity.getHelpDocId();
        // 保存关联
        if (CollectionUtils.isNotEmpty(relationList)) {
            helpDocMapper.insertRelation(helpDocId, relationList);
        }
    }

    /**
     * 更新
     *
     * @param helpDocEntity
     * @param relationList
     */
    @Transactional(rollbackFor = Throwable.class)
    public void update(HelpDocEntity helpDocEntity, List<HelpDocRelationForm> relationList) {
        helpDocMapper.updateById(helpDocEntity);
        Long helpDocId = helpDocEntity.getHelpDocId();
        // 保存关联
        if (CollectionUtils.isNotEmpty(relationList)) {
            helpDocMapper.deleteRelation(helpDocId);
            helpDocMapper.insertRelation(helpDocId, relationList);
        }
    }
}
