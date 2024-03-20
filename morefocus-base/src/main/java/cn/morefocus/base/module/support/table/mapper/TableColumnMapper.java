package cn.morefocus.base.module.support.table.mapper;

import cn.morefocus.base.module.support.table.domain.TableColumnEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 表格自定义列（前端用户自定义表格列，并保存到数据库里）
 *
 * @author loki
 */
@Mapper
public interface TableColumnMapper extends BaseMapper<TableColumnEntity> {

    TableColumnEntity selectByUserIdAndTableId(@Param("userId") Long userId, @Param("userType") Integer userType, @Param("tableId") Integer tableId);

    void deleteTableColumn(@Param("userId") Long userId, @Param("userType") Integer userType, @Param("tableId") Integer tableId);
}
