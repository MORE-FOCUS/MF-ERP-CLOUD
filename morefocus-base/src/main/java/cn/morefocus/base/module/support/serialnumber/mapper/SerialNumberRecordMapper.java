package cn.morefocus.base.module.support.serialnumber.mapper;

import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberRecordEntity;
import cn.morefocus.base.module.support.serialnumber.domain.bo.SerialNumberRecordQueryForm;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

/**
 * 单据序列号 生成的记录
 */
@Mapper
@Component
public interface SerialNumberRecordMapper extends BaseMapper<SerialNumberRecordEntity> {

    /**
     * 根据 id和日期 查询 记录id
     */
    Long selectRecordIdBySerialNumberIdAndDate(@Param("serialNumberId") Integer serialNumberId, @Param("recordDate") String recordDate);

    /**
     * 更新记录
     */
    Long updateRecord(@Param("serialNumberId") Long serialNumberId, @Param("recordDate") LocalDate recordDate, @Param("lastNumber") Long lastNumber, @Param("count") int count);

    /**
     * 分页查询记录
     */
    List<SerialNumberRecordEntity> query(Page page, @Param("queryForm") SerialNumberRecordQueryForm queryForm);
}
