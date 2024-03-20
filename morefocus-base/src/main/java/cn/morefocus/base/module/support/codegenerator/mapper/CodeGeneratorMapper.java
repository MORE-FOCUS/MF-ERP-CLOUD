package cn.morefocus.base.module.support.codegenerator.mapper;

import cn.morefocus.base.module.support.codegenerator.domain.form.TableQueryForm;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableColumnVO;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableVO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface CodeGeneratorMapper {

    /**
     * 分页查询表
     */
    List<TableVO> queryTableList(Page page, @Param("queryForm") TableQueryForm queryForm);

    /**
     * 查询表是否存在
     *
     * @param tableName
     * @return
     */
    long countByTableName(@Param("tableName") String tableName);


    /**
     * 查询表列信息
     *
     * @param tableName
     * @return
     */
    List<TableColumnVO> selectTableColumn(@Param("tableName") String tableName);
}