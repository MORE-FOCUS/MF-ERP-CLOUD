package cn.morefocus.base.module.support.helpdoc.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 帮助文档
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_help_doc")
public class HelpDocEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long helpDocId;

    /**
     * 类型
     */
    private Long helpDocCatalogId;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容 纯文本
     */
    private String contentText;

    /**
     * 内容 html
     */
    private String contentHtml;

    /**
     * 附件
     * 多个英文逗号分隔
     */
    private String attachment;

    /**
     * 页面浏览量
     */
    private Integer pageViewCount;

    /**
     * 用户浏览量
     */
    private Integer userViewCount;

    /**
     * 作者
     */
    private String author;
}
