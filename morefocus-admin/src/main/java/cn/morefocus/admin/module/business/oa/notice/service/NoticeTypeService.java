package cn.morefocus.admin.module.business.oa.notice.service;

import cn.hutool.core.util.StrUtil;
import cn.morefocus.admin.module.business.oa.notice.mapper.NoticeTypeMapper;
import cn.morefocus.admin.module.business.oa.notice.domain.entity.NoticeTypeEntity;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.NoticeTypeVO;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 通知。公告 类型
 *
 * @author loki
 */
@Service
public class NoticeTypeService {

    @Resource
    private NoticeTypeMapper noticeTypeMapper;

    /**
     * 查询全部
     *
     * @return
     */
    public List<NoticeTypeVO> getAll() {
        return LocalBeanUtil.copyList(noticeTypeMapper.selectList(null), NoticeTypeVO.class);
    }

    public NoticeTypeVO getByNoticeTypeId(Long noticceTypeId) {
        return LocalBeanUtil.copy(noticeTypeMapper.selectById(noticceTypeId), NoticeTypeVO.class);
    }

    public synchronized R<String> add(String name) {
        if (StrUtil.isBlank(name)) {
            return R.userErrorParam("类型名称不能为空");
        }

        List<NoticeTypeEntity> noticeTypeEntityList = noticeTypeMapper.selectList(null);
        if (!CollectionUtils.isEmpty(noticeTypeEntityList)) {
            boolean exist = noticeTypeEntityList.stream().map(NoticeTypeEntity::getNoticeTypeName).collect(Collectors.toSet()).contains(name);
            if (exist) {
                return R.userErrorParam("类型名称已经存在");
            }
        }
        noticeTypeMapper.insert(NoticeTypeEntity.builder().noticeTypeName(name).build());
        return R.ok();
    }

    public synchronized R<String> update(Long noticeTypeId, String name) {
        if (StrUtil.isBlank(name)) {
            return R.userErrorParam("类型名称不能为空");
        }

        NoticeTypeEntity noticeTypeEntity = noticeTypeMapper.selectById(noticeTypeId);
        if (noticeTypeEntity == null) {
            return R.userErrorParam("类型名称不存在");
        }

        List<NoticeTypeEntity> noticeTypeEntityList = noticeTypeMapper.selectList(null);
        if (!CollectionUtils.isEmpty(noticeTypeEntityList)) {
            Optional<NoticeTypeEntity> optionalNoticeTypeEntity = noticeTypeEntityList.stream().filter(e -> e.getNoticeTypeName().equals(name)).findFirst();
            if (optionalNoticeTypeEntity.isPresent() && !optionalNoticeTypeEntity.get().getNoticeTypeId().equals(noticeTypeId)) {
                return R.userErrorParam("类型名称已经存在");
            }
        }
        noticeTypeEntity.setNoticeTypeName(name);
        noticeTypeMapper.updateById(noticeTypeEntity);
        return R.ok();
    }

    public synchronized R<String> delete(Long noticeTypeId) {
        noticeTypeMapper.deleteById(noticeTypeId);
        return R.ok();
    }

}
