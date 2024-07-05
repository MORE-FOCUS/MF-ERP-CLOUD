package cn.morefocus.admin.module.business.bill.controller;

import cn.morefocus.admin.module.business.bill.domain.form.BillQueryForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillVO;
import cn.morefocus.admin.module.business.bill.service.BillService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 单据 Controller
 *
 * @author loki
 * @date 2024-07-04 23:20:21
 */
@Tag(name = "")
@RestController
public class BillController {

    @Resource
    private BillService billService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/bill/queryPage")
    public R<PageResult<BillVO>> queryPage(@RequestBody @Valid BillQueryForm queryForm) {
        return R.ok(billService.queryPage(queryForm));
    }
}
