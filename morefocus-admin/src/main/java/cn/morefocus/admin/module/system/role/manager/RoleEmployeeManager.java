package cn.morefocus.admin.module.system.role.manager;

import cn.morefocus.admin.module.system.role.domain.entity.RoleEmployeeEntity;
import cn.morefocus.admin.module.system.role.mapper.RoleEmployeeMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色员工 manager
 */
@Service
public class RoleEmployeeManager extends ServiceImpl<RoleEmployeeMapper, RoleEmployeeEntity> {

    /**
     * 保存 角色员工
     */
    @Transactional(rollbackFor = Throwable.class)
    public void saveRoleEmployee(Long roleId, List<RoleEmployeeEntity> roleEmployeeList) {
        this.getBaseMapper().deleteByRoleId(roleId);
        if (CollectionUtils.isNotEmpty(roleEmployeeList)) {
            this.saveBatch(roleEmployeeList);
        }
    }
}
