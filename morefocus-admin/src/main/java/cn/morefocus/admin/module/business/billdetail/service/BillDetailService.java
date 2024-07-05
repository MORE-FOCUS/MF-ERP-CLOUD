package cn.morefocus.admin.module.business.billdetail.service;

import cn.morefocus.admin.module.business.billdetail.domain.entity.BillDetailEntity;
import cn.morefocus.admin.module.business.billdetail.domain.form.BillDetailAddForm;
import cn.morefocus.admin.module.business.billdetail.domain.form.BillDetailQueryForm;
import cn.morefocus.admin.module.business.billdetail.domain.form.BillDetailUpdateForm;
import cn.morefocus.admin.module.business.billdetail.domain.vo.BillDetailVO;
import cn.morefocus.admin.module.business.billdetail.mapper.BillDetailMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单据明细 Service
 *
 * @author loki
 * @date 2024-07-04 23:47:57
 */
@Service
public class BillDetailService {

    @Resource
    private BillDetailMapper billDetailMapper;

    /**
     * 分页查询
     */
    public PageResult<BillDetailVO> queryPage(BillDetailQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<BillDetailVO> list = billDetailMapper.queryPage(page, queryForm);
        PageResult<BillDetailVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<BillDetailVO> queryAll() {
        List<BillDetailVO> list = billDetailMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(BillDetailAddForm addForm) {
        BillDetailEntity billDetailEntity = LocalBeanUtil.copy(addForm, BillDetailEntity.class);
        billDetailMapper.insert(billDetailEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(BillDetailUpdateForm updateForm) {
        BillDetailEntity billDetailEntity = LocalBeanUtil.copy(updateForm, BillDetailEntity.class);
        billDetailMapper.updateById(billDetailEntity);
        return R.ok();
    }

}
