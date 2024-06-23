package cn.morefocus.admin.module.business.sku.service;

import cn.morefocus.admin.module.business.sku.domain.form.SkuWarnLisQueryForm;
import cn.morefocus.admin.module.business.sku.domain.vo.SkuWarnLisVO;
import cn.morefocus.admin.module.business.sku.mapper.SkuWarnLisMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 商品库存预警 Service
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@Service
public class SkuWarnLisService {

    @Resource
    private SkuWarnLisMapper skuWarnLisMapper;

    /**
     * 分页查询
     */
    public PageResult<SkuWarnLisVO> queryPage(SkuWarnLisQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<SkuWarnLisVO> list = skuWarnLisMapper.queryPage(page, queryForm);
        PageResult<SkuWarnLisVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<SkuWarnLisVO> queryAll() {
        List<SkuWarnLisVO> list = skuWarnLisMapper.queryAll();
        return list;
    }
}
