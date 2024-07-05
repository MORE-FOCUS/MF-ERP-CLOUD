package cn.morefocus.admin.module.business.billdetail.mapper;

import cn.morefocus.admin.module.business.billdetail.domain.entity.BillDetailEntity;
import cn.morefocus.admin.module.business.billdetail.domain.form.BillDetailQueryForm;
import cn.morefocus.admin.module.business.billdetail.domain.vo.BillDetailVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 单据明细 Mapper
 *
 * @author loki
 * @date 2024-07-04 23:47:57
 */
@Mapper
@Component
public interface BillDetailMapper extends BaseMapper<BillDetailEntity> {

    /**
     * 分页 查询
     */
    List<BillDetailVO> queryPage(Page page, @Param("queryForm") BillDetailQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<BillDetailVO> queryAll();

}
