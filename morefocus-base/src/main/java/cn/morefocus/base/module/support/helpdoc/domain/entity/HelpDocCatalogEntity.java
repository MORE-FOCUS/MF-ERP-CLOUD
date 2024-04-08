package cn.morefocus.base.module.support.helpdoc.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

/**
 * 帮助文档的 类型
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_help_doc_catalog")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HelpDocCatalogEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long helpDocCatalogId;

    /**
     * 名称
     */
    private String name;

    /**
     * 父id
     */
    private Long parentId;
}
