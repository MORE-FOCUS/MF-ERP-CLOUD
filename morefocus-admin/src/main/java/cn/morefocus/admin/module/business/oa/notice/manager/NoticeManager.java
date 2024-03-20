package cn.morefocus.admin.module.business.oa.notice.manager;

import cn.morefocus.admin.module.business.oa.notice.mapper.NoticeMapper;
import cn.morefocus.admin.module.business.oa.notice.domain.entity.NoticeEntity;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeVisibleRangeForm;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import cn.morefocus.base.module.support.datatracer.service.DataTracerService;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 通知、公告 manager
 *
 * @author loki
 */
@Service
public class NoticeManager {

    @Resource
    private NoticeMapper noticeMapper;

    @Resource
    private DataTracerService dataTracerService;

    /**
     * 保存
     */
    @Transactional(rollbackFor = Throwable.class)
    public void save(NoticeEntity noticeEntity, List<NoticeVisibleRangeForm> visibleRangeFormList) {
        noticeMapper.insert(noticeEntity);
        Long noticeId = noticeEntity.getNoticeId();
        // 保存可见范围
        if (CollectionUtils.isNotEmpty(visibleRangeFormList)) {
            noticeMapper.insertVisibleRange(noticeId, visibleRangeFormList);
        }
        dataTracerService.insert(noticeId, DataTracerTypeEnum.OA_NOTICE);
    }

    /**
     * 更新
     */
    @Transactional(rollbackFor = Throwable.class)
    public void update(NoticeEntity old, NoticeEntity noticeEntity, List<NoticeVisibleRangeForm> visibleRangeList) {
        noticeMapper.updateById(noticeEntity);
        Long noticeId = noticeEntity.getNoticeId();
        // 保存可见范围
        if (CollectionUtils.isNotEmpty(visibleRangeList)) {
            noticeMapper.deleteVisibleRange(noticeId);
            noticeMapper.insertVisibleRange(noticeId, visibleRangeList);
        }
        dataTracerService.update(noticeId, DataTracerTypeEnum.OA_NOTICE, old, noticeEntity);
    }
}
