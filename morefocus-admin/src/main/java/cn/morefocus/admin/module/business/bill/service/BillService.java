package cn.morefocus.admin.module.business.bill.service;

import cn.morefocus.admin.module.business.bill.domain.entity.BillEntity;
import cn.morefocus.admin.module.business.bill.domain.form.BillAddForm;
import cn.morefocus.admin.module.business.bill.domain.form.BillQueryForm;
import cn.morefocus.admin.module.business.bill.domain.form.BillUpdateForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillVO;
import cn.morefocus.admin.module.business.bill.mapper.BillMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单据 Service
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@Service
public class BillService {

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
     * 查询所有
     */
    public List<BillVO> queryAll() {
        List<BillVO> list = billMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(BillAddForm addForm) {
        BillEntity billEntity = LocalBeanUtil.copy(addForm, BillEntity.class);
        billMapper.insert(billEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(BillUpdateForm updateForm) {
        BillEntity billEntity = LocalBeanUtil.copy(updateForm, BillEntity.class);
        billMapper.updateById(billEntity);
        return R.ok();
    }

}
