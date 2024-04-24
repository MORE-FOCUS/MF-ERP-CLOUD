package cn.morefocus.base.module.support.serialnumber.strategy;

import cn.morefocus.base.module.support.serialnumber.constant.SerialNumberIdEnum;

import java.util.List;

/**
 * 单据序列号
 */
public interface SerialNumberGenerateService {

    /**
     * 生成1个
     */
    String generate(SerialNumberIdEnum serialNumberIdEnum);

    /**
     * 生成n个
     */
    List<String> generate(SerialNumberIdEnum serialNumberIdEnum, Integer count);
}
