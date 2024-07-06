package cn.morefocus.admin.module.business.oa.bank.controler;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.oa.bank.domain.BankCreateForm;
import cn.morefocus.admin.module.business.oa.bank.domain.BankQueryForm;
import cn.morefocus.admin.module.business.oa.bank.domain.BankUpdateForm;
import cn.morefocus.admin.module.business.oa.bank.domain.BankVO;
import cn.morefocus.admin.module.business.oa.bank.service.BankService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.SecurityContextHolder;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * OA办公-OA银行信息
 */
@RestController
@Tag(name = AdminSwaggerTagConst.Business.OA_BANK)
public class BankController {

    @Resource
    private BankService bankService;

    @Operation(summary = "分页查询银行信息")
    @PostMapping("/oa/bank/page/query")
    public R<PageResult<BankVO>> queryByPage(@RequestBody @Valid BankQueryForm queryForm) {
        return bankService.queryByPage(queryForm);
    }

    @Operation(summary = "根据企业ID查询银行信息列表")
    @GetMapping("/oa/bank/query/list/{enterpriseId}")
    public R<List<BankVO>> queryList(@PathVariable Long enterpriseId) {
        return bankService.queryList(enterpriseId);
    }

    @Operation(summary = "查询银行信息详情")
    @GetMapping("/oa/bank/get/{bankId}")
    public R<BankVO> getDetail(@PathVariable Long bankId) {
        return bankService.getDetail(bankId);
    }

    @Operation(summary = "新建银行信息")
    @PostMapping("/oa/bank/create")
    public R<String> createBank(@RequestBody @Valid BankCreateForm createVO) {
        RequestUser requestUser = SecurityContextHolder.getRequestUser();
        createVO.setCreateUserId(requestUser.getUserId());
        createVO.setCreateUserName(requestUser.getUserName());
        return bankService.createBank(createVO);
    }

    @Operation(summary = "编辑银行信息")
    @PostMapping("/oa/bank/update")
    public R<String> updateBank(@RequestBody @Valid BankUpdateForm updateVO) {
        return bankService.updateBank(updateVO);
    }

    @Operation(summary = "删除银行信息")
    @GetMapping("/oa/bank/delete/{bankId}")
    public R<String> deleteBank(@PathVariable Long bankId) {
        return bankService.deleteBank(bankId);
    }
}
