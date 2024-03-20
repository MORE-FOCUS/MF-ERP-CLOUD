package cn.morefocus.admin.module.business.oa.invoice.mapper;

import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceEntity;
import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceQueryForm;
import cn.morefocus.admin.module.business.oa.invoice.domain.InvoiceVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * OA发票信息
 *
 * @author loki
 */
@Mapper
@Component
public interface InvoiceMapper extends BaseMapper<InvoiceEntity> {

    /**
     * 根据账号查询
     *
     * @param enterpriseId
     * @param accountNumber
     * @param excludeInvoiceId
     * @param deleteFlag
     * @return
     */
    InvoiceEntity queryByAccountNumber(@Param("enterpriseId") Long enterpriseId, @Param("accountNumber") String accountNumber, @Param("excludeInvoiceId") Long excludeInvoiceId, @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 删除发票信息
     *
     * @param invoiceId
     * @param deleteFlag
     */
    void deleteInvoice(@Param("invoiceId") Long invoiceId, @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 发票信息分页查询
     *
     * @param page
     * @param queryForm
     * @return
     */
    List<InvoiceVO> queryPage(Page page, @Param("queryForm") InvoiceQueryForm queryForm);

    /**
     * 查询发票信息详情
     *
     * @param invoiceId
     * @param deleteFlag
     * @return
     */
    InvoiceVO getDetail(@Param("invoiceId") Long invoiceId, @Param("deleteFlag") Boolean deleteFlag);
}
