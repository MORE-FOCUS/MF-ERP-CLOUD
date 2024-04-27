package cn.morefocus.base.module.support.serialnumber.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 单据序列号 表结构
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_serial_number_record")
public class SerialNumberRecordEntity extends BaseEntity {

    /**
     * 单号id
     */
    @TableId(type = IdType.NONE)
    private Long serialNumberId;

    /**
     * 记录日期
     */
    private LocalDate recordDate;

    /**
     * 最后更新值
     */
    private Long lastNumber;

    /**
     * 上次生成时间
     */
    private LocalDateTime lastTime;

    /**
     * 数量
     */
    private Long count;
}
