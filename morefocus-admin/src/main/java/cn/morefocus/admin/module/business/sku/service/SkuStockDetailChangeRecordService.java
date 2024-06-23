package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.form.SkuStockDetailChangeRecordQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockDetailChangeRecordVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuStockDetailChangeRecordMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 库存明细变化日志 Service
 *
 * @author loki
 * @date 2024-04-01 00:20:24
 */
@Service
public class SkuStockDetailChangeRecordService {

    @Resource
    private SkuStockDetailChangeRecordMapper skuStockDetailChangeRecordMapper;

    /**
     * 分页查询
     */
    public PageResult<SkuStockDetailChangeRecordVO> queryPage(SkuStockDetailChangeRecordQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuStockDetailChangeRecordVO> list = skuStockDetailChangeRecordMapper.queryPage(page, queryForm);
        PageResult<SkuStockDetailChangeRecordVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuStockDetailChangeRecordVO> queryAll() {
        List<SkuStockDetailChangeRecordVO> list = skuStockDetailChangeRecordMapper.queryAll();
        return list;
    }
}
