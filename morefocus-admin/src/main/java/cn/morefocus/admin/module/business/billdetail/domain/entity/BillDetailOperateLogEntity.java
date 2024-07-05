package cn.morefocus.admin.module.business.billdetail.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 单据操作记录
 * 实体类
 *
 * @author loki
 * @date 2024-07-04 23:57:01
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_bill_detail_operate_log")
public class BillDetailOperateLogEntity extends BaseEntity {

    /**
     * 分类id
     */
    @TableId(type = IdType.AUTO)
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