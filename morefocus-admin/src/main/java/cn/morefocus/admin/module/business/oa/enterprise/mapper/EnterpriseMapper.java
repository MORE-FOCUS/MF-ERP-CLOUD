package cn.morefocus.admin.module.business.oa.enterprise.mapper;

import cn.morefocus.admin.module.business.oa.enterprise.domain.entity.EnterpriseEntity;
import cn.morefocus.admin.module.business.oa.enterprise.domain.form.EnterpriseQueryForm;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseExcelVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseListVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 企业
 */
@Mapper
@Component
public interface EnterpriseMapper extends BaseMapper<EnterpriseEntity> {

    /**
     * 根据企业名称查询
     */
    EnterpriseEntity queryByEnterpriseName(@Param("enterpriseName") String enterpriseName, @Param("excludeEnterpriseId") Long excludeEnterpriseId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 删除企业
     */
    void deleteEnterprise(@Param("enterpriseId") Long enterpriseId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 企业分页查询
     */
    List<EnterpriseVO> queryPage(Page page, @Param("queryForm") EnterpriseQueryForm queryForm);

    /**
     * 查询导出的数据
     */
    List<EnterpriseExcelVO> selectExcelExportData(@Param("queryForm") EnterpriseQueryForm queryForm);

    /**
     * 查询企业详情
     */
    EnterpriseVO getDetail(@Param("enterpriseId") Long enterpriseId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 查询列表
     */
    List<EnterpriseListVO> queryList(@Param("type") Integer type, @Param("isDisabled") Boolean isDisabled, @Param("isDeleted") Boolean isDeleted);

}
