package cn.morefocus.admin.module.business.store.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.module.business.store.domain.form.StoreAddForm;
import cn.morefocus.admin.module.business.store.domain.form.StoreQueryForm;
import cn.morefocus.admin.module.business.store.domain.form.StoreUpdateForm;
import cn.morefocus.admin.module.business.store.domain.vo.StoreVO;
import cn.morefocus.admin.module.business.store.service.StoreService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 门店 Controller
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Tag(name = "")
@RestController
public class StoreController {

    @Resource
    private StoreService storeService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/store/queryPage")
    @SaCheckPermission("business:store:list")
    public R<PageResult<StoreVO>> queryPage(@RequestBody @Valid StoreQueryForm queryForm) {
        return R.ok(storeService.queryPage(queryForm));
    }

    /**
     * 查询所有
     */
    @SaCheckPermission("business:store:list")
    @PostMapping("/store/queryAll")
    public R<List<StoreVO>> queryAll() {
        return R.ok(storeService.queryAll());
    }

    /**
     * 新增
     */
    @SaCheckPermission("business:store:add")
    @Operation(summary = "新增")
    @PostMapping("/store/add")
    public R<String> add(@RequestBody @Valid StoreAddForm addForm) {
        return storeService.add(addForm);
    }

    /**
     * 编辑
     */
    @SaCheckPermission("business:store:update")
    @Operation(summary = "编辑")
    @PostMapping("/store/update")
    public R<String> update(@RequestBody @Valid StoreUpdateForm updateForm) {
        return storeService.update(updateForm);
    }

    /**
     * 批量删除
     */
    @SaCheckPermission("business:store:delete")
    @Operation(summary = "批量删除")
    @PostMapping("/store/batchDelete")
    public R<String> batchDelete(@RequestBody List<Long> idList) {
        return storeService.batchDelete(idList);
    }

    /**
     * 删除
     */
    @SaCheckPermission("business:store:delete")
    @Operation(summary = "单个删除")
    @PostMapping("/store/delete/{id}")
    public R<String> batchDelete(@PathVariable Long id) {
        return storeService.delete(id);
    }
}
