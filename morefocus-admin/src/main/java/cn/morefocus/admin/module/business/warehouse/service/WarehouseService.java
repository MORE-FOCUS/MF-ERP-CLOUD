package cn.morefocus.admin.module.business.warehouse.service;

import cn.morefocus.admin.module.business.warehouse.domain.entity.WarehouseEntity;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseAddForm;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseQueryForm;
import cn.morefocus.admin.module.business.warehouse.domain.form.WarehouseUpdateForm;
import cn.morefocus.admin.module.business.warehouse.domain.vo.WarehouseVO;
import cn.morefocus.admin.module.business.warehouse.mapper.WarehouseMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 仓库 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class WarehouseService {

    @Resource
    private WarehouseMapper warehouseMapper;

    /**
     * 分页查询
     */
    public PageResult<WarehouseVO> queryPage(WarehouseQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<WarehouseVO> list = warehouseMapper.queryPage(page, queryForm);
        PageResult<WarehouseVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<WarehouseVO> queryAll() {
        List<WarehouseVO> list = warehouseMapper.queryAll();
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(WarehouseAddForm addForm) {
        WarehouseEntity warehouseEntity = LocalBeanUtil.copy(addForm, WarehouseEntity.class);
        warehouseMapper.insert(warehouseEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(WarehouseUpdateForm updateForm) {
        WarehouseEntity warehouseEntity = LocalBeanUtil.copy(updateForm, WarehouseEntity.class);
        warehouseMapper.updateById(warehouseEntity);
        return R.ok();
    }

}
