package cn.morefocus.admin.module.business.bill.mapper;

import cn.morefocus.admin.module.business.bill.domain.entity.BillEntity;
import cn.morefocus.admin.module.business.bill.domain.form.BillQueryForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 单据 Mapper
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@Mapper
@Component
public interface BillMapper extends BaseMapper<BillEntity> {

    /**
     * 分页 查询
     */
    List<BillVO> queryPage(Page page, @Param("queryForm") BillQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<BillVO> queryAll();
}
