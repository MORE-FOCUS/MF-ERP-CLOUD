package cn.morefocus.base.module.support.dict.service;

import cn.hutool.core.util.StrUtil;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.module.support.dict.domain.entity.DictKeyEntity;
import cn.morefocus.base.module.support.dict.domain.entity.DictValueEntity;
import cn.morefocus.base.module.support.dict.domain.vo.DictValueVO;
import cn.morefocus.base.module.support.dict.mapper.DictKeyMapper;
import cn.morefocus.base.module.support.dict.mapper.DictValueMapper;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

/**
 * 字典缓存 服务
 */
@Slf4j
@Service
public class DictCacheService {

    @Resource
    private DictKeyMapper dictKeyMapper;
    @Resource
    private DictValueMapper dictValueMapper;

    private ConcurrentHashMap<String, List<DictValueVO>> DICT_CACHE = new ConcurrentHashMap<>();

    private ConcurrentHashMap<String, DictValueVO> VALUE_CACHE = new ConcurrentHashMap<>();

    @PostConstruct
    public void dictCache() {
        this.cacheInit();
    }

    public void cacheInit() {
        List<DictKeyEntity> dictKeyEntityList = dictKeyMapper.selectByIsDeleted(false);
        if (CollectionUtils.isEmpty(dictKeyEntityList)) {
            return;
        }
        List<DictValueEntity> dictKeyValueList = dictValueMapper.selectByIsDeleted(false);
        List<DictValueVO> dictValueVOList = LocalBeanUtil.copyList(dictKeyValueList, DictValueVO.class);
        Map<Long, List<DictValueVO>> valueListMap = dictValueVOList.stream().collect(Collectors.groupingBy(DictValueVO::getDictKeyId));
        //字典键值对缓存
        for (DictKeyEntity dictKeyEntity : dictKeyEntityList) {
            String keyCode = dictKeyEntity.getKeyCode();
            Long dictKeyId = dictKeyEntity.getDictKeyId();
            DICT_CACHE.put(keyCode, valueListMap.getOrDefault(dictKeyId, Lists.newArrayList()));
        }

        //字典值缓存
        dictValueVOList.forEach(e -> {
            VALUE_CACHE.put(e.getValueCode(), e);
        });
        log.info("################# 数据字典缓存初始化完毕 ###################");
    }

    /**
     * 刷新缓存
     */
    public R<String> cacheRefresh() {
        DICT_CACHE.clear();
        VALUE_CACHE.clear();
        this.cacheInit();
        return R.ok();
    }

    /**
     * 查询某个key对应的字典值列表
     */
    public List<DictValueVO> selectByKeyCode(String keyCode) {
        return DICT_CACHE.getOrDefault(keyCode, Lists.newArrayList());
    }

    /**
     * 查询值code名称
     */
    public String selectValueNameByValueCode(String valueCode) {
        if (StrUtil.isEmpty(valueCode)) {
            return null;
        }

        DictValueVO dictValueVO = VALUE_CACHE.get(valueCode);
        if (dictValueVO == null) {
            return "";
        }
        return dictValueVO.getValueName();
    }

    public DictValueVO selectValueByValueCode(String valueCode) {
        if (StrUtil.isEmpty(valueCode)) {
            return null;
        }
        return VALUE_CACHE.get(valueCode);
    }

    public String selectValueNameByValueCodeSplit(String valueCodes) {
        if (StrUtil.isEmpty(valueCodes)) {
            return "";
        }
        List<String> valueNameList = Lists.newArrayList();
        String[] valueCodeArray = valueCodes.split(",");
        for (String valueCode : valueCodeArray) {
            DictValueVO dictValueVO = VALUE_CACHE.get(valueCode);
            if (dictValueVO != null) {
                valueNameList.add(dictValueVO.getValueName());
            }
        }
        return StringUtils.join(valueNameList, ",");
    }
}