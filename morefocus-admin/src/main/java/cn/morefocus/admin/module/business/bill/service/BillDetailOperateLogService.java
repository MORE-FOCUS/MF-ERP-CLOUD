package cn.morefocus.admin.module.business.bill.service;

import cn.morefocus.admin.module.business.bill.domain.entity.BillDetailOperateLogEntity;
import cn.morefocus.admin.module.business.bill.domain.form.BillDetailOperateLogAddForm;
import cn.morefocus.admin.module.business.bill.domain.form.BillDetailOperateLogQueryForm;
import cn.morefocus.admin.module.business.bill.domain.form.BillDetailOperateLogUpdateForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillDetailOperateLogVO;
import cn.morefocus.admin.module.business.bill.mapper.BillDetailOperateLogMapper;
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
 * @date 2024-07-04 23:57:01
 */
@Service
public class BillDetailOperateLogService {

    @Resource
    private BillDetailOperateLogMapper billDetailOperateLogMapper;

    /**
     * 分页查询
     */
    public PageResult<BillDetailOperateLogVO> queryPage(BillDetailOperateLogQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<BillDetailOperateLogVO> list = billDetailOperateLogMapper.queryPage(page, queryForm);
        PageResult<BillDetailOperateLogVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<BillDetailOperateLogVO> queryAll() {
        List<BillDetailOperateLogVO> list = billDetailOperateLogMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(BillDetailOperateLogAddForm addForm) {
        BillDetailOperateLogEntity billDetailOperateLogEntity = LocalBeanUtil.copy(addForm, BillDetailOperateLogEntity.class);
        billDetailOperateLogMapper.insert(billDetailOperateLogEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(BillDetailOperateLogUpdateForm updateForm) {
        BillDetailOperateLogEntity billDetailOperateLogEntity = LocalBeanUtil.copy(updateForm, BillDetailOperateLogEntity.class);
        billDetailOperateLogMapper.updateById(billDetailOperateLogEntity);
        return R.ok();
    }

}
