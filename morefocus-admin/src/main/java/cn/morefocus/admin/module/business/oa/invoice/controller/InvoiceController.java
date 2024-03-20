package cn.morefocus.admin.module.business.oa.invoice.controller;

import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.oa.invoice.service.InvoiceService;
import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceAddForm;
import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceQueryForm;
import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceUpdateForm;
import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceVO;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalRequestUtil;
import cn.morefocus.base.module.support.operatelog.annotation.OperateLog;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * OA发票信息
 *
 * @author loki
 */
@Slf4j
@RestController
@Tag(name = AdminSwaggerTagConst.Business.OA_INVOICE)
public class InvoiceController {

    @Resource
    private InvoiceService invoiceService;

    @Operation(summary = "分页查询发票信息 @author 善逸")
    @PostMapping("/oa/invoice/page/query")
    public R<PageResult<InvoiceVO>> queryByPage(@RequestBody @Valid InvoiceQueryForm queryForm) {
        return invoiceService.queryByPage(queryForm);
    }

    @Operation(summary = "查询发票信息详情 @author 善逸")
    @GetMapping("/oa/invoice/get/{invoiceId}")
    public R<InvoiceVO> getDetail(@PathVariable Long invoiceId) {
        return invoiceService.getDetail(invoiceId);
    }

    @Operation(summary = "新建发票信息 @author 善逸")
    @PostMapping("/oa/invoice/create")
    public R<String> createInvoice(@RequestBody @Valid InvoiceAddForm createVO) {
        RequestUser requestUser = LocalRequestUtil.getRequestUser();
        createVO.setCreateUserId(requestUser.getUserId());
        createVO.setCreateUserName(requestUser.getUserName());
        return invoiceService.createInvoice(createVO);
    }

    @Operation(summary = "编辑发票信息 @author 善逸")
    @PostMapping("/oa/invoice/update")
    @OperateLog
    public R<String> updateInvoice(@RequestBody @Valid InvoiceUpdateForm updateVO) {
        return invoiceService.updateInvoice(updateVO);
    }

    @Operation(summary = "删除发票信息 @author 善逸")
    @GetMapping("/invoice/delete/{invoiceId}")
    public R<String> deleteInvoice(@PathVariable Long invoiceId) {
        return invoiceService.deleteInvoice(invoiceId);
    }

    @Operation(summary = "查询列表 @author lidoudou")
    @GetMapping("/oa/invoice/query/list/{enterpriseId}")
    public R<List<InvoiceVO>> queryList(@PathVariable Long enterpriseId) {
        return invoiceService.queryList(enterpriseId);
    }


}
