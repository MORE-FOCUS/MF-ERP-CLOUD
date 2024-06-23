package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.form.SkuStockDetailQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockDetailVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuStockDetailMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品库存明细 Service
 *
 * @author loki
 * @date 2024-06-23 11:57:24
 */
@Service
public class SkuStockDetailService {

    @Resource
    private SkuStockDetailMapper skuStockDetailMapper;

    /**
     * 分页查询
     */
    public PageResult<SkuStockDetailVO> queryPage(SkuStockDetailQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuStockDetailVO> list = skuStockDetailMapper.queryPage(page, queryForm);
        PageResult<SkuStockDetailVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuStockDetailVO> queryAll() {
        List<SkuStockDetailVO> list = skuStockDetailMapper.queryAll();
        return list;
    }
}
