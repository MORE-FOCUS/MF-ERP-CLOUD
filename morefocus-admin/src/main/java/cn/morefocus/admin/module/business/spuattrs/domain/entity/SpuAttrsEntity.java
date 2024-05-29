package cn.morefocus.admin.module.business.spuattrs.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 商品附加属性 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_spu_attrs")
public class SpuAttrsEntity extends BaseEntity {

    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * spuId
     */
    private Long spuId;

    /**
     * 属性 json
     */
    private String attrs;
}