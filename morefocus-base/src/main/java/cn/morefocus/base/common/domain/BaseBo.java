package cn.morefocus.base.common.domain;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 请求参数
 */
@Data
public class BaseBo {
    /**
     * 查询关键字
     */
    private String keywords;

    /**
     * 查询开始时间
     */
    private LocalDateTime beginTime;

    /**
     * 查询结束时间
     */
    private LocalDateTime endTime;

    /**
     * 查询开始日期
     */
    private LocalDate beginDate;

    /**
     * 查询结束日期
     */
    private LocalDate endDate;
}
