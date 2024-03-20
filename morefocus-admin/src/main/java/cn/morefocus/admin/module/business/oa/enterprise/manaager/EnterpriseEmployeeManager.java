package cn.morefocus.admin.module.business.oa.enterprise.manaager;

import cn.morefocus.admin.module.business.oa.enterprise.mapper.EnterpriseEmployeeMapper;
import cn.morefocus.admin.module.business.oa.enterprise.domain.entity.EnterpriseEmployeeEntity;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 企业员工关系 manager
 *
 * @author loki
 */
@Service
public class EnterpriseEmployeeManager extends ServiceImpl<EnterpriseEmployeeMapper, EnterpriseEmployeeEntity> {
}