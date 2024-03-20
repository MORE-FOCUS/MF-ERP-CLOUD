package cn.morefocus.base.module.support.helpdoc.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.helpdoc.mapper.HelpDocMapper;
import cn.morefocus.base.module.support.helpdoc.domain.entity.HelpDocEntity;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocAddForm;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocQueryForm;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocUpdateForm;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocDetailVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocVO;
import cn.morefocus.base.module.support.helpdoc.manager.HelpDocManager;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 后台管理业务
 *
 * @author loki
 */
@Service
public class HelpDocService {

    @Resource
    private HelpDocMapper helpDocMapper;

    @Resource
    private HelpDocManager helpDocManager;


    /**
     * 查询 帮助文档
     *
     * @param queryForm
     * @return
     */
    public PageResult<HelpDocVO> query(HelpDocQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<HelpDocVO> list = helpDocMapper.query(page, queryForm);
        return PageUtil.convert2PageResult(page, list);
    }

    /**
     * 添加
     *
     * @param addForm
     * @return
     */
    public R<String> add(HelpDocAddForm addForm) {
        HelpDocEntity helpDocEntity = LocalBeanUtil.copy(addForm, HelpDocEntity.class);
        helpDocManager.save(helpDocEntity, addForm.getRelationList());
        return R.ok();
    }


    /**
     * 更新
     *
     * @param updateForm
     * @return
     */
    public R<String> update(HelpDocUpdateForm updateForm) {
        // 更新
        HelpDocEntity helpDocEntity = LocalBeanUtil.copy(updateForm, HelpDocEntity.class);
        helpDocManager.update(helpDocEntity, updateForm.getRelationList());
        return R.ok();
    }


    /**
     * 删除
     *
     * @param helpDocId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public R<String> delete(Long helpDocId) {
        HelpDocEntity helpDocEntity = helpDocMapper.selectById(helpDocId);
        if (helpDocEntity != null) {
            helpDocMapper.deleteById(helpDocId);
            helpDocMapper.deleteRelation(helpDocId);
        }
        return R.ok();
    }

    /**
     * 获取详情
     *
     * @param helpDocId
     * @return
     */
    public HelpDocDetailVO getDetail(Long helpDocId) {
        HelpDocEntity helpDocEntity = helpDocMapper.selectById(helpDocId);
        HelpDocDetailVO detail = LocalBeanUtil.copy(helpDocEntity, HelpDocDetailVO.class);
        if (detail != null) {
            detail.setRelationList(helpDocMapper.queryRelationByHelpDoc(helpDocId));
        }
        return detail;
    }

    /**
     * 获取详情
     *
     * @param relationId
     * @return
     */
    public List<HelpDocVO> queryHelpDocByRelationId(Long relationId) {
        return helpDocMapper.queryHelpDocByRelationId(relationId);
    }
}
