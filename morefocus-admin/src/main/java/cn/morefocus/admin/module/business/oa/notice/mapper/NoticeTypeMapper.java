package cn.morefocus.admin.module.business.oa.notice.mapper;

import cn.morefocus.admin.module.business.oa.notice.domain.entity.NoticeTypeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 通知公告类型
 *
 * @author loki
 */
@Mapper
@Component
public interface NoticeTypeMapper extends BaseMapper<NoticeTypeEntity> {

}
