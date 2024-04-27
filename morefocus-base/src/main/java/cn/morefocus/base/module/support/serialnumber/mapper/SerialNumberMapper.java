package cn.morefocus.base.module.support.serialnumber.mapper;

import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 单据序列号
 */
@Mapper
@Component
public interface SerialNumberMapper extends BaseMapper<SerialNumberEntity> {

    /**
     * 排他锁查询
     */
    SerialNumberEntity selectForUpdate(@Param("serialNumberId") Long serialNumberId);

    /**
     * 更新上一次的 数值和时间
     */
    void updateLastNumberAndTime(@Param("serialNumberId") Long serialNumberId, @Param("lastNumber") Long lastNumber, @Param("lastTime") LocalDateTime lastTime);

}
