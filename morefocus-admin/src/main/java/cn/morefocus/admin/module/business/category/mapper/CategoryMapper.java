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
 */
@Component
@Mapper
public interface CategoryMapper extends BaseMapper<CategoryEntity> {

    /**
     * 根据父级id 类型 查询子类
     *
     * @param pidList 父级id集合
     * @param isDeleted   删除标识
     * @return 列表
     */
    List<CategoryEntity> queryByPid(@Param("pidList") List<Long> pidList,
                                    @Param("isDeleted") Boolean isDeleted);

    /**
     * 根据父级id 类型 查询子类
     *
     * @param pidList 父级id集合
     * @param categoryType {@link CategoryTypeEnum}
     * @param isDeleted   删除标识
     * @return 列表
     */
    List<CategoryEntity> queryByParentIdAndType(@Param("pidList") List<Long> pidList,
                                                @Param("categoryType") Integer categoryType,
                                                @Param("isDeleted") Boolean isDeleted);

    /**
     * 某个类型的所有
     */
    List<CategoryEntity> queryByType(@Param("categoryType") Integer categoryType,
                                     @Param("isDeleted") Boolean isDeleted);

    /**
     * 根据类型和id查询
     */
    CategoryEntity selectByTypeAndId(@Param("categoryType") Integer categoryType, @Param("categoryId") Long categoryId);

    /**
     * 查看类目 具体条件 看sql
     */
    CategoryEntity selectOne(CategoryEntity entity);

}
