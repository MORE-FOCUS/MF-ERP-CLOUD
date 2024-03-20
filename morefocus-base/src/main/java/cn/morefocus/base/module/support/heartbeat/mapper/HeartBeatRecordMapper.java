package cn.morefocus.base.module.support.heartbeat.mapper;

import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordEntity;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordQueryForm;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 心跳记录
 *
 * @author loki
 */
@Component
@Mapper
public interface HeartBeatRecordMapper extends BaseMapper<HeartBeatRecordEntity> {

    /**
     * 更新心跳日志
     *
     * @param id
     * @param heartBeatTime
     */
    void updateHeartBeatTimeById(@Param("id") Long id, @Param("heartBeatTime") LocalDateTime heartBeatTime);

    /**
     * 查询心跳日志
     *
     * @param heartBeatRecordEntity
     * @return
     */
    HeartBeatRecordEntity query(HeartBeatRecordEntity heartBeatRecordEntity);

    /**
     * 分页查询
     *
     * @param heartBeatRecordQueryForm
     * @return
     */
    List<HeartBeatRecordVO> pageQuery(Page page, @Param("query") HeartBeatRecordQueryForm heartBeatRecordQueryForm);
}
