package cn.morefocus.base.module.support.codegenerator.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 代码生成-配置
 *
 *
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_code_generator_config")
public class CodeGeneratorConfigEntity extends BaseEntity {

    /**
     * 表名
     */
    @TableId(type = IdType.NONE)
    private String tableName;

    /**
     * 基础命名信息
     */
    private String basic;

    /**
     * 字段列表
     */
    private String fields;

    /**
     * 增加、修改 信息
     */
    private String insertAndUpdate;

    /**
     * 删除 信息
     */
    private String deleteInfo;

    /**
     * 查询字段
     */
    private String queryFields;

    /**
     * 列表字段
     */
    private String tableFields;

    /**
     * 详情
     */
    private String detail;
}
