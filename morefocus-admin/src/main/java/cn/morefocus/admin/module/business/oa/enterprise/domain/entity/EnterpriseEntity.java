package cn.morefocus.admin.module.business.oa.enterprise.domain.entity;

import cn.morefocus.admin.module.business.oa.enterprise.constant.EnterpriseTypeEnum;
import cn.morefocus.base.common.domain.BaseEntity;
import cn.morefocus.base.module.support.datatracer.annoation.DataTracerFieldEnum;
import cn.morefocus.base.module.support.datatracer.annoation.DataTracerFieldLabel;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 企业
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("t_oa_enterprise")
public class EnterpriseEntity extends BaseEntity {

    /**
     * 企业ID
     */
    @TableId(type = IdType.AUTO)
    private Long enterpriseId;

    /**
     * 企业名称
     */
    @DataTracerFieldLabel("企业名称")
    private String enterpriseName;

    /**
     * 企业logo
     */
    @DataTracerFieldLabel("企业logo")
    private String enterpriseLogo;

    /**
     * 统一社会信用代码
     */
    @DataTracerFieldLabel("统一社会信用代码")
    private String unifiedSocialCreditCode;

    /**
     * 类型
     *
     * @see EnterpriseTypeEnum
     */
    @DataTracerFieldLabel("类型")
    @DataTracerFieldEnum(enumClass = EnterpriseTypeEnum.class)
    private Integer type;

    /**
     * 联系人
     */
    @DataTracerFieldLabel("联系人")
    private String contact;

    /**
     * 联系人电话
     */
    @DataTracerFieldLabel("联系人电话")
    private String contactPhone;

    /**
     * 邮箱
     */
    @DataTracerFieldLabel("邮箱")
    private String email;

    /**
     * 省份
     */
    private Integer province;

    /**
     * 省份名称
     */
    @DataTracerFieldLabel("省份名称")
    private String provinceName;

    /**
     * 城市
     */
    private Integer city;

    /**
     * 城市名称
     */
    @DataTracerFieldLabel("城市名称")
    private String cityName;

    /**
     * 区县
     */
    private Integer district;

    /**
     * 区县名称
     */
    @DataTracerFieldLabel("区县名称")
    private String districtName;

    /**
     * 详细地址
     */
    @DataTracerFieldLabel("详细地址")
    private String address;

    /**
     * 营业执照
     */
    @DataTracerFieldLabel("营业执照")
    private String businessLicense;

    /**
     * 禁用状态
     */
    @DataTracerFieldLabel("禁用状态")
    private Boolean isDisabled;
}
