package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.form.SkuStockQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuStockVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuStockMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品库存 Service
 *
 * @author loki
 * @date 2024-06-23 11:57:19
 */
@Service
public class SkuStockService {

    @Resource
    private SkuStockMapper skuStockMapper;

    /**
     * 分页查询
     */
    public PageResult<SkuStockVO> queryPage(SkuStockQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuStockVO> list = skuStockMapper.queryPage(page, queryForm);
        PageResult<SkuStockVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuStockVO> queryAll() {
        List<SkuStockVO> list = skuStockMapper.queryAll();
        return list;
    }
}
