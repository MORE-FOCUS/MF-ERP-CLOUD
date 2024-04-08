package cn.morefocus.base.module.support.reload.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * t_reload_item 数据表 实体类
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_reload_item")
public class ReloadItemEntity extends BaseEntity {

    /**
     * 加载项标签
     */
    @TableId(type = IdType.INPUT)
    private String tag;

    /**
     * 参数
     */
    private String args;

    /**
     * 运行标识
     */
    private String identification;
}
