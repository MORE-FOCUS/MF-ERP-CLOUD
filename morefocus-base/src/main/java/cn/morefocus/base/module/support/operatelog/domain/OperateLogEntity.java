package cn.morefocus.base.module.support.operatelog.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

/**
 * 操作记录
 *
 * @author loki
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("t_operate_log")
public class OperateLogEntity extends BaseEntity {

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long operateLogId;

    /**
     * 操作人id
     */
    private Long operateUserId;

    /**
     * 用户类型
     */
    private Integer operateUserType;

    /**
     * 操作人名称
     */
    private String operateUserName;
    /**
     * 操作模块
     */
    private String module;

    /**
     * 操作内容
     */
    private String content;

    /**
     * 请求路径
     */
    private String url;

    /**
     * 请求方法
     */
    private String method;

    /**
     * 请求参数
     */
    private String param;

    /**
     * 客户ip
     */
    private String ip;

    /**
     * 客户ip地区
     */
    private String ipRegion;

    /**
     * user-agent
     */
    private String userAgent;

    /**
     * 请求结果 0失败 1成功
     */
    private Boolean successFlag;

    /**
     * 失败原因
     */
    private String failReason;
}
