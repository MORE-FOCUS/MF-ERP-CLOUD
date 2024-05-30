package cn.morefocus.admin.module.business.category.manager;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.morefocus.admin.constant.AdminCacheConst;
import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import cn.morefocus.admin.module.business.category.domain.vo.CategoryVO;
import cn.morefocus.admin.module.business.category.mapper.CategoryMapper;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类目 查询 缓存
 */
@Service
@Slf4j
public class CategoryManager {

    @Resource
    private CategoryMapper categoryMapper;

    /**
     * 根据类目id 移除缓存
     */
    @CacheEvict(value = {AdminCacheConst.Category.CATEGORY_ENTITY, AdminCacheConst.Category.CATEGORY_SUB, AdminCacheConst.Category.CATEGORY_TREE, AdminCacheConst.Category.CATEGORY_LIST}, allEntries = true)
    public void removeCache() {
        log.info("clear CATEGORY ,CATEGORY_SUB ,CATEGORY_TREE");
    }

    /**
     * 查询类目
     */
    @Cacheable(AdminCacheConst.Category.CATEGORY_ENTITY)
    public CategoryEntity queryCategory(Long categoryId) {
        return categoryMapper.selectById(categoryId);
    }

    /**
     * 查询类目 子级
     */
    @Cacheable(AdminCacheConst.Category.CATEGORY_SUB)
    public List<CategoryEntity> querySubCategory(Long categoryId) {
        return categoryMapper.queryByPid(Lists.newArrayList(categoryId), false);
    }

    /**
     * 查询所有分类
     */
    @Cacheable(AdminCacheConst.Category.CATEGORY_LIST)
    public List<CategoryVO> queryAll(Integer categoryType) {
        List<CategoryEntity> categoryEntityList = categoryMapper.queryByType(categoryType, false);
        return LocalBeanUtil.copyList(categoryEntityList, CategoryVO.class);
    }

    /**
     * 查询类目 层级树
     * 优先查询缓存
     */
    @Cacheable(AdminCacheConst.Category.CATEGORY_TREE)
    public List<Tree<Long>> queryCategoryTree(Long pid, Integer categoryType) {
        List<CategoryEntity> categoryList = categoryMapper.queryByType(categoryType, false);

        TreeNodeConfig config = new TreeNodeConfig()
                .setIdKey("value")
                .setParentIdKey("pid")
                .setNameKey("label")
                .setChildrenKey("children")
                .setWeightKey("sort");

        return TreeUtil.build(categoryList, pid, config, (node, tree) -> {
            tree.setParentId(node.getPid());
            tree.setId(node.getCategoryId());
            tree.setName(node.getCategoryName());
            tree.setWeight(node.getSortValue());
        });
    }
}
