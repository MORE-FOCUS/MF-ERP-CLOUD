package cn.morefocus.base.module.support.reload.service;

import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.module.support.reload.core.AbstractSmartReloadCommand;
import cn.morefocus.base.module.support.reload.core.domain.SmartReloadItem;
import cn.morefocus.base.module.support.reload.core.domain.SmartReloadResult;
import cn.morefocus.base.module.support.reload.mapper.ReloadItemMapper;
import cn.morefocus.base.module.support.reload.mapper.ReloadResultMapper;
import cn.morefocus.base.module.support.reload.domain.ReloadItemEntity;
import cn.morefocus.base.module.support.reload.domain.ReloadResultEntity;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * reload 操作
 *
 * @author loki
 */
@Component
public class ReloadCommand extends AbstractSmartReloadCommand {

    @Resource
    private ReloadItemMapper reloadItemMapper;

    @Resource
    private ReloadResultMapper reloadResultMapper;

    /**
     * 读取数据库中SmartReload项
     *
     * @return List<ReloadItem>
     */
    @Override
    public List<SmartReloadItem> readReloadItem() {
        List<ReloadItemEntity> reloadItemEntityList = reloadItemMapper.selectList(null);
        return LocalBeanUtil.copyList(reloadItemEntityList, SmartReloadItem.class);
    }


    /**
     * 保存reload结果
     *
     * @param smartReloadResult
     */
    @Override
    public void handleReloadResult(SmartReloadResult smartReloadResult) {
        ReloadResultEntity reloadResultEntity = LocalBeanUtil.copy(smartReloadResult, ReloadResultEntity.class);
        reloadResultMapper.insert(reloadResultEntity);
    }
}
