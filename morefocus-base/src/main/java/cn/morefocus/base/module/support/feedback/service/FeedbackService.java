package cn.morefocus.base.module.support.feedback.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.feedback.mapper.FeedbackMapper;
import cn.morefocus.base.module.support.feedback.domain.FeedbackAddForm;
import cn.morefocus.base.module.support.feedback.domain.FeedbackEntity;
import cn.morefocus.base.module.support.feedback.domain.FeedbackQueryForm;
import cn.morefocus.base.module.support.feedback.domain.FeedbackVO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * 意见反馈
 *
 * @author loki
 */
@Service
public class FeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    /**
     * 分页查询
     */
    public R<PageResult<FeedbackVO>> query(FeedbackQueryForm queryForm) {
        Page page = PageUtil.convert2PageQuery(queryForm);
        List<FeedbackVO> list = feedbackMapper.queryPage(page, queryForm);
        PageResult<FeedbackVO> pageResultDTO = PageUtil.convert2PageResult(page, list);
        if (pageResultDTO.getEmptyFlag()) {
            return R.ok(pageResultDTO);
        }
        return R.ok(pageResultDTO);
    }

    /**
     * 新建
     */
    public R<String> add(FeedbackAddForm addForm, RequestUser requestUser) {
        FeedbackEntity feedback = LocalBeanUtil.copy(addForm, FeedbackEntity.class);
        feedback.setUserType(requestUser.getUserType().getValue());
        feedback.setUserId(requestUser.getUserId());
        feedback.setUserName(requestUser.getUserName());
        feedbackMapper.insert(feedback);
        return R.ok();
    }
}
