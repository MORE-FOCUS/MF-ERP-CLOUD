package cn.morefocus.base.module.support.config.service;

import cn.hutool.core.util.StrUtil;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.constant.ReloadConst;
import cn.morefocus.base.module.support.config.mapper.ConfigMapper;
import cn.morefocus.base.module.support.config.ConfigKeyEnum;
import cn.morefocus.base.module.support.config.domain.*;
import cn.morefocus.base.module.support.reload.core.annoation.SmartReload;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 系统配置业务类
 *
 * @author loki
 */
@Slf4j
@Service
public class ConfigService {

    /**
     * 一个简单的系统配置缓存
     */
    private final ConcurrentHashMap<String, ConfigEntity> configCache = new ConcurrentHashMap<>();

    @Resource
    private ConfigMapper configMapper;

    @SmartReload(ReloadConst.CONFIG_RELOAD)
    public void configReload(String param) {
        this.loadConfigCache();
    }

    /**
     * 初始化系统设置缓存
     */
    @PostConstruct
    private void loadConfigCache() {
        configCache.clear();
        List<ConfigEntity> entityList = configMapper.selectList(null);
        if (CollectionUtils.isEmpty(entityList)) {
            return;
        }
        entityList.forEach(entity -> this.configCache.put(entity.getConfigKey().toLowerCase(), entity));
        log.info("################# 系统配置缓存初始化完毕:{} ###################", configCache.size());
    }

    /**
     * 刷新系统设置缓存
     */
    private void refreshConfigCache(Long configId) {
        // 重新查询 加入缓存
        ConfigEntity configEntity = configMapper.selectById(configId);
        if (null == configEntity) {
            return;
        }
        this.configCache.put(configEntity.getConfigKey().toLowerCase(), configEntity);
    }

    /**
     * 分页查询系统配置
     */
    public R<PageResult<ConfigVO>> queryConfigPage(ConfigQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<ConfigEntity> entityList = configMapper.queryByPage(page, queryForm);
        PageResult<ConfigVO> pageResult = PageUtil.convert2PageResult(page, entityList, ConfigVO.class);
        return R.ok(pageResult);
    }

    /**
     * 查询配置缓存
     */
    public ConfigVO getConfig(ConfigKeyEnum configKey) {
        return this.getConfig(configKey.getValue());
    }

    /**
     * 查询配置缓存
     */
    public ConfigVO getConfig(String configKey) {
        if (StrUtil.isBlank(configKey)) {
            return null;
        }
        ConfigEntity entity = this.configCache.get(configKey.toLowerCase());
        return LocalBeanUtil.copy(entity, ConfigVO.class);
    }

    /**
     * 查询配置缓存参数
     */
    public String getConfigValue(ConfigKeyEnum configKey) {
        return this.getConfig(configKey).getConfigValue();
    }

    /**
     * 根据参数key查询 并转换为对象
     */
    public <T> T getConfigValue2Obj(ConfigKeyEnum configKey, Class<T> clazz) {
        String configValue = this.getConfigValue(configKey);
        return JSON.parseObject(configValue, clazz);
    }

    /**
     * 添加系统配置
     */
    public R<String> add(ConfigAddForm configAddDTO) {
        ConfigEntity entity = configMapper.selectByKey(configAddDTO.getConfigKey());
        if (null != entity) {
            return R.error(UserErrorCode.ALREADY_EXIST);
        }
        entity = LocalBeanUtil.copy(configAddDTO, ConfigEntity.class);
        configMapper.insert(entity);

        // 刷新缓存
        this.refreshConfigCache(entity.getConfigId());
        return R.ok();
    }

    /**
     * 更新系统配置
     */
    public R<String> updateConfig(ConfigUpdateForm updateDTO) {
        Long configId = updateDTO.getConfigId();
        ConfigEntity entity = configMapper.selectById(configId);
        if (null == entity) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        ConfigEntity alreadyEntity = configMapper.selectByKey(updateDTO.getConfigKey());
        if (null != alreadyEntity && !Objects.equals(configId, alreadyEntity.getConfigId())) {
            return R.error(UserErrorCode.ALREADY_EXIST, "config key 已存在");
        }

        // 更新数据
        entity = LocalBeanUtil.copy(updateDTO, ConfigEntity.class);
        configMapper.updateById(entity);

        // 刷新缓存
        this.refreshConfigCache(configId);
        return R.ok();
    }

    /**
     * 更新系统配置
     */
    public R<String> updateValueByKey(ConfigKeyEnum key, String value) {
        ConfigVO config = this.getConfig(key);
        if (null == config) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }

        // 更新数据
        Long configId = config.getConfigId();
        ConfigEntity entity = new ConfigEntity();
        entity.setConfigId(configId);
        entity.setConfigValue(value);
        configMapper.updateById(entity);

        // 刷新缓存
        this.refreshConfigCache(configId);
        return R.ok();
    }
}
