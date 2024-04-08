package cn.morefocus.admin.module.business.oa.notice.mapper;

import cn.morefocus.admin.module.business.oa.notice.domain.entity.NoticeEntity;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeEmployeeQueryForm;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeQueryForm;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeViewRecordQueryForm;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeVisibleRangeForm;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.NoticeEmployeeVO;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.NoticeVO;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.NoticeViewRecordVO;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.NoticeVisibleRangeVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 公告、通知、新闻等等
 */
@Mapper
@Component
public interface NoticeMapper extends BaseMapper<NoticeEntity> {

    // ================================= 数据范围相关 【子表】 =================================

    /**
     * 保存可见范围
     */
    void insertVisibleRange(@Param("noticeId") Long noticeId, @Param("visibleRangeFormList") List<NoticeVisibleRangeForm> visibleRangeFormList);

    /**
     * 删除可见范围
     */
    void deleteVisibleRange(@Param("noticeId") Long noticeId);

    /**
     * 相关可见范围
     */
    List<NoticeVisibleRangeVO> queryVisibleRange(@Param("noticeId") Long noticeId);

    // ================================= 通知公告【主表】 相关  =================================

    /**
     * 后管分页查询资讯
     */
    List<NoticeVO> query(Page<?> page, @Param("query") NoticeQueryForm queryForm);

    /**
     * 更新删除状态
     */
    void updateDeletedFlag(@Param("noticeId") Long noticeId);

    // ================================= 通知公告【员工查看】 相关  =================================

    /**
     * 查询 员工 查看到的通知公告
     */
    List<NoticeEmployeeVO> queryEmployeeNotice(Page<?> page,
                                               @Param("requestEmployeeId") Long requestEmployeeId,
                                               @Param("query") NoticeEmployeeQueryForm noticeEmployeeQueryForm,
                                               @Param("requestEmployeeDepartmentIdList") List<Long> requestEmployeeDepartmentIdList,
                                               @Param("deleteFlag") boolean deleteFlag,
                                               @Param("administratorFlag") boolean administratorFlag,
                                               @Param("departmentDataType") Integer departmentDataType,
                                               @Param("employeeDataType") Integer employeeDataType

    );

    /**
     * 查询 员工 未读的通知公告
     */
    List<NoticeEmployeeVO> queryEmployeeNotViewNotice(Page<?> page,
                                                      @Param("requestEmployeeId") Long requestEmployeeId,
                                                      @Param("query") NoticeEmployeeQueryForm noticeEmployeeQueryForm,
                                                      @Param("requestEmployeeDepartmentIdList") List<Long> requestEmployeeDepartmentIdList,
                                                      @Param("deleteFlag") boolean deleteFlag,
                                                      @Param("administratorFlag") boolean administratorFlag,
                                                      @Param("departmentDataType") Integer departmentDataType,
                                                      @Param("employeeDataType") Integer employeeDataType

    );

    long viewRecordCount(@Param("noticeId") Long noticeId, @Param("employeeId") Long employeeId);

    /**
     * 查询通知、公告的 查看记录
     */
    List<NoticeViewRecordVO> queryNoticeViewRecordList(Page page, @Param("queryForm") NoticeViewRecordQueryForm noticeViewRecordQueryForm);

    /**
     * 保存查看记录
     */
    void insertViewRecord(@Param("noticeId") Long noticeId, @Param("employeeId") Long employeeId, @Param("ip") String ip, @Param("userAgent") String userAgent, @Param("pageViewCount") Integer pageViewCount);

    /**
     * 更新查看记录
     */
    void updateViewRecord(@Param("noticeId") Long noticeId, @Param("employeeId") Long requestEmployeeId, @Param("ip") String ip, @Param("userAgent") String userAgent);

}
