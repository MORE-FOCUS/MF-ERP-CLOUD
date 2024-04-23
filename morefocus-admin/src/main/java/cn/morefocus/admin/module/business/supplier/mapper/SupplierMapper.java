package cn.morefocus.admin.module.business.supplier.mapper;

import cn.morefocus.admin.module.business.supplier.domain.entity.SupplierEntity;
import cn.morefocus.admin.module.business.supplier.domain.form.SupplierQueryForm;
import cn.morefocus.admin.module.business.supplier.domain.vo.SupplierVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 供应商 Mapper
 *
 * @author loki
 * @date 2024-04-09 00:04:56
 */
@Mapper
@Component
public interface SupplierMapper extends BaseMapper<SupplierEntity> {

    /**
     * 分页 查询
     */
    List<SupplierVO> queryPage(Page page, @Param("queryForm") SupplierQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);
}
