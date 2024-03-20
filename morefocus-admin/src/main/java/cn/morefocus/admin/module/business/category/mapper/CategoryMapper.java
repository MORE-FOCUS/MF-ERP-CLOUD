package cn.morefocus.admin.module.business.category.mapper;

import cn.morefocus.admin.module.business.category.constant.CategoryTypeEnum;
import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 类目 mapper
 *
 * @author loki
 */
@Component
@Mapper
public interface CategoryMapper extends BaseMapper<CategoryEntity> {

    /**
     * 根据父级id 类型 查询子类
     *
     * @param parentIdList 父级id集合
     * @param deleteFlag  删除标识
     * @return 列表
     */
    List<CategoryEntity> queryByParentId(@Param("parentIdList") List<Long> parentIdList,
                                         @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 根据父级id 类型 查询子类
     *
     * @param parentIdList 父级id集合
     * @param categoryType {@link CategoryTypeEnum}
     * @param deleteFlag  删除标识
     * @return 列表
     */
    List<CategoryEntity> queryByParentIdAndType(@Param("parentIdList") List<Long> parentIdList,
                                                @Param("categoryType") Integer categoryType,
                                                @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 某个类型的所有
     */
    List<CategoryEntity> queryByType(@Param("categoryType") Integer categoryType,
                                     @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 根据类型和id查询
     */
    CategoryEntity selectByTypeAndId(@Param("categoryType") Integer categoryType, @Param("categoryId") Long categoryId);

    /**
     * 查看类目 具体条件 看sql
     */
    CategoryEntity selectOne(CategoryEntity entity);

}