package cn.morefocus.base.module.support.reload.core.domain;

import lombok.Data;

/**
 * reload项目
 *
 *
 */
@Data
public class SmartReloadItem {

    /**
     * 项名称
     */
    private String tag;

    /**
     * 参数
     */
    private String args;

    /**
     * 标识
     */
    private String identification;

}
