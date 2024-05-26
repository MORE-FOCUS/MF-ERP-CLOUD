package cn.morefocus.admin.module.business.attrs.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 辅助属性 列表VO
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class AttrsVO extends BaseVO {

    private Long id;

    /**
     * 单位名称
     */
    private String name;
}