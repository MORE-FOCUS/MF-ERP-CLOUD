package cn.morefocus.admin.module.business.oa.invoice.service;

import cn.morefocus.admin.module.business.oa.enterprise.domain.vo.EnterpriseVO;
import cn.morefocus.admin.module.business.oa.enterprise.service.EnterpriseService;
import cn.morefocus.admin.module.business.oa.invoice.domain.*;
import cn.morefocus.admin.module.business.oa.invoice.mapper.InvoiceMapper;
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
 * OA发票信息
 */
@Service
@Slf4j
public class InvoiceService {

    @Resource
    private InvoiceMapper invoiceMapper;

    @Resource
    private EnterpriseService enterpriseService;

    @Resource
    private DataTracerService dataTracerService;

    /**
     * 分页查询发票信息
     */
    public R<PageResult<InvoiceVO>> queryByPage(InvoiceQueryForm queryForm) {
        queryForm.setDeleteFlag(Boolean.FALSE);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<InvoiceVO> invoiceList = invoiceMapper.queryPage(page, queryForm);
        PageResult<InvoiceVO> pageResult = PageUtil.convert2PageResult(page, invoiceList);
        return R.ok(pageResult);
    }

    public R<List<InvoiceVO>> queryList(Long enterpriseId) {
        InvoiceQueryForm queryForm = new InvoiceQueryForm();
        queryForm.setDeleteFlag(Boolean.FALSE);
        queryForm.setDisabledFlag(Boolean.FALSE);
        queryForm.setEnterpriseId(enterpriseId);
        List<InvoiceVO> invoiceList = invoiceMapper.queryPage(null, queryForm);
        return R.ok(invoiceList);
    }

    /**
     * 查询发票信息详情
     */
    public R<InvoiceVO> getDetail(Long invoiceId) {
        // 校验发票信息是否存在
        InvoiceVO invoiceVO = invoiceMapper.getDetail(invoiceId, Boolean.FALSE);
        if (Objects.isNull(invoiceVO)) {
            return R.userErrorParam("发票信息不存在");
        }
        return R.ok(invoiceVO);
    }

    /**
     * 新建发票信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> createInvoice(InvoiceAddForm createVO) {
        Long enterpriseId = createVO.getEnterpriseId();
        // 校验企业是否存在
        EnterpriseVO enterpriseVO = enterpriseService.getDetail(enterpriseId);
        if (Objects.isNull(enterpriseVO)) {
            return R.userErrorParam("企业不存在");
        }
        // 验证发票信息账号是否重复
        InvoiceEntity validateInvoice = invoiceMapper.queryByAccountNumber(enterpriseId, createVO.getAccountNumber(), null, Boolean.FALSE);
        if (Objects.nonNull(validateInvoice)) {
            return R.userErrorParam("发票信息账号重复");
        }
        // 数据插入
        InvoiceEntity insertInvoice = LocalBeanUtil.copy(createVO, InvoiceEntity.class);
        invoiceMapper.insert(insertInvoice);
        dataTracerService.addTrace(enterpriseId, DataTracerTypeEnum.OA_ENTERPRISE, "新增发票：" + DataTracerConst.HTML_BR + dataTracerService.getChangeContent(insertInvoice));
        return R.ok();
    }

    /**
     * 编辑发票信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> updateInvoice(InvoiceUpdateForm updateVO) {
        Long enterpriseId = updateVO.getEnterpriseId();
        // 校验企业是否存在
        EnterpriseVO enterpriseVO = enterpriseService.getDetail(enterpriseId);
        if (Objects.isNull(enterpriseVO)) {
            return R.userErrorParam("企业不存在");
        }
        Long invoiceId = updateVO.getInvoiceId();
        // 校验发票信息是否存在
        InvoiceEntity invoiceDetail = invoiceMapper.selectById(invoiceId);
        if (Objects.isNull(invoiceDetail) || invoiceDetail.getDeleteFlag()) {
            return R.userErrorParam("发票信息不存在");
        }
        // 验证发票信息账号是否重复
        InvoiceEntity validateInvoice = invoiceMapper.queryByAccountNumber(updateVO.getEnterpriseId(), updateVO.getAccountNumber(), invoiceId, Boolean.FALSE);
        if (Objects.nonNull(validateInvoice)) {
            return R.userErrorParam("发票信息账号重复");
        }
        // 数据编辑
        InvoiceEntity updateInvoice = LocalBeanUtil.copy(updateVO, InvoiceEntity.class);
        invoiceMapper.updateById(updateInvoice);
        dataTracerService.addTrace(enterpriseId, DataTracerTypeEnum.OA_ENTERPRISE, "更新发票：" + DataTracerConst.HTML_BR + dataTracerService.getChangeContent(invoiceDetail, updateInvoice));
        return R.ok();
    }

    /**
     * 删除发票信息
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> deleteInvoice(Long invoiceId) {
        // 校验发票信息是否存在
        InvoiceEntity invoiceDetail = invoiceMapper.selectById(invoiceId);
        if (Objects.isNull(invoiceDetail) || invoiceDetail.getDeleteFlag()) {
            return R.userErrorParam("发票信息不存在");
        }
        invoiceMapper.deleteInvoice(invoiceId, Boolean.TRUE);
        dataTracerService.addTrace(invoiceDetail.getEnterpriseId(), DataTracerTypeEnum.OA_ENTERPRISE, "删除发票：" + DataTracerConst.HTML_BR + dataTracerService.getChangeContent(invoiceDetail));
        return R.ok();
    }
}
