package cn.morefocus.admin.module.business.category.service;

import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import cn.morefocus.admin.module.business.category.domain.form.CategoryAddForm;
import cn.morefocus.admin.module.business.category.domain.form.CategoryTreeQueryForm;
import cn.morefocus.admin.module.business.category.domain.form.CategoryUpdateForm;
import cn.morefocus.admin.module.business.category.domain.vo.CategoryTreeVO;
import cn.morefocus.admin.module.business.category.domain.vo.CategoryVO;
import cn.morefocus.admin.module.business.category.manager.CategoryCacheManager;
import cn.morefocus.admin.module.business.category.mapper.CategoryMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

/**
 * 类目
 */
@Service
public class CategoryService {

    @Resource
    private CategoryMapper categoryMapper;

    @Resource
    private CategoryQueryService categoryQueryService;

    @Resource
    private CategoryCacheManager categoryCacheManager;

    /**
     * 添加类目
     */
    public R<String> add(CategoryAddForm addForm) {
        // 校验类目
        CategoryEntity categoryEntity = LocalBeanUtil.copy(addForm, CategoryEntity.class);
        R<String> res = this.checkCategory(categoryEntity, false);
        if (!res.getOk()) {
            return res;
        }
        // 没有父类则使用默认父类
        Long parentId = null == addForm.getParentId() ? NumberUtils.LONG_ZERO : addForm.getParentId();
        categoryEntity.setParentId(parentId);
        categoryEntity.setSortValue(null == addForm.getSortValue() ? 0 : addForm.getSortValue());
        categoryEntity.setDeleteFlag(false);

        // 保存数据
        categoryMapper.insert(categoryEntity);

        // 更新缓存
        categoryCacheManager.removeCache();
        return R.ok();
    }

    /**
     * 更新类目
     * 不能更新父级类目
     */
    public R<String> update(CategoryUpdateForm updateForm) {
        // 校验类目
        Long categoryId = updateForm.getCategoryId();
        Optional<CategoryEntity> optional = categoryQueryService.queryCategory(categoryId);
        if (!optional.isPresent()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        CategoryEntity categoryEntity = LocalBeanUtil.copy(updateForm, CategoryEntity.class);

        /*
          不更新类目类型
          不更新父类id
    
 */
        Integer categoryType = optional.get().getCategoryType();
        categoryEntity.setCategoryType(categoryType);
        categoryEntity.setParentId(optional.get().getParentId());

        R<String> r = this.checkCategory(categoryEntity, true);
        if (!r.getOk()) {
            return r;
        }
        categoryMapper.updateById(categoryEntity);

        // 更新缓存
        categoryCacheManager.removeCache();
        return R.ok();
    }

    /**
     * 新增/更新 类目时的 校验
     */
    private R<String> checkCategory(CategoryEntity categoryEntity, boolean isUpdate) {
        // 校验父级是否存在
        Long parentId = categoryEntity.getParentId();
        Integer categoryType = categoryEntity.getCategoryType();
        if (null != parentId) {
            if (Objects.equals(categoryEntity.getCategoryId(), parentId)) {
                return R.userErrorParam("父级类目怎么和自己相同了");
            }
            if (!Objects.equals(parentId, NumberUtils.LONG_ZERO)) {
                Optional<CategoryEntity> optional = categoryQueryService.queryCategory(parentId);
                if (!optional.isPresent()) {
                    return R.error(UserErrorCode.DATA_NOT_EXIST, "父级类目不存在~");
                }

                CategoryEntity parent = optional.get();
                if (!Objects.equals(categoryType, parent.getCategoryType())) {
                    return R.userErrorParam("与父级类目类型不一致");
                }
            }

        } else {
            // 如果没有父类 使用默认父类
            parentId = NumberUtils.LONG_ZERO;
        }

        // 校验同父类下 名称是否重复
        CategoryEntity queryEntity = new CategoryEntity();
        queryEntity.setParentId(parentId);
        queryEntity.setCategoryType(categoryType);
        queryEntity.setCategoryName(categoryEntity.getCategoryName());
        queryEntity.setDeleteFlag(false);
        queryEntity = categoryMapper.selectOne(queryEntity);
        if (null != queryEntity) {
            if (isUpdate) {
                if (!Objects.equals(queryEntity.getCategoryId(), categoryEntity.getCategoryId())) {
                    return R.userErrorParam("同级下已存在相同类目~");
                }
            } else {
                return R.userErrorParam("同级下已存在相同类目~");
            }
        }
        return R.ok();
    }

    /**
     * 查询 类目详情
     */
    public R<CategoryVO> queryDetail(Long categoryId) {
        Optional<CategoryEntity> optional = categoryQueryService.queryCategory(categoryId);
        if (!optional.isPresent()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        CategoryVO adminVO = LocalBeanUtil.copy(optional.get(), CategoryVO.class);
        return R.ok(adminVO);
    }

    /**
     * 根据父级id 查询所有子类 返回层级树
     * 如果父类id 为空 返回所有类目层级
     */
    public R<List<CategoryTreeVO>> queryTree(CategoryTreeQueryForm queryForm) {
        if (null == queryForm.getParentId()) {
            if (null == queryForm.getCategoryType()) {
                return R.userErrorParam("类目类型不能为空");
            }
            queryForm.setParentId(NumberUtils.LONG_ZERO);
        }
        List<CategoryTreeVO> treeList = categoryCacheManager.queryCategoryTree(queryForm.getParentId(), queryForm.getCategoryType());
        return R.ok(treeList);
    }

    /**
     * 删除类目
     * 如果有未删除的子类 则无法删除
     */
    public R<String> delete(Long categoryId) {
        Optional<CategoryEntity> optional = categoryQueryService.queryCategory(categoryId);
        if (!optional.isPresent()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        List<Long> categorySubId = categoryQueryService.queryCategorySubId(Lists.newArrayList(categoryId));
        if (CollectionUtils.isNotEmpty(categorySubId)) {
            return R.userErrorParam("请先删除子级类目");
        }

        // 更新数据
        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setCategoryId(categoryId);
        categoryEntity.setDeleteFlag(true);
        categoryMapper.updateById(categoryEntity);

        // 更新缓存
        categoryCacheManager.removeCache();
        return R.ok();
    }

}
