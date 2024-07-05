package cn.morefocus.admin.module.business.billdetail.controller;

import cn.morefocus.admin.module.business.billdetail.domain.form.BillDetailOperateLogQueryForm;
import cn.morefocus.admin.module.business.billdetail.domain.vo.BillDetailOperateLogVO;
import cn.morefocus.admin.module.business.billdetail.service.BillDetailOperateLogService;
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
 * @date 2024-07-04 23:57:01
 */
@RestController
public class BillDetailOperateLogController {

    @Resource
    private BillDetailOperateLogService billDetailOperateLogService;

    /**
     * 分页查询
     */
    @Operation(summary = "查询分页列表")
    @PostMapping("/bill-detail/operate-log/queryPage")
    public R<PageResult<BillDetailOperateLogVO>> queryPage(@RequestBody @Valid BillDetailOperateLogQueryForm queryForm) {
        return R.ok(billDetailOperateLogService.queryPage(queryForm));
    }
}
