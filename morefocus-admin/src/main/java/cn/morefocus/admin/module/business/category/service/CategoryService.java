package cn.morefocus.admin.module.business.category.service;

import cn.hutool.core.lang.tree.Tree;
import cn.morefocus.admin.module.business.category.domain.entity.CategoryEntity;
import cn.morefocus.admin.module.business.category.domain.form.CategoryAddForm;
import cn.morefocus.admin.module.business.category.domain.form.CategoryTreeQueryForm;
import cn.morefocus.admin.module.business.category.domain.form.CategoryUpdateForm;
import cn.morefocus.admin.module.business.category.domain.vo.CategoryVO;
import cn.morefocus.admin.module.business.category.manager.CategoryManager;
import cn.morefocus.admin.module.business.category.mapper.CategoryMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
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
    private CategoryManager categoryManager;

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

        //全路径
        Long pid;
        if (null == addForm.getPid()) {
            categoryEntity.setPath(NumberUtils.LONG_ZERO.toString());
            pid = NumberUtils.LONG_ZERO;
        } else {
            pid = addForm.getPid();
            CategoryEntity parentCategoryEntity = categoryMapper.selectById(pid);
            categoryEntity.setPath(parentCategoryEntity.getPath() + StringConst.SEPARATOR + pid);
        }

        //层级
        categoryEntity.setLevel(getLevel(categoryEntity));

        //是否叶子节点
        categoryEntity.setIsLeaf(Boolean.TRUE);
        categoryEntity.setPid(pid);
        categoryEntity.setSortValue(null == addForm.getSortValue() ? 0 : addForm.getSortValue());
        categoryEntity.setIsDeleted(Boolean.FALSE);

        // 保存数据
        categoryMapper.insert(categoryEntity);

        // 更新缓存
        categoryManager.removeCache();
        return R.ok();
    }

    /**
     * 更新类目
     * 不更新类型
     */
    public R<String> update(CategoryUpdateForm updateForm) {
        // 校验类目
        Long categoryId = updateForm.getCategoryId();
        Optional<CategoryEntity> optional = categoryQueryService.queryCategory(categoryId);
        if (!optional.isPresent()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        CategoryEntity categoryEntity = LocalBeanUtil.copy(updateForm, CategoryEntity.class);

        Integer categoryType = optional.get().getCategoryType();
        categoryEntity.setCategoryType(categoryType);

        R<String> r = this.checkCategory(categoryEntity, true);
        if (!r.getOk()) {
            return r;
        }

        //全路径
        Long pid;
        if (null == updateForm.getPid()) {
            pid = NumberUtils.LONG_ZERO;
            categoryEntity.setPath(NumberUtils.LONG_ZERO.toString());
        } else {
            pid = updateForm.getPid();
            if (!pid.equals(NumberUtils.LONG_ZERO)) {
                CategoryEntity parentCategoryEntity = categoryMapper.selectById(pid);
                if (null != parentCategoryEntity) {
                    categoryEntity.setPath(parentCategoryEntity.getPath() + StringConst.SEPARATOR + pid);
                }
            }
        }

        //层级
        categoryEntity.setLevel(getLevel(categoryEntity));

        //是否叶子节点,判断是否有子节点
        categoryEntity.setIsLeaf(CollectionUtils.isEmpty(categoryMapper.queryByPid(Collections.singletonList(categoryEntity.getCategoryId()), Boolean.TRUE)) ? Boolean.TRUE : Boolean.FALSE);
        categoryEntity.setPid(pid);
        categoryMapper.updateById(categoryEntity);

        // 更新缓存
        categoryManager.removeCache();
        return R.ok();
    }

    /**
     * 获取层级
     */
    private Integer getLevel(CategoryEntity categoryEntity) {
        if (null == categoryEntity) {
            return 1;
        }

        if (StringUtils.isBlank(categoryEntity.getPath())) {
            return 1;
        }

        return categoryEntity.getPath().split(StringConst.SEPARATOR).length + 1;
    }

    /**
     * 新增/更新 类目时的 校验
     */
    private R<String> checkCategory(CategoryEntity categoryEntity, boolean isUpdate) {
        // 校验父级是否存在
        Long pid = categoryEntity.getPid();
        Integer categoryType = categoryEntity.getCategoryType();
        if (null != pid) {
            if (Objects.equals(categoryEntity.getCategoryId(), pid)) {
                return R.userErrorParam("父级类目不能为自己");
            }
            if (!Objects.equals(pid, NumberUtils.LONG_ZERO)) {
                Optional<CategoryEntity> optional = categoryQueryService.queryCategory(pid);
                if (!optional.isPresent()) {
                    return R.error(UserErrorCode.DATA_NOT_EXIST, "父级类目不存在");
                }

                CategoryEntity parent = optional.get();
                if (!Objects.equals(categoryType, parent.getCategoryType())) {
                    return R.userErrorParam("与父级类目类型不一致");
                }
            }

        } else {
            // 如果没有父类 使用默认父类
            pid = NumberUtils.LONG_ZERO;
        }

        // 校验同父类下 名称是否重复
        CategoryEntity queryEntity = new CategoryEntity();
        queryEntity.setPid(pid);
        queryEntity.setCategoryType(categoryType);
        queryEntity.setCategoryName(categoryEntity.getCategoryName());
        queryEntity.setIsDeleted(false);
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
    public R<List<CategoryVO>> queryAll(CategoryTreeQueryForm queryForm) {
        if (null == queryForm.getCategoryType()) {
            return R.userErrorParam("类目类型不能为空");
        }

        List<CategoryVO> treeList = categoryManager.queryAll(queryForm.getCategoryType());
        return R.ok(treeList);
    }

    /**
     * 根据父级id 查询所有子类 返回层级树
     * 如果父类id 为空 返回所有类目层级
     */
    public R<List<Tree<Long>>> queryTree(CategoryTreeQueryForm queryForm) {
        if (null == queryForm.getPid()) {
            if (null == queryForm.getCategoryType()) {
                return R.userErrorParam("类目类型不能为空");
            }
            queryForm.setPid(NumberUtils.LONG_ZERO);
        }

        return R.ok(categoryManager.queryCategoryTree(queryForm.getPid(), queryForm.getCategoryType()));
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
        categoryEntity.setIsDeleted(true);
        categoryMapper.updateById(categoryEntity);

        // 更新缓存
        categoryManager.removeCache();
        return R.ok();
    }

}
