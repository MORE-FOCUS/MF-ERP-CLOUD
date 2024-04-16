package cn.morefocus.admin.module.business.oa.enterprise.service;

import cn.morefocus.admin.module.business.oa.enterprise.domain.entity.EnterpriseEmployeeEntity;
import cn.morefocus.admin.module.business.oa.enterprise.domain.entity.EnterpriseEntity;
import cn.morefocus.admin.module.business.oa.enterprise.domain.form.*;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseEmployeeVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseExcelVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseListVO;
import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseVO;
import cn.morefocus.admin.module.business.oa.enterprise.manaager.EnterpriseEmployeeManager;
import cn.morefocus.admin.module.business.oa.enterprise.mapper.EnterpriseEmployeeMapper;
import cn.morefocus.admin.module.business.oa.enterprise.mapper.EnterpriseMapper;
import cn.morefocus.admin.module.system.department.service.DepartmentService;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import cn.morefocus.base.module.support.datatracer.domain.form.DataTracerForm;
import cn.morefocus.base.module.support.datatracer.service.DataTracerService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 企业
 */
@Service
@Slf4j
public class EnterpriseService {

    @Resource
    private EnterpriseMapper enterpriseMapper;

    @Resource
    private EnterpriseEmployeeMapper enterpriseEmployeeMapper;

    @Resource
    private EnterpriseEmployeeManager enterpriseEmployeeManager;

    @Resource
    private DataTracerService dataTracerService;

    @Resource
    private DepartmentService departmentService;

    /**
     * 分页查询企业模块
     */
    public R<PageResult<EnterpriseVO>> queryByPage(EnterpriseQueryForm queryForm) {
        queryForm.setIsDeleted(Boolean.FALSE);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<EnterpriseVO> enterpriseList = enterpriseMapper.queryPage(page, queryForm);
        PageResult<EnterpriseVO> pageResult = PageUtil.convert2PageResult(page, enterpriseList);
        return R.ok(pageResult);
    }

    /**
     * 获取导出数据
     */
    public List<EnterpriseExcelVO> getExcelExportData(EnterpriseQueryForm queryForm) {
        queryForm.setIsDeleted(false);
        return enterpriseMapper.selectExcelExportData(queryForm);
    }

    /**
     * 查询企业详情
     */
    public EnterpriseVO getDetail(Long enterpriseId) {
        return enterpriseMapper.getDetail(enterpriseId, Boolean.FALSE);
    }

    /**
     * 新建企业
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> createEnterprise(EnterpriseCreateForm createVO) {
        // 验证企业名称是否重复
        EnterpriseEntity validateEnterprise = enterpriseMapper.queryByEnterpriseName(createVO.getEnterpriseName(), null, Boolean.FALSE);
        if (Objects.nonNull(validateEnterprise)) {
            return R.userErrorParam("企业名称重复");
        }
        // 数据插入
        EnterpriseEntity insertEnterprise = LocalBeanUtil.copy(createVO, EnterpriseEntity.class);
        enterpriseMapper.insert(insertEnterprise);
        dataTracerService.insert(insertEnterprise.getEnterpriseId(), DataTracerTypeEnum.OA_ENTERPRISE);
        return R.ok();
    }

    /**
     * 编辑企业
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateEnterprise(EnterpriseUpdateForm updateVO) {
        Long enterpriseId = updateVO.getEnterpriseId();
        // 校验企业是否存在
        EnterpriseEntity enterpriseDetail = enterpriseMapper.selectById(enterpriseId);
        if (Objects.isNull(enterpriseDetail) || enterpriseDetail.getIsDeleted()) {
            return R.userErrorParam("企业不存在");
        }
        // 验证企业名称是否重复
        EnterpriseEntity validateEnterprise = enterpriseMapper.queryByEnterpriseName(updateVO.getEnterpriseName(), enterpriseId, Boolean.FALSE);
        if (Objects.nonNull(validateEnterprise)) {
            return R.userErrorParam("企业名称重复");
        }
        // 数据编辑
        EnterpriseEntity updateEntity = LocalBeanUtil.copy(enterpriseDetail, EnterpriseEntity.class);
        LocalBeanUtil.copyProperties(updateVO, updateEntity);
        enterpriseMapper.updateById(updateEntity);

        //变更记录
        DataTracerForm dataTracerForm = DataTracerForm.builder()
                .dataId(updateVO.getEnterpriseId())
                .type(DataTracerTypeEnum.OA_ENTERPRISE)
                .content("修改企业信息")
                .diffOld(dataTracerService.getChangeContent(enterpriseDetail))
                .diffNew(dataTracerService.getChangeContent(updateEntity))
                .build();

        dataTracerService.addTrace(dataTracerForm);
        return R.ok();
    }

    /**
     * 删除企业
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> deleteEnterprise(Long enterpriseId) {
        // 校验企业是否存在
        EnterpriseEntity enterpriseDetail = enterpriseMapper.selectById(enterpriseId);
        if (Objects.isNull(enterpriseDetail) || enterpriseDetail.getIsDeleted()) {
            return R.userErrorParam("企业不存在");
        }
        enterpriseMapper.deleteEnterprise(enterpriseId, Boolean.TRUE);
        dataTracerService.delete(enterpriseId, DataTracerTypeEnum.OA_ENTERPRISE);
        return R.ok();
    }

    /**
     * 企业列表查询
     */
    public R<List<EnterpriseListVO>> queryList(Integer type) {
        List<EnterpriseListVO> enterpriseList = enterpriseMapper.queryList(type, Boolean.FALSE, Boolean.FALSE);
        return R.ok(enterpriseList);
    }

    //----------------------------------------- 以下为员工相关--------------------------------------------

    /**
     * 企业添加员工
     */
    public synchronized R<String> addEmployee(EnterpriseEmployeeForm enterpriseEmployeeForm) {
        Long enterpriseId = enterpriseEmployeeForm.getEnterpriseId();
        EnterpriseEntity enterpriseEntity = enterpriseMapper.selectById(enterpriseId);
        if (enterpriseEntity == null || enterpriseEntity.getIsDeleted()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        //过滤掉已存在的员工
        List<Long> waitAddEmployeeIdList = enterpriseEmployeeForm.getEmployeeIdList();
        List<EnterpriseEmployeeEntity> enterpriseEmployeeEntityList = enterpriseEmployeeMapper.selectByEnterpriseAndEmployeeIdList(enterpriseId, waitAddEmployeeIdList);
        if (CollectionUtils.isNotEmpty(enterpriseEmployeeEntityList)) {
            List<Long> existEmployeeIdList = enterpriseEmployeeEntityList.stream().map(EnterpriseEmployeeEntity::getEmployeeId).collect(Collectors.toList());
            waitAddEmployeeIdList = waitAddEmployeeIdList.stream().filter(e -> !existEmployeeIdList.contains(e)).collect(Collectors.toList());
        }
        if (CollectionUtils.isEmpty(waitAddEmployeeIdList)) {
            return R.ok();
        }
        List<EnterpriseEmployeeEntity> batchAddList = Lists.newArrayList();
        for (Long employeeId : waitAddEmployeeIdList) {
            EnterpriseEmployeeEntity enterpriseEmployeeEntity = new EnterpriseEmployeeEntity();
            enterpriseEmployeeEntity.setEnterpriseId(enterpriseId);
            enterpriseEmployeeEntity.setEmployeeId(employeeId);
            batchAddList.add(enterpriseEmployeeEntity);
        }
        enterpriseEmployeeManager.saveBatch(batchAddList);
        return R.ok();
    }

    /**
     * 企业删除员工
     */
    public synchronized R<String> deleteEmployee(EnterpriseEmployeeForm enterpriseEmployeeForm) {
        Long enterpriseId = enterpriseEmployeeForm.getEnterpriseId();
        EnterpriseEntity enterpriseEntity = enterpriseMapper.selectById(enterpriseId);
        if (enterpriseEntity == null || enterpriseEntity.getIsDeleted()) {
            return R.error(UserErrorCode.DATA_NOT_EXIST);
        }
        List<Long> waitDeleteEmployeeIdList = enterpriseEmployeeForm.getEmployeeIdList();
        enterpriseEmployeeMapper.deleteByEnterpriseAndEmployeeIdList(enterpriseId, waitDeleteEmployeeIdList);
        return R.ok();
    }

    /**
     * 企业下员工列表
     */
    public List<EnterpriseEmployeeVO> employeeList(List<Long> enterpriseIdList) {
        if (CollectionUtils.isEmpty(enterpriseIdList)) {
            return Lists.newArrayList();
        }
        return enterpriseEmployeeMapper.selectByEnterpriseIdList(enterpriseIdList);
    }

    /**
     * 分页查询企业员工
     */
    public PageResult<EnterpriseEmployeeVO> queryPageEmployeeList(EnterpriseEmployeeQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<EnterpriseEmployeeVO> enterpriseEmployeeVOList = enterpriseEmployeeMapper.queryPageEmployeeList(page, queryForm);
        for (EnterpriseEmployeeVO enterpriseEmployeeVO : enterpriseEmployeeVOList) {
            enterpriseEmployeeVO.setDepartmentName(departmentService.getDepartmentPath(enterpriseEmployeeVO.getDeptId()));
        }
        return PageUtil.convert2PageResult(page, enterpriseEmployeeVOList);
    }
}
