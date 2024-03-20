package cn.morefocus.base.module.support.helpdoc.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.helpdoc.mapper.HelpDocMapper;
import cn.morefocus.base.module.support.helpdoc.domain.entity.HelpDocEntity;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocViewRecordQueryForm;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocDetailVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocViewRecordVO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户查看  帮助文档
 *
 * @author loki
 */
@Service
public class HelpDocUserService {

    @Resource
    private HelpDocMapper helpDocMapper;


    /**
     * 查询全部 帮助文档
     *
     * @return
     */
    public R<List<HelpDocVO>> queryAllHelpDocList() {
        return R.ok(helpDocMapper.queryAllHelpDocList());
    }


    /**
     * 查询我的 待查看的 帮助文档清单
     *
     * @return
     */
    public R<HelpDocDetailVO> view(RequestUser requestUser, Long helpDocId) {
        HelpDocEntity helpDocEntity = helpDocMapper.selectById(helpDocId);
        if (helpDocEntity == null) {
            return R.userErrorParam("帮助文档不存在");
        }

        HelpDocDetailVO helpDocDetailVO = LocalBeanUtil.copy(helpDocEntity, HelpDocDetailVO.class);
        long viewCount = helpDocMapper.viewRecordCount(helpDocId, requestUser.getUserId());
        if (viewCount == 0) {
            helpDocMapper.insertViewRecord(helpDocId, requestUser.getUserId(), requestUser.getUserName(), requestUser.getIp(), requestUser.getUserAgent(), 1);
            helpDocMapper.updateViewCount(helpDocId, 1, 1);
            helpDocDetailVO.setPageViewCount(helpDocDetailVO.getPageViewCount() + 1);
            helpDocDetailVO.setUserViewCount(helpDocDetailVO.getUserViewCount() + 1);
        } else {
            helpDocMapper.updateViewRecord(helpDocId, requestUser.getUserId(), requestUser.getIp(), requestUser.getUserAgent());
            helpDocMapper.updateViewCount(helpDocId, 0, 1);
            helpDocDetailVO.setPageViewCount(helpDocDetailVO.getPageViewCount() + 1);
        }

        return R.ok(helpDocDetailVO);
    }


    /**
     * 分页查询  查看记录
     *
     * @param helpDocViewRecordQueryForm
     * @return
     */
    public PageResult<HelpDocViewRecordVO> queryViewRecord(HelpDocViewRecordQueryForm helpDocViewRecordQueryForm) {
        Page<?> page = PageUtil.convert2PageQuery(helpDocViewRecordQueryForm);
        List<HelpDocViewRecordVO> noticeViewRecordVOS = helpDocMapper.queryViewRecordList(page, helpDocViewRecordQueryForm);
        return PageUtil.convert2PageResult(page, noticeViewRecordVOS);
    }
}
