package cn.morefocus.admin.module.business.store.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 门店 列表VO
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class StoreVO extends BaseVO {

    private Long id;

    /**
     * 是否禁用 1-禁用 0-启用
     */
    private Boolean isDisabled;

    /**
     * 编号
     */
    private String code;

    /**
     * 名称
     */
    private String name;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String tel;

}