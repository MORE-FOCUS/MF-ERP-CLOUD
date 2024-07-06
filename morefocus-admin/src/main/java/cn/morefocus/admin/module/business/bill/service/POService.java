package cn.morefocus.admin.module.business.bill.service;

import cn.morefocus.admin.module.business.bill.domain.form.BillQueryForm;
import cn.morefocus.admin.module.business.bill.domain.form.POAddForm;
import cn.morefocus.admin.module.business.bill.domain.form.POEditForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillVO;
import cn.morefocus.admin.module.business.bill.mapper.BillMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 采购订单逻辑处理
 */
@Slf4j
@Service
public class POService {
    @Resource
    private BillMapper billMapper;

    /**
     * 分页查询
     */
    public PageResult<BillVO> queryPage(BillQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<BillVO> list = billMapper.queryPage(page, queryForm);
        PageResult<BillVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 详情
     */
    public R getDetail(Long orderId) {
        return R.ok();
    }

    /**
     * 新增采购订单
     */
    public R add(POAddForm poAddForm) {
        return R.ok();
    }

    /**
     * 编辑采购订单
     */
    public R edit(POEditForm poEditForm) {
        return R.ok();
    }
}
