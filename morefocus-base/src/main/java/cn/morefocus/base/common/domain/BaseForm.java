package cn.morefocus.base.common.domain;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 请求参数
 */
@Data
public class BaseForm {
    /**
     * 查询关键字
     */
    @Length(max = 25, message = "搜索词最多25字符")
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

    /**
     * 删除标志
     */
    private Boolean isDeleted;

    /**
     * 是否禁用
     */
    private Boolean isDisabled;

    /**
     * 是否默认
     */
    private Boolean isDefault;
}
