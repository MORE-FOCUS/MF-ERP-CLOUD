package cn.morefocus.base.module.support.serialnumber.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.serialnumber.mapper.SerialNumberRecordMapper;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberRecordEntity;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberRecordQueryForm;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单据序列号 记录
 *
 * @author loki
 */
@Service
public class SerialNumberRecordService {

    @Resource
    private SerialNumberRecordMapper serialNumberRecordMapper;

    public PageResult<SerialNumberRecordEntity> query(SerialNumberRecordQueryForm queryForm) {
        Page page = PageUtil.convert2PageQuery(queryForm);
        List<SerialNumberRecordEntity> recordList = serialNumberRecordMapper.query(page, queryForm);
        return PageUtil.convert2PageResult(page, recordList);
    }
}
