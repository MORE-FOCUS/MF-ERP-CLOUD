package cn.morefocus.admin.module.business.oa.enterprise.domain.vo;

import cn.morefocus.admin.module.business.oa.enterprise.constant.EnterpriseTypeEnum;
import cn.morefocus.base.common.json.serializer.FileKeyVoSerializer;
import cn.morefocus.base.common.swagger.SchemaEnum;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 企业信息
 */
@Data
public class EnterpriseVO {

    @Schema(description = "企业ID")
    private Long enterpriseId;

    @Schema(description = "企业名称")
    private String enterpriseName;

    @Schema(description = "企业logo")
    @JsonSerialize(using = FileKeyVoSerializer.class)
    private String enterpriseLogo;

    @Schema(description = "统一社会信用代码")
    private String unifiedSocialCreditCode;

    @SchemaEnum(desc = "类型", value = EnterpriseTypeEnum.class)
    private Integer type;

    @Schema(description = "联系人")
    private String contact;

    @Schema(description = "联系人电话")
    private String contactPhone;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "省份")
    private Integer province;

    @Schema(description = "省份名称")
    private String provinceName;

    @Schema(description = "城市")
    private Integer city;

    @Schema(description = "城市名称")
    private String cityName;

    @Schema(description = "区县")
    private Integer district;

    @Schema(description = "区县名称")
    private String districtName;

    @Schema(description = "详细地址")
    private String address;

    @Schema(description = "营业执照")
    @JsonSerialize(using = FileKeyVoSerializer.class)
    private String businessLicense;

    @Schema(description = "禁用状态")
    private Boolean disabledFlag;

    @Schema(description = "创建人ID")
    private Long createUserId;

    @Schema(description = "创建人名称")
    private String createUserName;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;

    @Schema(description = "更新时间")
    private LocalDateTime updateTime;

}
