package cn.morefocus.admin.module.business.bill.mapper;

import cn.morefocus.admin.module.business.bill.domain.entity.BillOperateLogEntity;
import cn.morefocus.admin.module.business.bill.domain.form.BillOperateLogQueryForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillOperateLogVO;
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
 * @date 2024-07-04 23:55:25
 */
@Mapper
@Component
public interface BillOperateLogMapper extends BaseMapper<BillOperateLogEntity> {

    /**
     * 分页 查询
     */
    List<BillOperateLogVO> queryPage(Page page, @Param("queryForm") BillOperateLogQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<BillOperateLogVO> queryAll();

}
