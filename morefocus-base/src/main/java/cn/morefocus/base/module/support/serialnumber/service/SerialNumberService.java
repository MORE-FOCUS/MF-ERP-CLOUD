package cn.morefocus.base.module.support.serialnumber.service;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import cn.morefocus.base.module.support.serialnumber.domain.bo.SerialNumberAddFrom;
import cn.morefocus.base.module.support.serialnumber.domain.bo.SerialNumberUpdateFrom;
import cn.morefocus.base.module.support.serialnumber.mapper.SerialNumberMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 单据序列号记录
 */
@Service
public class SerialNumberService {

    @Resource
    private SerialNumberMapper serialNumberMapper;

    /**
     * 新增
     */
    public R<String> addSerialNumber(SerialNumberAddFrom form) {
        SerialNumberEntity serialNumberEntity = LocalBeanUtil.copy(form, SerialNumberEntity.class);
        serialNumberMapper.insert(serialNumberEntity);
        return R.ok();
    }

    /**
     * 编辑
     */
    public R<String> updateSerialNumber(SerialNumberUpdateFrom form) {
        SerialNumberEntity serialNumberEntity = serialNumberMapper.selectById(form.getSerialNumberId());
        if (null == serialNumberEntity) {
            serialNumberEntity = LocalBeanUtil.copy(form, SerialNumberEntity.class);
            serialNumberMapper.insert(serialNumberEntity);
        } else {
            serialNumberEntity = LocalBeanUtil.copy(form, SerialNumberEntity.class);
            serialNumberMapper.updateById(serialNumberEntity);
        }
        return R.ok();
    }

    /**
     * 删除
     */
    public R<String> deleteSerialNumber(Long id) {
        serialNumberMapper.deleteById(id);
        return R.ok();
    }
}
