package cn.morefocus.admin.module.business.attrs.service;

import cn.morefocus.admin.module.business.attrs.domain.entity.AttrsEntity;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsAddForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsPageQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsUpdateForm;
import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import cn.morefocus.admin.module.business.attrs.manager.AttrsManager;
import cn.morefocus.admin.module.business.attrs.mapper.AttrsMapper;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 辅助属性 Service
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Service
public class AttrsService {

    @Resource
    private AttrsMapper attrsMapper;
    @Resource
    private AttrsManager attrsManager;

    /**
     * 分页查询
     */
    public PageResult<AttrsVO> queryPage(AttrsPageQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<AttrsVO> list = attrsMapper.queryPage(page, queryForm);
        PageResult<AttrsVO> pageResult = PageUtil.convert2PageResult(page, list);
        return pageResult;
    }

    /**
     * 查询所有
     */
    public List<AttrsVO> queryAll(AttrsQueryForm queryForm) {
        List<AttrsVO> list = attrsManager.queryAttrs(queryForm);
        return list;
    }

    /**
     * 添加
     */
    public R<String> add(AttrsAddForm addForm) {
        AttrsEntity attrsEntity = LocalBeanUtil.copy(addForm, AttrsEntity.class);
        attrsMapper.insert(attrsEntity);

        attrsManager.removeCache();
        return R.ok();
    }

    /**
     * 更新
     */
    public R<String> update(AttrsUpdateForm updateForm) {
        AttrsEntity attrsEntity = LocalBeanUtil.copy(updateForm, AttrsEntity.class);
        attrsMapper.updateById(attrsEntity);

        attrsManager.removeCache();
        return R.ok();
    }

    /**
     * 批量删除
     */
    public R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        //TODO 被使用不能删除

        attrsMapper.deleteBatchIds(idList);

        attrsManager.removeCache();
        return R.ok();
    }

    /**
     * 单个删除
     */
    public R<String> delete(Long id) {
        if (null == id) {
            return R.ok();
        }

        //TODO 被使用不能删除

        attrsMapper.deleteById(id);

        attrsManager.removeCache();
        return R.ok();
    }

    /**
     * 更新禁用/启用状态
     */
    public R<String> updateIsDisabled(Long id) {
        if (null == id) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        AttrsEntity attrsEntity = attrsMapper.selectById(id);
        if (null == attrsEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        attrsMapper.updateIsDisabled(id, !attrsEntity.getIsDisabled());

        attrsManager.removeCache();
        return R.ok();
    }
}
