package cn.morefocus.admin.module.system.datascope;

import cn.morefocus.admin.constants.AdminSwaggerTagConst;
import cn.morefocus.admin.module.system.datascope.domain.DataScopeAndViewTypeVO;
import cn.morefocus.admin.module.system.datascope.service.DataScopeService;
import cn.morefocus.base.common.domain.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 查询支持的数据范围类型
 */
@RestController
@Tag(name = AdminSwaggerTagConst.System.SYSTEM_DATA_SCOPE)
public class DataScopeController {

    @Resource
    private DataScopeService dataScopeService;

    @Operation(summary = "获取当前系统所配置的所有数据范围")
    @GetMapping("/dataScope/list")
    public R<List<DataScopeAndViewTypeVO>> dataScopeList() {
        return dataScopeService.dataScopeList();
    }

}
