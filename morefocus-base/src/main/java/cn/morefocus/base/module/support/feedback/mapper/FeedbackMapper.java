package cn.morefocus.base.module.support.feedback.mapper;

import cn.morefocus.base.module.support.feedback.domain.entity.FeedbackEntity;
import cn.morefocus.base.module.support.feedback.domain.form.FeedbackQueryForm;
import cn.morefocus.base.module.support.feedback.domain.vo.FeedbackVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 意见反馈 mapper
 *
 *
 */
@Mapper
@Component
public interface FeedbackMapper extends BaseMapper<FeedbackEntity> {

    /**
     * 分页查询
     */
    List<FeedbackVO> queryPage(Page page, @Param("query") FeedbackQueryForm query);
}