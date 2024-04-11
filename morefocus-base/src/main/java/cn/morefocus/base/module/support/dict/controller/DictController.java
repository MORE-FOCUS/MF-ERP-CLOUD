package cn.morefocus.base.module.support.dict.controller;

import cn.morefocus.base.common.controller.SupportBaseController;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.constant.SwaggerTagConst;
import cn.morefocus.base.module.support.dict.domain.form.DictValueQueryForm;
import cn.morefocus.base.module.support.dict.domain.vo.DictKeyVO;
import cn.morefocus.base.module.support.dict.domain.vo.DictValueVO;
import cn.morefocus.base.module.support.dict.service.DictCacheService;
import cn.morefocus.base.module.support.dict.service.DictService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 字典
 */
@Tag(name = SwaggerTagConst.Support.DICT)
@RestController
public class DictController extends SupportBaseController {

    @Resource
    private DictService dictService;
    @Resource
    private DictCacheService dictCacheService;

    @Operation(summary = "查询全部字典key -")
    @GetMapping("/dict/key/queryAll")
    public R<List<DictKeyVO>> queryAll() {
        return R.ok(dictService.queryAllKey());
    }

    @Operation(summary = "分页查询数据字典value -")
    @PostMapping("/dict/value/query")
    public R<PageResult<DictValueVO>> valueQuery(@Valid @RequestBody DictValueQueryForm queryForm) {
        return dictService.valueQuery(queryForm);
    }

    @Operation(summary = "数据字典-值列表-")
    @GetMapping("/dict/value/list/{keyCode}")
    public R<List<DictValueVO>> valueList(@PathVariable String keyCode) {
        List<DictValueVO> dictValueVOList = dictCacheService.selectByKeyCode(keyCode);
        return R.ok(dictValueVOList);
    }
}
