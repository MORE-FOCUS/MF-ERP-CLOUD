package cn.morefocus.admin.module.business.oa.enterprise.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.admin.constant.AdminSwaggerTagConst;
import cn.morefocus.admin.module.business.oa.enterprise.domain.form.*;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseEmployeeVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseExcelVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseListVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseVO;
import cn.morefocus.admin.module.business.oa.enterprise.service.EnterpriseService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.ResponseUtil;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.module.support.operatelog.annotation.OperateLog;
import com.alibaba.excel.EasyExcel;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

/**
 * 企业
 */
@Slf4j
@RestController
@Tag(name = AdminSwaggerTagConst.Business.OA_ENTERPRISE)
@OperateLog
public class EnterpriseController {

    @Resource
    private EnterpriseService enterpriseService;

    @Operation(summary = "分页查询企业模块 ")
    @PostMapping("/oa/enterprise/page/query")
    @SaCheckPermission("oa:enterprise:query")
    public R<PageResult<EnterpriseVO>> queryByPage(@RequestBody @Valid EnterpriseQueryForm queryForm) {
        return enterpriseService.queryByPage(queryForm);
    }

    @Operation(summary = "导出企业信息 ")
    @PostMapping("/oa/enterprise/exportExcel")
    public void exportExcel(@RequestBody @Valid EnterpriseQueryForm queryForm, HttpServletResponse response) throws IOException {
        List<EnterpriseExcelVO> data = enterpriseService.getExcelExportData(queryForm);
        if (CollectionUtils.isEmpty(data)) {
            ResponseUtil.write(response, R.userErrorParam("暂无数据"));
            return;
        }

        // 设置下载消息头
        ResponseUtil.setDownloadFileHeader(response, "企业基本信息.xls", null);

        // 下载
        EasyExcel.write(response.getOutputStream(), EnterpriseExcelVO.class)
                .autoCloseStream(Boolean.FALSE)
                .sheet("企业信息")
                .doWrite(data);
    }

    @Operation(summary = "查询企业详情 ")
    @GetMapping("/oa/enterprise/get/{enterpriseId}")
    @SaCheckPermission("oa:enterprise:detail")
    public R<EnterpriseVO> getDetail(@PathVariable Long enterpriseId) {
        return R.ok(enterpriseService.getDetail(enterpriseId));
    }

    @Operation(summary = "新建企业 ")
    @PostMapping("/oa/enterprise/create")
    @SaCheckPermission("oa:enterprise:add")
    public R<String> createEnterprise(@RequestBody @Valid EnterpriseCreateForm createVO) {
        RequestUser requestUser = SecurityContextHolder.getRequestUser();
        createVO.setCreateUserId(requestUser.getUserId());
        createVO.setCreateUserName(requestUser.getUserName());
        return enterpriseService.createEnterprise(createVO);
    }

    @Operation(summary = "编辑企业 ")
    @PostMapping("/oa/enterprise/update")
    @SaCheckPermission("oa:enterprise:update")
    public R<String> updateEnterprise(@RequestBody @Valid EnterpriseUpdateForm updateVO) {
        return enterpriseService.updateEnterprise(updateVO);
    }

    @Operation(summary = "删除企业 ")
    @GetMapping("/oa/enterprise/delete/{enterpriseId}")
    @SaCheckPermission("oa:enterprise:delete")
    public R<String> deleteEnterprise(@PathVariable Long enterpriseId) {
        return enterpriseService.deleteEnterprise(enterpriseId);
    }

    @Operation(summary = "按照类型查询企业 ")
    @GetMapping("/oa/enterprise/query/list")
    public R<List<EnterpriseListVO>> queryList(@RequestParam(value = "type", required = false) Integer type) {
        return enterpriseService.queryList(type);
    }

    @Operation(summary = "企业添加员工 ")
    @PostMapping("/oa/enterprise/employee/add")
    @SaCheckPermission("oa:enterprise:addEmployee")
    public R<String> addEmployee(@RequestBody @Valid EnterpriseEmployeeForm enterpriseEmployeeForm) {
        return enterpriseService.addEmployee(enterpriseEmployeeForm);
    }

    @Operation(summary = "查询企业全部员工 ")
    @PostMapping("/oa/enterprise/employee/list")
    public R<List<EnterpriseEmployeeVO>> employeeList(@RequestBody @Valid List<Long> enterpriseIdList) {
        return R.ok(enterpriseService.employeeList(enterpriseIdList));
    }

    @Operation(summary = "分页查询企业员工 ")
    @PostMapping("/oa/enterprise/employee/queryPage")
    public R<PageResult<EnterpriseEmployeeVO>> queryPageEmployeeList(@RequestBody @Valid EnterpriseEmployeeQueryForm queryForm) {
        return R.ok(enterpriseService.queryPageEmployeeList(queryForm));
    }

    @Operation(summary = "企业删除员工 ")
    @PostMapping("/oa/enterprise/employee/delete")
    @SaCheckPermission("oa:enterprise:deleteEmployee")
    public R<String> deleteEmployee(@RequestBody @Valid EnterpriseEmployeeForm enterpriseEmployeeForm) {
        return enterpriseService.deleteEmployee(enterpriseEmployeeForm);
    }
}
