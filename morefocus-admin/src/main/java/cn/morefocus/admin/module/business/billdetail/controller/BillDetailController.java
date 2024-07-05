package cn.morefocus.admin.module.business.billdetail.controller;

import cn.morefocus.admin.module.business.billdetail.domain.form.BillDetailQueryForm;
import cn.morefocus.admin.module.business.billdetail.domain.vo.BillDetailVO;
import cn.morefocus.admin.module.business.billdetail.service.BillDetailService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 单据明细 Controller
 *
 * @author loki
 * @date 2024-07-04 23:47:57
 */
@RestController
public class BillDetailController {

    @Resource
    private BillDetailService billDetailService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/bill-detail/queryPage")
    public R<PageResult<BillDetailVO>> queryPage(@RequestBody @Valid BillDetailQueryForm queryForm) {
        return R.ok(billDetailService.queryPage(queryForm));
    }
}
