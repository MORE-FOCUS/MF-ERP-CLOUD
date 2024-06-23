package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.form.SkuInitialStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuInitialStockVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuInitialStockMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品初始库存 Service
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@Service
public class SkuInitialStockService {

    @Resource
    private SkuInitialStockMapper skuInitialStockMapper;

    /**
     * 分页查询
     */
    public PageResult<SkuInitialStockVO> queryPage(SkuInitialStockQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuInitialStockVO> list = skuInitialStockMapper.queryPage(page, queryForm);
        PageResult<SkuInitialStockVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuInitialStockVO> queryAll() {
        List<SkuInitialStockVO> list = skuInitialStockMapper.queryAll();
        return list;
    }
}
