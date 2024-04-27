package cn.morefocus.admin.module.system.datascope.service;

import cn.morefocus.admin.module.system.datascope.constant.DataScopeTypeEnum;
import cn.morefocus.admin.module.system.datascope.constant.DataScopeViewTypeEnum;
import cn.morefocus.admin.module.system.datascope.domain.DataScopeAndViewTypeVO;
import cn.morefocus.admin.module.system.datascope.domain.DataScopeDTO;
import cn.morefocus.admin.module.system.datascope.domain.DataScopeViewTypeVO;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 数据范围 保存
 */
@Service
public class DataScopeService {

    /**
     * 获取所有可以进行数据范围配置的信息
     */
    public R<List<DataScopeAndViewTypeVO>> dataScopeList() {
        List<DataScopeDTO> dataScopeList = this.getDataScopeType();
        List<DataScopeAndViewTypeVO> dataScopeAndTypeList = LocalBeanUtil.copyList(dataScopeList, DataScopeAndViewTypeVO.class);
        List<DataScopeViewTypeVO> typeList = this.getViewType();
        dataScopeAndTypeList.forEach(e -> {
            e.setViewTypeList(typeList);
        });
        return R.ok(dataScopeAndTypeList);
    }

    /**
     * 获取当前系统存在的数据可见范围
     */
    public List<DataScopeViewTypeVO> getViewType() {
        List<DataScopeViewTypeVO> viewTypeList = Lists.newArrayList();
        DataScopeViewTypeEnum[] enums = DataScopeViewTypeEnum.class.getEnumConstants();
        DataScopeViewTypeVO dataScopeViewTypeDTO;
        for (DataScopeViewTypeEnum viewTypeEnum : enums) {
            dataScopeViewTypeDTO = DataScopeViewTypeVO.builder()
                    .viewType(viewTypeEnum.getValue())
                    .viewTypeLevel(viewTypeEnum.getLevel())
                    .viewTypeName(viewTypeEnum.getDesc())
                    .build();
            viewTypeList.add(dataScopeViewTypeDTO);
        }
        return viewTypeList.stream().sorted(Comparator.comparing(DataScopeViewTypeVO::getViewTypeLevel)).collect(Collectors.toList());
    }

    public List<DataScopeDTO> getDataScopeType() {
        List<DataScopeDTO> dataScopeTypeList = Lists.newArrayList();
        DataScopeTypeEnum[] enums = DataScopeTypeEnum.class.getEnumConstants();
        DataScopeDTO dataScopeDTO;
        for (DataScopeTypeEnum typeEnum : enums) {
            dataScopeDTO = DataScopeDTO.builder()
                    .dataScopeType(typeEnum.getValue())
                    .dataScopeTypeDesc(typeEnum.getDesc())
                    .dataScopeTypeName(typeEnum.getName())
                    .dataScopeTypeSort(typeEnum.getSort())
                    .build();
            dataScopeTypeList.add(dataScopeDTO);
        }
        return dataScopeTypeList.stream().sorted(Comparator.comparing(DataScopeDTO::getDataScopeTypeSort)).collect(Collectors.toList());
    }

}
