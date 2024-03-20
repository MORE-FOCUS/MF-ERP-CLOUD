package cn.morefocus.base.module.support.dict.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 字典
 *
 * @author loki
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_dict_value")
public class DictValueEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long dictValueId;

    private Long dictKeyId;
    /**
     * 编码
     */
    private String valueCode;
    /**
     * 名称
     */
    private String valueName;
    /**
     * 备注
     */
    private String remark;
}