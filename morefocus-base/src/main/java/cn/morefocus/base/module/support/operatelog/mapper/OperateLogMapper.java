package cn.morefocus.base.module.support.operatelog.mapper;

import cn.morefocus.base.module.support.operatelog.domain.OperateLogEntity;
import cn.morefocus.base.module.support.operatelog.domain.OperateLogQueryForm;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 操作日志
 */
@Mapper
@Component
public interface OperateLogMapper extends BaseMapper<OperateLogEntity> {

    /**
     * 分页查询
     */
    List<OperateLogEntity> queryByPage(Page page, @Param("query") OperateLogQueryForm queryForm);

    /**
     * 批量删除
     */
    void deleteByIds(@Param("idList") List<Long> idList);
}
