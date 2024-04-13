package cn.morefocus.base.common.domain;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 分页基础参数
 */
@Data
public class PageParam {
    /**
     * 页码 默认1
     */
    @NotNull(message = "分页参数不能为空")
    private Long pageNum;

    /**
     * 每页数量 默认10
     */
    @NotNull(message = "每页数量不能为空")
    @Max(value = 500, message = "每页最大为500")
    private Long pageSize;

    /**
     * 是否查询总条数
     */
    protected Boolean searchCount;

    /**
     * 排序字段集合
     */
    @Size(max = 10, message = "排序字段最多10")
    @Valid
    private List<SortItem> sortItemList;

    /**
     * 排序DTO类
     */
    @Data
    public static class SortItem {

        /**
         * true正序|false倒序
         */
        @NotNull(message = "排序规则不能为空")
        private Boolean isAsc;

        /**
         * 排序字段
         */
        @NotBlank(message = "排序字段不能为空")
        @Length(max = 30, message = "排序字段最多30")
        private String column;
    }
}
