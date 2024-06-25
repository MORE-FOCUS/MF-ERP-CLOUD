package cn.morefocus.admin.module.business.store.service;

import cn.morefocus.admin.module.system.department.domain.form.DepartmentPageQueryForm;
import cn.morefocus.admin.module.system.department.domain.form.DepartmentQueryForm;
import cn.morefocus.admin.module.system.department.domain.vo.DepartmentVO;
import cn.morefocus.admin.module.system.department.mapper.DepartmentMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 门店 Service
 * 合并到组织机构
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Service
public class StoreService {

    @Resource
    private DepartmentMapper departmentMapper;

    /**
     * 分页查询
     */
    public PageResult<DepartmentVO> queryPage(DepartmentPageQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<DepartmentVO> list = departmentMapper.queryPage(page, queryForm);
        PageResult<DepartmentVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<DepartmentVO> queryAll(DepartmentQueryForm queryForm) {
        List<DepartmentVO> list = departmentMapper.queryAll(queryForm);
        return list;
    }
}
