package cn.morefocus.admin.module.business.bill.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.bill.constant.BillStatusEnum;
import cn.morefocus.admin.module.business.bill.domain.form.BillQueryForm;
import cn.morefocus.admin.module.business.bill.domain.form.po.POAddForm;
import cn.morefocus.admin.module.business.bill.domain.form.po.POEditForm;
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
 * 购货订单Controller
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
    @SaCheckPermission("business:purchase-order:list")
    public R<PageResult<BillVO>> queryPage(@RequestBody @Valid BillQueryForm queryForm) {
        queryForm.setBillType(BillStatusEnum.GHDD.getValue());
        return R.ok(poService.queryPage(queryForm));
    }

    /**
     * 订单详情
     */
    @GetMapping("/po/detail/{orderId}")
    @SaCheckPermission("business:purchase-order:list")
    public R getDetail(@PathVariable Long orderId) {
        return poService.getDetail(orderId);
    }

    /**
     * 新建购货订单
     */
    @Operation(summary = "新增购货订单")
    @PostMapping("/po/add")
    @SaCheckPermission("business:purchase-order:add")
    public R add(@RequestBody @Valid POAddForm poAddForm) {
        return poService.add(poAddForm);
    }

    /**
     * 新建购货订单
     */
    @Operation(summary = "编辑购货订单")
    @PostMapping("/po/edit")
    @SaCheckPermission("business:purchase-order:edit")
    public R edit(@RequestBody @Valid POEditForm poEditForm) {
        return poService.edit(poEditForm);
    }
}