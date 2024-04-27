package cn.morefocus.base.module.support.serialnumber.domain.bo;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 单据序列号
 */
@Data
public class SerialNumberAddFrom {

    @NotNull(message = "ID不能为空")
    private Long serialNumberId;

    /**
     * 编码前缀
     */
    @NotNull(message = "编码前缀不能为空")
    private String serialNumberPrefix;

    /**
     * 业务
     */
    @NotNull(message = "业务名称不能为空")
    private String businessName;

    /**
     * 格式
     */
    @NotNull(message = "编码格式不能为空")
    private String format;

    /**
     * 生成规则
     */
    @NotNull(message = "生成规则不能为空")
    private String ruleType;

    /**
     * 初始值
     */
    private Long initNumber;

    /**
     * 步长随机数范围
     */
    private Integer stepRandomRange;
}
