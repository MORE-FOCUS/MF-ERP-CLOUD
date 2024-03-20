package cn.morefocus.base.module.support.serialnumber.strategy;

import cn.morefocus.base.module.support.serialnumber.constant.SerialNumberIdEnum;

import java.util.List;

/**
 * 单据序列号
 *
 * @author loki
 */
public interface SerialNumberService {

    /**
     * 生成
     *
     * @param serialNumberIdEnum
     * @return
     */
    String generate(SerialNumberIdEnum serialNumberIdEnum);


    /**
     * 生成n个
     *
     * @param serialNumberIdEnum
     * @param count
     * @return
     */
    List<String> generate(SerialNumberIdEnum serialNumberIdEnum, int count);

}
