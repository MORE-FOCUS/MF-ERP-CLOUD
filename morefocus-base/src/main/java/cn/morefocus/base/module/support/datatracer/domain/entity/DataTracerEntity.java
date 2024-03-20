package cn.morefocus.base.module.support.datatracer.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 数据记录 实体
 *
 * @author loki
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_data_tracer")
public class DataTracerEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long dataTracerId;
    /**
     * 数据id
     */
    private Long dataId;
    /**
     * 业务类型
     * {@link DataTracerTypeEnum}
     */
    private Integer type;

    /**
     * 内容
     */
    private String content;

    /**
     * diff 差异：旧的数据
     */
    private String diffOld;

    /**
     * 差异：新的数据
     */
    private String diffNew;

    /**
     * 扩展字段
     */
    private String extraData;

    /**
     * 用户
     */
    private Long userId;

    /**
     * 用户类型
     */
    private Integer userType;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 请求ip
     */
    private String ip;

    /**
     * 请求ip地区
     */
    private String ipRegion;

    /**
     * 请求头
     */
    private String userAgent;
}
