package cn.morefocus.base.module.support.reload.service;

import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.module.support.reload.mapper.ReloadItemMapper;
import cn.morefocus.base.module.support.reload.mapper.ReloadResultMapper;
import cn.morefocus.base.module.support.reload.domain.ReloadForm;
import cn.morefocus.base.module.support.reload.domain.ReloadItemEntity;
import cn.morefocus.base.module.support.reload.domain.ReloadItemVO;
import cn.morefocus.base.module.support.reload.domain.ReloadResultVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * reload (内存热加载、钩子等)
 *
 * @author loki
 */
@Service
public class ReloadService {

    @Resource
    private ReloadItemMapper reloadItemMapper;

    @Resource
    private ReloadResultMapper reloadResultMapper;

    /**
     * 查询
     *
     * @return
     */
    public R<List<ReloadItemVO>> query() {
        List<ReloadItemVO> list = reloadItemMapper.query();
        return R.ok(list);
    }

    public R<List<ReloadResultVO>> queryReloadItemResult(String tag) {
        List<ReloadResultVO> reloadResultList = reloadResultMapper.query(tag);
        return R.ok(reloadResultList);
    }


    /**
     * 通过标签更新标识符
     *
     * @param reloadForm
     * @return
     */
    public R<String> updateByTag(ReloadForm reloadForm) {
        ReloadItemEntity reloadItemEntity = reloadItemMapper.selectById(reloadForm.getTag());
        if (null == reloadItemEntity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        reloadItemEntity.setIdentification(reloadForm.getIdentification());
        reloadItemEntity.setUpdateTime(LocalDateTime.now());
        reloadItemEntity.setArgs(reloadForm.getArgs());
        reloadItemMapper.updateById(reloadItemEntity);
        return R.ok();
    }
}
