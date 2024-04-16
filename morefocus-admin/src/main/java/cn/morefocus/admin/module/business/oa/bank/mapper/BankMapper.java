package cn.morefocus.admin.module.business.oa.bank.mapper;

import cn.morefocus.admin.module.business.oa.bank.domain.BankEntity;
import cn.morefocus.admin.module.business.oa.bank.domain.BankQueryForm;
import cn.morefocus.admin.module.business.oa.bank.domain.BankVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * OA办公-OA银行信息
 */
@Mapper
@Component
public interface BankMapper extends BaseMapper<BankEntity> {

    /**
     * 根据账号查询
     */
    BankEntity queryByAccountNumber(@Param("enterpriseId") Long enterpriseId, @Param("accountNumber") String accountNumber, @Param("excludeBankId") Long excludeBankId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 删除银行信息
     */
    void deleteBank(@Param("bankId") Long bankId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 银行信息分页查询
     */
    List<BankVO> queryPage(Page page, @Param("queryForm") BankQueryForm queryForm);

    /**
     * 查询银行信息详情
     */
    BankVO getDetail(@Param("bankId") Long bankId, @Param("isDeleted") Boolean isDeleted);
}
