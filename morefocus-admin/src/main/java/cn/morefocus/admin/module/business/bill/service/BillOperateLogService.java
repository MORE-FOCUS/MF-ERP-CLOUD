package cn.morefocus.admin.module.business.bill.service;

import cn.morefocus.admin.module.business.bill.domain.entity.BillOperateLogEntity;
import cn.morefocus.admin.module.business.bill.domain.form.BillOperateLogAddForm;
import cn.morefocus.admin.module.business.bill.domain.form.BillOperateLogQueryForm;
import cn.morefocus.admin.module.business.bill.domain.form.BillOperateLogUpdateForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillOperateLogVO;
import cn.morefocus.admin.module.business.bill.mapper.BillOperateLogMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单据操作记录
 * Service
 *
 * @author loki
 * @date 2024-07-04 23:55:25
 */
@Service
public class BillOperateLogService {

    @Resource
    private BillOperateLogMapper billOperateLogMapper;

    /**
     * 分页查询
     */
    public PageResult<BillOperateLogVO> queryPage(BillOperateLogQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<BillOperateLogVO> list = billOperateLogMapper.queryPage(page, queryForm);
        PageResult<BillOperateLogVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<BillOperateLogVO> queryAll() {
        List<BillOperateLogVO> list = billOperateLogMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(BillOperateLogAddForm addForm) {
        BillOperateLogEntity billOperateLogEntity = LocalBeanUtil.copy(addForm, BillOperateLogEntity.class);
        billOperateLogMapper.insert(billOperateLogEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(BillOperateLogUpdateForm updateForm) {
        BillOperateLogEntity billOperateLogEntity = LocalBeanUtil.copy(updateForm, BillOperateLogEntity.class);
        billOperateLogMapper.updateById(billOperateLogEntity);
        return R.ok();
    }

}
