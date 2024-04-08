package cn.morefocus.admin.module.business.oa.notice.service;

import cn.morefocus.admin.module.business.oa.notice.constant.NoticeVisibleRangeDataTypeEnum;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeEmployeeQueryForm;
import cn.morefocus.admin.module.business.oa.notice.domain.form.NoticeViewRecordQueryForm;
import cn.morefocus.admin.module.business.oa.notice.domain.vo.*;
import cn.morefocus.admin.module.business.oa.notice.mapper.NoticeMapper;
import cn.morefocus.admin.module.system.department.service.DepartmentService;
import cn.morefocus.admin.module.system.employee.domain.entity.EmployeeEntity;
import cn.morefocus.admin.module.system.employee.service.EmployeeService;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 员工查看 通知。公告
 */
@Service
public class NoticeEmployeeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Resource
    private NoticeService noticeService;

    @Resource
    private DepartmentService departmentService;

    @Resource
    private EmployeeService employeeService;

    /**
     * 查询我的 通知、公告清单
     */
    public R<PageResult<NoticeEmployeeVO>> queryList(Long requestEmployeeId, NoticeEmployeeQueryForm noticeEmployeeQueryForm) {
        Page<?> page = PageUtil.convert2PageQuery(noticeEmployeeQueryForm);

        //获取请求人的 部门及其子部门
        List<Long> employeeDepartmentIdList = Lists.newArrayList();
        EmployeeEntity employeeEntity = employeeService.getById(requestEmployeeId);
        if (employeeEntity.getDeptId() != null) {
            employeeDepartmentIdList = departmentService.selfAndChildrenIdList(employeeEntity.getDeptId());
        }

        List<NoticeEmployeeVO> noticeList = null;
        //只查询未读的
        if (noticeEmployeeQueryForm.getNotViewFlag() != null && noticeEmployeeQueryForm.getNotViewFlag()) {
            noticeList = noticeMapper.queryEmployeeNotViewNotice(page,
                    requestEmployeeId,
                    noticeEmployeeQueryForm,
                    employeeDepartmentIdList,
                    false,
                    employeeEntity.getAdministratorFlag(),
                    NoticeVisibleRangeDataTypeEnum.DEPARTMENT.getValue(),
                    NoticeVisibleRangeDataTypeEnum.EMPLOYEE.getValue());
        } else {
            // 查询全部
            noticeList = noticeMapper.queryEmployeeNotice(page,
                    requestEmployeeId,
                    noticeEmployeeQueryForm,
                    employeeDepartmentIdList,
                    false,
                    employeeEntity.getAdministratorFlag(),
                    NoticeVisibleRangeDataTypeEnum.DEPARTMENT.getValue(),
                    NoticeVisibleRangeDataTypeEnum.EMPLOYEE.getValue());
        }
        // 设置发布日期
        noticeList.forEach(notice -> notice.setPublishDate(notice.getPublishTime().toLocalDate()));

        return R.ok(PageUtil.convert2PageResult(page, noticeList));
    }

    /**
     * 查询我的 待查看的 通知、公告清单
     */
    public R<NoticeDetailVO> view(Long requestEmployeeId, Long noticeId, String ip, String userAgent) {
        NoticeUpdateFormVO updateFormVO = noticeService.getUpdateFormVO(noticeId);
        if (updateFormVO == null || Boolean.TRUE.equals(updateFormVO.getDeleteFlag())) {
            return R.userErrorParam("通知公告不存在");
        }

        EmployeeEntity employeeEntity = employeeService.getById(requestEmployeeId);
        if (!updateFormVO.getAllVisibleFlag() && !checkVisibleRange(updateFormVO.getVisibleRangeList(), requestEmployeeId, employeeEntity.getDeptId())) {
            return R.userErrorParam("对不起，您没有权限查看内容");
        }

        NoticeDetailVO noticeDetailVO = LocalBeanUtil.copy(updateFormVO, NoticeDetailVO.class);
        long viewCount = noticeMapper.viewRecordCount(noticeId, requestEmployeeId);
        if (viewCount == 0) {
            noticeMapper.insertViewRecord(noticeId, requestEmployeeId, ip, userAgent, 1);
        } else {
            noticeMapper.updateViewRecord(noticeId, requestEmployeeId, ip, userAgent);
        }

        return R.ok(noticeDetailVO);
    }

    /**
     * 校验是否有查看权限的范围
     */
    public boolean checkVisibleRange(List<NoticeVisibleRangeVO> visibleRangeList, Long employeeId, Long deptId) {
        // 员工范围
        boolean anyMatch = visibleRangeList.stream().anyMatch(e -> NoticeVisibleRangeDataTypeEnum.EMPLOYEE.equalsValue(e.getDataType()) && Objects.equals(e.getDataId(), employeeId));
        if (anyMatch) {
            return true;
        }

        //部门范围
        List<Long> visibleDepartmentIdList = visibleRangeList.stream().filter(e -> NoticeVisibleRangeDataTypeEnum.DEPARTMENT.equalsValue(e.getDataType()))
                .map(NoticeVisibleRangeVO::getDataId).collect(Collectors.toList());

        for (Long visibleDepartmentId : visibleDepartmentIdList) {
            List<Long> deptIdList = departmentService.selfAndChildrenIdList(visibleDepartmentId);
            if (deptIdList.contains(deptId)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 分页查询  查看记录
     */
    public PageResult<NoticeViewRecordVO> queryViewRecord(NoticeViewRecordQueryForm noticeViewRecordQueryForm) {
        Page<?> page = PageUtil.convert2PageQuery(noticeViewRecordQueryForm);
        List<NoticeViewRecordVO> noticeViewRecordList = noticeMapper.queryNoticeViewRecordList(page, noticeViewRecordQueryForm);
        return PageUtil.convert2PageResult(page, noticeViewRecordList);
    }
}
