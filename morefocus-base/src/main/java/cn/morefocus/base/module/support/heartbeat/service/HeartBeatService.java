package cn.morefocus.base.module.support.heartbeat.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.heartbeat.mapper.HeartBeatRecordMapper;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordQueryForm;
import cn.morefocus.base.module.support.heartbeat.domain.HeartBeatRecordVO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 心跳记录
 *
 * @author loki
 */
@Slf4j
@Service
public class HeartBeatService {

    @Resource
    private HeartBeatRecordMapper heartBeatRecordMapper;

    public R<PageResult<HeartBeatRecordVO>> pageQuery(HeartBeatRecordQueryForm pageParam) {
        Page pageQueryInfo = PageUtil.convert2PageQuery(pageParam);
        List<HeartBeatRecordVO> recordVOList = heartBeatRecordMapper.pageQuery(pageQueryInfo, pageParam);
        PageResult<HeartBeatRecordVO> pageResult = PageUtil.convert2PageResult(pageQueryInfo, recordVOList);
        return R.ok(pageResult);
    }
}
