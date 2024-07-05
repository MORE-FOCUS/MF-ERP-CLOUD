package cn.morefocus.admin.module.business.bill.mapper;

import cn.morefocus.admin.module.business.bill.domain.entity.BillDetailOperateLogEntity;
import cn.morefocus.admin.module.business.bill.domain.form.BillDetailOperateLogQueryForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillDetailOperateLogVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 单据操作记录
 * Mapper
 *
 * @author loki
 * @date 2024-07-04 23:57:01
 */
@Mapper
@Component
public interface BillDetailOperateLogMapper extends BaseMapper<BillDetailOperateLogEntity> {

    /**
     * 分页 查询
     */
    List<BillDetailOperateLogVO> queryPage(Page page, @Param("queryForm") BillDetailOperateLogQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<BillDetailOperateLogVO> queryAll();

}
