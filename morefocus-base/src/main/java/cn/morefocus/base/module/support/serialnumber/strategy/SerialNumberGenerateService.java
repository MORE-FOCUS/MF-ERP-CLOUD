package cn.morefocus.base.module.support.serialnumber.strategy;

import java.util.List;

/**
 * 单据序列号
 */
public interface SerialNumberGenerateService {

    /**
     * 生成1个
     */
    String generate(Long serialNumberId);

    /**
     * 生成n个
     */
    List<String> generate(Long serialNumberId, Integer count);
}
