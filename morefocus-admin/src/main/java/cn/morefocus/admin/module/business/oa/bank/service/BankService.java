package cn.morefocus.admin.module.business.oa.bank.service;

import cn.morefocus.admin.module.business.oa.bank.domain.*;
import cn.morefocus.admin.module.business.oa.bank.mapper.BankMapper;
import cn.morefocus.admin.module.business.oa.enterprise.domain.entity.EnterpriseEntity;
import cn.morefocus.admin.module.business.oa.enterprise.mapper.EnterpriseMapper;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerConst;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import cn.morefocus.base.module.support.datatracer.service.DataTracerService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * OA办公-OA银行信息
 */
@Service
@Slf4j
public class BankService {

    @Resource
    private BankMapper bankMapper;

    @Resource
    private EnterpriseMapper enterpriseMapper;

    @Resource
    private DataTracerService dataTracerService;

    /**
     * 分页查询银行信息
     */
    public R<PageResult<BankVO>> queryByPage(BankQueryForm queryForm) {
        queryForm.setDeleteFlag(Boolean.FALSE);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<BankVO> bankList = bankMapper.queryPage(page, queryForm);
        PageResult<BankVO> pageResult = PageUtil.convert2PageResult(page, bankList);
        return R.ok(pageResult);
    }

    /**
     * 根据企业ID查询不分页的银行列表
     */
    public R<List<BankVO>> queryList(Long enterpriseId) {
        BankQueryForm queryForm = new BankQueryForm();
        queryForm.setEnterpriseId(enterpriseId);
        queryForm.setDeleteFlag(Boolean.FALSE);
        List<BankVO> bankList = bankMapper.queryPage(null, queryForm);
        return R.ok(bankList);
    }

    /**
     * 查询银行信息详情
     */
    public R<BankVO> getDetail(Long bankId) {
        // 校验银行信息是否存在
        BankVO bankVO = bankMapper.getDetail(bankId, Boolean.FALSE);
        if (Objects.isNull(bankVO)) {
            return R.userErrorParam("银行信息不存在");
        }
        return R.ok(bankVO);
    }

    /**
     * 新建银行信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> createBank(BankCreateForm createVO) {
        Long enterpriseId = createVO.getEnterpriseId();
        // 校验企业是否存在
        EnterpriseEntity enterpriseDetail = enterpriseMapper.selectById(enterpriseId);
        if (Objects.isNull(enterpriseDetail) || enterpriseDetail.getDeleteFlag()) {
            return R.userErrorParam("企业不存在");
        }
        // 验证银行信息账号是否重复
        BankEntity validateBank = bankMapper.queryByAccountNumber(enterpriseId, createVO.getAccountNumber(), null, Boolean.FALSE);
        if (Objects.nonNull(validateBank)) {
            return R.userErrorParam("银行信息账号重复");
        }
        // 数据插入
        BankEntity insertBank = LocalBeanUtil.copy(createVO, BankEntity.class);
        bankMapper.insert(insertBank);
        dataTracerService.addTrace(enterpriseId, DataTracerTypeEnum.OA_ENTERPRISE, "新增银行:" + DataTracerConst.HTML_BR + dataTracerService.getChangeContent(insertBank));
        return R.ok();
    }

    /**
     * 编辑银行信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateBank(BankUpdateForm updateVO) {
        Long enterpriseId = updateVO.getEnterpriseId();
        // 校验企业是否存在
        EnterpriseEntity enterpriseDetail = enterpriseMapper.selectById(enterpriseId);
        if (Objects.isNull(enterpriseDetail) || enterpriseDetail.getDeleteFlag()) {
            return R.userErrorParam("企业不存在");
        }
        Long bankId = updateVO.getBankId();
        // 校验银行信息是否存在
        BankEntity bankDetail = bankMapper.selectById(bankId);
        if (Objects.isNull(bankDetail) || bankDetail.getDeleteFlag()) {
            return R.userErrorParam("银行信息不存在");
        }
        // 验证银行信息账号是否重复
        BankEntity validateBank = bankMapper.queryByAccountNumber(updateVO.getEnterpriseId(), updateVO.getAccountNumber(), bankId, Boolean.FALSE);
        if (Objects.nonNull(validateBank)) {
            return R.userErrorParam("银行信息账号重复");
        }
        // 数据编辑
        BankEntity updateBank = LocalBeanUtil.copy(updateVO, BankEntity.class);
        bankMapper.updateById(updateBank);
        dataTracerService.addTrace(enterpriseId, DataTracerTypeEnum.OA_ENTERPRISE, "更新银行:" + DataTracerConst.HTML_BR + dataTracerService.getChangeContent(bankDetail, updateBank));
        return R.ok();
    }

    /**
     * 删除银行信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> deleteBank(Long bankId) {
        // 校验银行信息是否存在
        BankEntity bankDetail = bankMapper.selectById(bankId);
        if (Objects.isNull(bankDetail) || bankDetail.getDeleteFlag()) {
            return R.userErrorParam("银行信息不存在");
        }
        bankMapper.deleteBank(bankId, Boolean.TRUE);
        dataTracerService.addTrace(bankDetail.getEnterpriseId(), DataTracerTypeEnum.OA_ENTERPRISE, "删除银行:" + DataTracerConst.HTML_BR + dataTracerService.getChangeContent(bankDetail));
        return R.ok();
    }
}
