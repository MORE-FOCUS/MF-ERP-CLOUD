package cn.morefocus.admin.module.business.billdetail.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单据操作记录
 * 列表VO
 *
 * @author loki
 * @date 2024-07-04 23:57:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BillDetailOperateLogVO extends BaseVO {

    private Long id;

    /**
     * 单据ID
     */
    private Long billId;

    /**
     * 单据明细ID
     */
    private Long billDetailId;

    /**
     * 操作类型
     * 1-制单
     * 2-审核
     * 3-反审核
     * 4-对单
     * 5-撤销对单
     * 6-锁定
     * 7-解锁
     */
    private Integer operateType;

}