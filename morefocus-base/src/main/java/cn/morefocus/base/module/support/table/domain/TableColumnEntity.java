package cn.morefocus.base.module.support.table.domain;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 自定义表格列
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_table_column")
public class TableColumnEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long tableColumnId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 用户类型
     */
    private Integer userType;

    /**
     * 表id
     */
    private Integer tableId;

    /**
     * 表列
     */
    private String columns;

}
