package cn.morefocus.base.module.support.serialnumber.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 单据序列号 生成结果
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SerialNumberGenerateResultDTO {

    /**
     * 序号id
     */
    private Long serialNumberId;

    /**
     * 是否重置的初始值
     */
    private Boolean isReset;

    /**
     * 上次生成的数字
     */
    private Long lastNumber;

    /**
     * 上次生成的时间
     */
    private LocalDateTime lastTime;

    /**
     * 生成的 number  集合
     */
    private List<Long> numberList;

}
