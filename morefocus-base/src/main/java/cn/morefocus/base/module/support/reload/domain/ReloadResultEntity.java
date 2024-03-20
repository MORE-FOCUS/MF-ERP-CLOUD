package cn.morefocus.base.module.support.reload.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * reload结果 <br>
 * t_reload_result 数据表 实体类
 *
 * @author loki
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_reload_result")
public class ReloadResultEntity extends BaseEntity {

    /**
     * 加载项标签
     */
    @TableId(type = IdType.NONE)
    private String tag;

    /**
     * 运行标识
     */
    private String identification;

    /**
     * 参数
     */
    private String args;

    /**
     * 运行结果
     */
    private Boolean result;

    /**
     * 异常
     */
    private String exception;

}
