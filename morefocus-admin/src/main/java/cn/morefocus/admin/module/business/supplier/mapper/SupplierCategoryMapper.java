package cn.morefocus.admin.module.business.supplier.mapper;

import cn.morefocus.admin.module.business.supplier.domain.entity.SupplierCategoryEntity;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierCategoryQueryForm;
import cn.morefocus.admin.module.business.supplier.domain.vo.SupplierCategoryVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * ERP供应商类别 Mapper
 *
 * @author loki
 * @date 2024-04-09 00:05:10
 */
@Mapper
@Component
public interface SupplierCategoryMapper extends BaseMapper<SupplierCategoryEntity> {

    /**
     * 分页 查询
     */
    List<SupplierCategoryVO> queryPage(Page page, @Param("queryForm") SupplierCategoryQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<SupplierCategoryVO> queryAll();
}
