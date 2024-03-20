package cn.morefocus.admin.module.business.oa.enterprise.domain.entity;

import cn.morefocus.base.common.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 企业员工
 *
 * @author loki
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_oa_enterprise_employee")
@NoArgsConstructor
public class EnterpriseEmployeeEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long enterpriseEmployeeId;

    /**
     * 企业ID
     */
    private Long enterpriseId;
    /**
     * 员工
     */
    private Long employeeId;

    public EnterpriseEmployeeEntity(Long enterpriseId, Long employeeId) {
        this.enterpriseId = enterpriseId;
        this.employeeId = employeeId;
    }
}
