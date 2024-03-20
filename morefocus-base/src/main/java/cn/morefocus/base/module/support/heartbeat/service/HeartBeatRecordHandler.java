package cn.morefocus.base.module.support.heartbeat.service;

import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.module.support.heartbeat.mapper.HeartBeatRecordMapper;
import cn.morefocus.base.module.support.heartbeat.core.HeartBeatRecord;
import cn.morefocus.base.module.support.heartbeat.core.IHeartBeatRecordHandler;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 心跳记录
 *
 * @author loki
 */
@Slf4j
@Service
public class HeartBeatRecordHandler implements IHeartBeatRecordHandler {

    @Resource
    private HeartBeatRecordMapper heartBeatRecordMapper;

    /**
     * 心跳日志处理方法
     *
     * @param heartBeatRecord
     */
    @Override
    public void handler(HeartBeatRecord heartBeatRecord) {
        HeartBeatRecordEntity heartBeatRecordEntity = LocalBeanUtil.copy(heartBeatRecord, HeartBeatRecordEntity.class);
        HeartBeatRecordEntity heartBeatRecordOld = heartBeatRecordMapper.query(heartBeatRecordEntity);
        if (heartBeatRecordOld == null) {
            heartBeatRecordMapper.insert(heartBeatRecordEntity);
        } else {
            heartBeatRecordMapper.updateHeartBeatTimeById(heartBeatRecordOld.getHeartBeatRecordId(), heartBeatRecordEntity.getHeartBeatTime());
        }
    }

}
