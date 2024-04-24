package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalEnumUtil;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.serialnumber.constant.SerialNumberIdEnum;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberRecordEntity;
import cn.morefocus.base.module.support.serialnumber.domain.bo.*;
import cn.morefocus.base.module.support.serialnumber.mapper.SerialNumberMapper;
import cn.morefocus.base.module.support.serialnumber.service.SerialNumberRecordService;
import cn.morefocus.base.module.support.serialnumber.service.SerialNumberService;
import cn.morefocus.base.module.support.serialnumber.strategy.SerialNumberGenerateService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 单据序列号
 */
@Tag(name = SwaggerTagConst.Support.SERIAL_NUMBER)
@RestController
public class AdminSerialNumberController extends SupportBaseController {
    @Resource
    private SerialNumberMapper serialNumberMapper;
    @Resource
    private SerialNumberGenerateService serialNumberGenerateService;
    @Resource
    private SerialNumberRecordService serialNumberRecordService;
    @Resource
    private SerialNumberService serialNumberService;

    @Operation(summary = "生成单号")
    @PostMapping("/serial-number/generate-one")
    @SaCheckPermission("support:serialNumber:generate")
    public R<String> generateOne(@RequestBody @Valid SerialNumberGenerateOneForm generateForm) {
        SerialNumberIdEnum serialNumberIdEnum = LocalEnumUtil.getEnumByValue(generateForm.getSerialNumberId(), SerialNumberIdEnum.class);
        if (null == serialNumberIdEnum) {
            return R.userErrorParam("SerialNumberId，不存在" + generateForm.getSerialNumberId());
        }
        return R.ok(serialNumberGenerateService.generate(serialNumberIdEnum));
    }

    @Operation(summary = "生成单号")
    @PostMapping("/serial-number/generate")
    @SaCheckPermission("support:serialNumber:generate")
    public R<List<String>> generate(@RequestBody @Valid SerialNumberGenerateForm generateForm) {
        SerialNumberIdEnum serialNumberIdEnum = LocalEnumUtil.getEnumByValue(generateForm.getSerialNumberId(), SerialNumberIdEnum.class);
        if (null == serialNumberIdEnum) {
            return R.userErrorParam("SerialNumberId，不存在" + generateForm.getSerialNumberId());
        }
        return R.ok(serialNumberGenerateService.generate(serialNumberIdEnum, generateForm.getCount()));
    }

    @Operation(summary = "获取所有单号定义")
    @GetMapping("/serial-number/all")
    public R<List<SerialNumberEntity>> getAll() {
        return R.ok(serialNumberMapper.selectList(null));
    }

    @Operation(summary = "获取生成记录")
    @PostMapping("/serial-number/queryRecord")
    @SaCheckPermission("support:serialNumber:record")
    public R<PageResult<SerialNumberRecordEntity>> queryRecord(@RequestBody @Valid SerialNumberRecordQueryForm queryForm) {
        return R.ok(serialNumberRecordService.query(queryForm));
    }

    @Operation(summary = "新增")
    @PostMapping("/serial-number/add")
    @SaCheckPermission("support:serialNumber:add")
    public R<String> add(@RequestBody @Valid SerialNumberAddFrom form) {
        return serialNumberService.addSerialNumber(form);
    }

    @Operation(summary = "编辑")
    @PostMapping("/serial-number/update")
    @SaCheckPermission("support:serialNumber:update")
    public R<String> add(@RequestBody @Valid SerialNumberUpdateFrom form) {
        return serialNumberService.updateSerialNumber(form);
    }

    @Operation(summary = "单个删除")
    @GetMapping("/serial-number/delete/{id}")
    @SaCheckPermission("support:serialNumber:delete")
    public R<String> batchDelete(@PathVariable Long id) {
        return serialNumberService.deleteSerialNumber(id);
    }
}
