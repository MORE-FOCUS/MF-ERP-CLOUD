package cn.morefocus.admin.module.system.support;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.dict.domain.form.*;
import cn.morefocus.base.module.support.dict.domain.vo.DictKeyVO;
import cn.morefocus.base.module.support.dict.service.DictCacheService;
import cn.morefocus.base.module.support.dict.service.DictService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 字典
 */
@Tag(name = SwaggerTagConst.Support.DICT)
@RestController
public class AdminDictController extends SupportBaseController {

    @Resource
    private DictService dictService;

    @Resource
    private DictCacheService dictCacheService;

    @Operation(summary = "分页查询数据字典KEY")
    @PostMapping("/dict/key/query")
    public R<PageResult<DictKeyVO>> keyQuery(@Valid @RequestBody DictKeyQueryForm queryForm) {
        return dictService.keyQuery(queryForm);
    }

    @Operation(summary = "数据字典KEY-添加")
    @PostMapping("/dict/key/add")
    @SaCheckPermission("support:dict:add")
    public R<String> keyAdd(@Valid @RequestBody DictKeyAddForm keyAddForm) {
        return dictService.keyAdd(keyAddForm);
    }

    @Operation(summary = "数据字典缓存-刷新")
    @GetMapping("/dict/cache/refresh")
    @SaCheckPermission("support:dict:refresh")
    public R<String> cacheRefresh() {
        return dictCacheService.cacheRefresh();
    }

    @Operation(summary = "数据字典Value-添加")
    @PostMapping("/dict/value/add")
    public R<String> valueAdd(@Valid @RequestBody DictValueAddForm valueAddForm) {
        return dictService.valueAdd(valueAddForm);
    }

    @Operation(summary = "数据字典KEY-更新")
    @PostMapping("/dict/key/edit")
    @SaCheckPermission("support:dict:edit")
    public R<String> keyEdit(@Valid @RequestBody DictKeyUpdateForm keyUpdateForm) {
        return dictService.keyEdit(keyUpdateForm);
    }

    @Operation(summary = "数据字典Value-更新")
    @PostMapping("/dict/value/edit")
    public R<String> valueEdit(@Valid @RequestBody DictValueUpdateForm valueUpdateForm) {
        return dictService.valueEdit(valueUpdateForm);
    }

    @Operation(summary = "数据字典KEY-删除")
    @PostMapping("/dict/key/delete")
    @SaCheckPermission("support:dict:delete")
    public R<String> keyDelete(@RequestBody List<Long> keyIdList) {
        return dictService.keyDelete(keyIdList);
    }

    @Operation(summary = "数据字典Value-删除")
    @PostMapping("/dict/value/delete")
    public R<String> valueDelete(@RequestBody List<Long> valueIdList) {
        return dictService.valueDelete(valueIdList);
    }

}
