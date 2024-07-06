package cn.morefocus.admin.module.business.bill.controller;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.bill.domain.form.BillQueryForm;
import cn.morefocus.admin.module.business.bill.domain.form.POAddForm;
import cn.morefocus.admin.module.business.bill.domain.form.POEditForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillVO;
import cn.morefocus.admin.module.business.bill.service.POService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 采购订单Controller
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@Tag(name = AdminSwaggerTagConst.Business.PURCHASE_ORDER)
@RestController
public class POController {

    @Resource
    private POService poService;

    /**
     * 订单分页列表
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/po/queryPage")
    public R<PageResult<BillVO>> queryPage(@RequestBody @Valid BillQueryForm queryForm) {
        return R.ok(poService.queryPage(queryForm));
    }

    /**
     * 订单详情
     */
    @GetMapping("/po/detail/{orderId}")
    public R getDetail(@PathVariable Long orderId) {
        return poService.getDetail(orderId);
    }

    /**
     * 新建采购订单
     */
    @Operation(summary = "新增采购订单")
    @PostMapping("/po/add")
    public R add(@RequestBody @Valid POAddForm poAddForm) {
        return poService.add(poAddForm);
    }

    /**
     * 新建采购订单
     */
    @Operation(summary = "编辑采购订单")
    @PostMapping("/po/edit")
    public R edit(@RequestBody @Valid POEditForm poEditForm) {
        return poService.edit(poEditForm);
    }
}