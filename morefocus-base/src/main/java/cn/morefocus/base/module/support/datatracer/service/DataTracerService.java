package cn.morefocus.base.module.support.datatracer.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.LocalIpUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.common.util.SecurityContextHolder;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerConst;
import cn.morefocus.base.module.support.datatracer.constant.DataTracerTypeEnum;
import cn.morefocus.base.module.support.datatracer.domain.entity.DataTracerEntity;
import cn.morefocus.base.module.support.datatracer.domain.form.DataTracerForm;
import cn.morefocus.base.module.support.datatracer.domain.form.DataTracerQueryForm;
import cn.morefocus.base.module.support.datatracer.domain.vo.DataTracerVO;
import cn.morefocus.base.module.support.datatracer.manager.DataTracerManger;
import cn.morefocus.base.module.support.datatracer.mapper.DataTracerMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 数据变动记录 Service
 */
@Slf4j
@Service
public class DataTracerService {

    @Resource
    private DataTracerMapper dataTracerMapper;

    @Resource
    private DataTracerManger dataTracerManger;

    @Resource
    private DataTracerChangeContentService dataTracerChangeContentService;

    /**
     * 获取变更内容
     */
    public String getChangeContent(Object object) {
        return dataTracerChangeContentService.getChangeContent(object);
    }

    /**
     * 获取变更内容
     */
    public String getChangeContent(Object oldObject, Object newObject) {
        return dataTracerChangeContentService.getChangeContent(oldObject, newObject);
    }

    /**
     * 获取变更内容
     */
    public <T> String getChangeContent(List<T> oldObjectList, List<T> newObjectList) {
        return dataTracerChangeContentService.getChangeContent(oldObjectList, newObjectList);
    }

    /**
     * 保存【修改】数据变动记录
     */
    public void update(Long dataId, DataTracerTypeEnum type, Object oldObject, Object newObject) {
        DataTracerForm form = DataTracerForm.builder()
                .dataId(dataId)
                .type(type)
                .content(dataTracerChangeContentService.getChangeContent(oldObject, newObject))
                .build();
        this.addTrace(form);
    }

    /**
     * 保存【新增】数据变动记录
     */
    public void insert(Long dataId, DataTracerTypeEnum type) {
        DataTracerForm form = DataTracerForm.builder().dataId(dataId).type(type).content(DataTracerConst.INSERT).build();
        this.addTrace(form);
    }

    /**
     * 保存【删除】数据变动记录
     */
    public void delete(Long dataId, DataTracerTypeEnum type) {
        DataTracerForm form = DataTracerForm.builder().dataId(dataId).type(type).content(DataTracerConst.DELETE).build();
        this.addTrace(form);
    }

    /**
     * 保存【删除】数据变动记录
     */
    public void delete(Long dataId, DataTracerTypeEnum type, Object object) {
        DataTracerForm form = DataTracerForm.builder().dataId(dataId).type(type).content(DataTracerConst.DELETE).build();
        this.addTrace(form);
    }

    /**
     * 保存【批量删除】数据变动记录
     */
    public void batchDelete(List<Long> dataIdList, DataTracerTypeEnum type) {
        if (CollectionUtils.isEmpty(dataIdList)) {
            return;
        }

        this.addTraceList(dataIdList.stream().map(e -> DataTracerForm.builder()
                        .dataId(e)
                        .type(type)
                        .content(DataTracerConst.DELETE)
                        .build())
                .collect(Collectors.toList())
        );
    }

    /**
     * 保存数据变动记录
     */
    public void addTrace(Long dataId, DataTracerTypeEnum type, String content) {
        DataTracerForm form = DataTracerForm.builder().dataId(dataId).type(type).content(content).build();
        this.addTrace(form);
    }

    /**
     * 保存数据变动记录
     */
    public void addTrace(DataTracerForm tracerForm) {
        RequestUser requestUser = SecurityContextHolder.getRequestUser();
        this.addTrace(tracerForm, requestUser);
    }

    /**
     * 保存数据变动记录
     */
    public void addTrace(DataTracerForm tracerForm, RequestUser requestUser) {
        DataTracerEntity tracerEntity = LocalBeanUtil.copy(tracerForm, DataTracerEntity.class);
        tracerEntity.setType(tracerForm.getType().getValue());
        if (requestUser != null) {
            tracerEntity.setIp(requestUser.getIp());
            tracerEntity.setIpRegion(LocalIpUtil.getRegion(requestUser.getIp()));
            tracerEntity.setUserAgent(requestUser.getUserAgent());
            tracerEntity.setUserId(requestUser.getUserId());
            tracerEntity.setUserType(requestUser.getUserType().getValue());
            tracerEntity.setUserName(requestUser.getUserName());
        }
        dataTracerManger.save(tracerEntity);
    }

    /**
     * 批量保存数据变动记录
     */
    public void addTraceList(List<DataTracerForm> tracerFormList) {
        RequestUser requestUser = SecurityContextHolder.getRequestUser();
        this.addTraceList(tracerFormList, requestUser);
    }

    /**
     * 批量保存数据变动记录
     */
    public void addTraceList(List<DataTracerForm> tracerFormList, RequestUser requestUser) {
        if (CollectionUtils.isEmpty(tracerFormList)) {
            return;
        }

        List<DataTracerEntity> tracerEntityList = tracerFormList.stream().map(e -> {
            DataTracerEntity tracerEntity = LocalBeanUtil.copy(e, DataTracerEntity.class);
            tracerEntity.setType(e.getType().getValue());
            tracerEntity.setIp(requestUser.getIp());
            tracerEntity.setIpRegion(LocalIpUtil.getRegion(requestUser.getIp()));
            tracerEntity.setUserAgent(requestUser.getUserAgent());
            tracerEntity.setUserId(requestUser.getUserId());
            tracerEntity.setUserType(requestUser.getUserType().getValue());
            tracerEntity.setUserName(requestUser.getUserName());
            return tracerEntity;
        }).collect(Collectors.toList());
        dataTracerManger.saveBatch(tracerEntityList);
    }

    /**
     * 分页查询
     *
     * @param queryForm
     * @return
     */
    public R<PageResult<DataTracerVO>> query(DataTracerQueryForm queryForm) {
        Page page = PageUtil.convert2PageQuery(queryForm);
        List<DataTracerVO> list = dataTracerMapper.query(page, queryForm);
        PageResult<DataTracerVO> pageResult = PageUtil.convert2PageResult(page, list);
        return R.ok(pageResult);
    }

}
