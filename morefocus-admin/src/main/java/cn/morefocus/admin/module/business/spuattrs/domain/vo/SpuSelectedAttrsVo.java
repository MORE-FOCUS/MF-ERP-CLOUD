package cn.morefocus.admin.module.business.spuattrs.domain.vo;

import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import lombok.Data;

import java.util.List;

/**
 * 商品附加属性 查询表单
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SpuSelectedAttrsVo {
    /**
     * 属性类目
     */
    private Long categoryId;

    /**
     * 属性类目名称
     */
    private String categoryName;

    /**
     * 选择的属性
     */
    private List<AttrsVO> selectedAttrsList;
}