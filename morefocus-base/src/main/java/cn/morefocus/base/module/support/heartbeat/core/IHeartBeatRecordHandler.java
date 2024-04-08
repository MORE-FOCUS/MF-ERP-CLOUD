package cn.morefocus.base.module.support.heartbeat.core;

/**
 * 心跳处理接口
 *
 *
 */
public interface IHeartBeatRecordHandler {

    /**
     * 心跳日志处理方法
     *
     * @param heartBeatRecord
     */
    void handler(HeartBeatRecord heartBeatRecord);
}
