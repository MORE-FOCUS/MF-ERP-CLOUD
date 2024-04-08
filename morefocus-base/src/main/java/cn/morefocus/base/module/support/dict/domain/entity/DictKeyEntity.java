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
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_dict_key")
public class DictKeyEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long dictKeyId;

    /**
     * 编码
     */
    private String keyCode;
    /**
     * 名称
     */
    private String keyName;
}