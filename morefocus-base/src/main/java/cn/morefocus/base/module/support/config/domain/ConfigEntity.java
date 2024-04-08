package cn.morefocus.base.module.support.config.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统配置参数 实体类
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_config")
public class ConfigEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long configId;

    /**
     * 参数key
     */
    private String configKey;

    /**
     * 参数的值
     */
    private String configValue;

    /**
     * 参数名称
     */
    private String configName;

}
