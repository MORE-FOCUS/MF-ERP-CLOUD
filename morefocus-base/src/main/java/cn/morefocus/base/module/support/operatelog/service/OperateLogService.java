package cn.morefocus.base.module.support.operatelog.service;

import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.operatelog.domain.OperateLogEntity;
import cn.morefocus.base.module.support.operatelog.domain.OperateLogQueryForm;
import cn.morefocus.base.module.support.operatelog.domain.OperateLogVO;
import cn.morefocus.base.module.support.operatelog.mapper.OperateLogMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 操作日志
 *
 *
 */
@Service
public class OperateLogService {

    @Resource
    private OperateLogMapper operateLogMapper;

    /**
     * @description 分页查询
     */
    public R<PageResult<OperateLogVO>> queryByPage(OperateLogQueryForm queryForm) {
        Page page = PageUtil.convert2PageQuery(queryForm);
        List<OperateLogEntity> logEntityList = operateLogMapper.queryByPage(page, queryForm);
        PageResult<OperateLogVO> pageResult = PageUtil.convert2PageResult(page, logEntityList, OperateLogVO.class);
        return R.ok(pageResult);
    }


    /**
     * 查询详情
     *
     * @param operateLogId
     * @return
     */
    public R<OperateLogVO> detail(Long operateLogId) {
        OperateLogEntity operateLogEntity = operateLogMapper.selectById(operateLogId);
        if (operateLogEntity == null) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        OperateLogVO operateLogVO = LocalBeanUtil.copy(operateLogEntity, OperateLogVO.class);
        return R.ok(operateLogVO);
    }
}
