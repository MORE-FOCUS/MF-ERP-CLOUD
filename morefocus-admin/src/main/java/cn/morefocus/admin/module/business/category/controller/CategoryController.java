package cn.morefocus.admin.module.business.category.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.lang.tree.Tree;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.category.domain.form.CategoryAddForm;
import cn.morefocus.admin.module.business.category.domain.form.CategoryTreeQueryForm;
import cn.morefocus.admin.module.business.category.domain.form.CategoryUpdateForm;
import cn.morefocus.admin.module.business.category.domain.vo.CategoryVO;
import cn.morefocus.admin.module.business.category.service.CategoryService;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 类目
 */
@RestController
@Tag(name = AdminSwaggerTagConst.Business.MANAGER_CATEGORY)
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    @Operation(summary = "查询类目列表 ")
    @PostMapping("/category/queryAll")
    @SaCheckPermission("business:category:list")
    public R<List<CategoryVO>> queryAll(@RequestBody @Valid CategoryTreeQueryForm queryForm) {
        return categoryService.queryAll(queryForm);
    }

    @Operation(summary = "查询类目层级树 ")
    @PostMapping("/category/tree")
    @SaCheckPermission("business:category:tree")
    public R<List<Tree<Long>>> queryTree(@RequestBody @Valid CategoryTreeQueryForm queryForm) {
        return categoryService.queryTree(queryForm);
    }

    @Operation(summary = "添加类目 ")
    @PostMapping("/category/add")
    @SaCheckPermission("business:category:add")
    public R<String> add(@RequestBody @Valid CategoryAddForm addForm) {
        return categoryService.add(addForm);
    }

    @Operation(summary = "更新类目 ")
    @PostMapping("/category/update")
    @SaCheckPermission("business:category:update")
    public R<String> update(@RequestBody @Valid CategoryUpdateForm updateForm) {
        return categoryService.update(updateForm);
    }

    @Operation(summary = "查询类目详情 ")
    @GetMapping("/category/{categoryId}")
    public R<CategoryVO> queryDetail(@PathVariable Long categoryId) {
        return categoryService.queryDetail(categoryId);
    }

    @Operation(summary = "删除类目 ")
    @GetMapping("/category/delete/{categoryId}")
    @SaCheckPermission("business:category:delete")
    public R<String> delete(@PathVariable Long categoryId) {
        return categoryService.delete(categoryId);
    }
}
