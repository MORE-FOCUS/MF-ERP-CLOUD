package cn.morefocus.admin.module.system.role.service;

import cn.morefocus.admin.module.system.role.domain.entity.RoleDataScopeEntity;
import cn.morefocus.admin.module.system.role.domain.form.RoleDataScopeUpdateForm;
import cn.morefocus.admin.module.system.role.domain.vo.RoleDataScopeVO;
import cn.morefocus.admin.module.system.role.manager.RoleDataScopeManager;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色-数据范围
 */
@Service
public class RoleDataScopeService {

    @Resource
    private RoleDataScopeManager roleDataScopeManager;

    /**
     * 获取某个角色的数据范围设置信息
     */
    public R<List<RoleDataScopeVO>> getRoleDataScopeList(Long roleId) {
        List<RoleDataScopeEntity> roleDataScopeEntityList = roleDataScopeManager.getBaseMapper().listByRoleId(roleId);
        if (CollectionUtils.isEmpty(roleDataScopeEntityList)) {
            return R.ok(Lists.newArrayList());
        }
        List<RoleDataScopeVO> roleDataScopeList = LocalBeanUtil.copyList(roleDataScopeEntityList, RoleDataScopeVO.class);
        return R.ok(roleDataScopeList);
    }

    /**
     * 批量设置某个角色的数据范围设置信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateRoleDataScopeList(RoleDataScopeUpdateForm roleDataScopeUpdateForm) {
        List<RoleDataScopeUpdateForm.RoleUpdateDataScopeListFormItem> batchSetList = roleDataScopeUpdateForm.getDataScopeItemList();
        if (CollectionUtils.isEmpty(batchSetList)) {
            return R.error(UserErrorCode.PARAM_ERROR, "缺少配置信息");
        }
        List<RoleDataScopeEntity> roleDataScopeEntityList = LocalBeanUtil.copyList(batchSetList, RoleDataScopeEntity.class);
        roleDataScopeEntityList.forEach(e -> e.setRoleId(roleDataScopeUpdateForm.getRoleId()));
        roleDataScopeManager.getBaseMapper().deleteByRoleId(roleDataScopeUpdateForm.getRoleId());
        roleDataScopeManager.saveBatch(roleDataScopeEntityList);
        return R.ok();
    }
}
