package cn.morefocus.base.module.support.changelog.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.changelog.domain.entity.ChangeLogEntity;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogAddForm;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogQueryForm;
import cn.morefocus.base.module.support.changelog.domain.form.ChangeLogUpdateForm;
import cn.morefocus.base.module.support.changelog.domain.vo.ChangeLogVO;
import cn.morefocus.base.module.support.changelog.mapper.ChangeLogMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 系统更新日志 Service
 *
 *
 */

@Service
public class ChangeLogService {

    @Resource
    private ChangeLogMapper changeLogMapper;

    /**
     * 分页查询
     */
    public PageResult<ChangeLogVO> queryPage(ChangeLogQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<ChangeLogVO> list = changeLogMapper.queryPage(page, queryForm);
        return PageUtil.convert2PageResult(page, list);
    }

    /**
     * 添加
     */
    public synchronized R<String> add(ChangeLogAddForm addForm) {
        ChangeLogEntity existVersion = changeLogMapper.selectByVersion(addForm.getVersion());
        if (existVersion != null) {
            return R.userErrorParam("此版本已经存在");
        }

        ChangeLogEntity changeLogEntity = LocalBeanUtil.copy(addForm, ChangeLogEntity.class);
        changeLogMapper.insert(changeLogEntity);
        return R.ok();
    }

    /**
     * 更新
     */
    public synchronized R<String> update(ChangeLogUpdateForm updateForm) {
        ChangeLogEntity existVersion = changeLogMapper.selectByVersion(updateForm.getVersion());
        if (existVersion != null && !updateForm.getChangeLogId().equals(existVersion.getChangeLogId())) {
            return R.userErrorParam("此版本已经存在");
        }
        ChangeLogEntity changeLogEntity = LocalBeanUtil.copy(updateForm, ChangeLogEntity.class);
        changeLogMapper.updateById(changeLogEntity);
        return R.ok();
    }

    /**
     * 批量删除
     */
    public synchronized R<String> batchDelete(List<Long> idList) {
        if (CollectionUtils.isEmpty(idList)) {
            return R.ok();
        }

        changeLogMapper.deleteBatchIds(idList);
        return R.ok();
    }

    /**
     * 单个删除
     */
    public synchronized R<String> delete(Long changeLogId) {
        if (null == changeLogId) {
            return R.ok();
        }

        changeLogMapper.deleteById(changeLogId);
        return R.ok();
    }
}
