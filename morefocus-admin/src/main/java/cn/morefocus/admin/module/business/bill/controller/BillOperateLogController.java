package cn.morefocus.admin.module.business.bill.controller;

import cn.morefocus.admin.module.business.bill.domain.form.BillOperateLogQueryForm;
import cn.morefocus.admin.module.business.bill.domain.vo.BillOperateLogVO;
import cn.morefocus.admin.module.business.bill.service.BillOperateLogService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 单据操作记录
 * Controller
 *
 * @author loki
 * @date 2024-07-04 23:55:25
 */
@RestController
public class BillOperateLogController {

    @Resource
    private BillOperateLogService billOperateLogService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/bill/operate-log/queryPage")
    public R<PageResult<BillOperateLogVO>> queryPage(@RequestBody @Valid BillOperateLogQueryForm queryForm) {
        return R.ok(billOperateLogService.queryPage(queryForm));
    }
}
