package cn.morefocus.base.module.support.dict.service;

import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.dict.mapper.DictKeyMapper;
import cn.morefocus.base.module.support.dict.mapper.DictValueMapper;
import cn.morefocus.base.module.support.dict.domain.entity.DictKeyEntity;
import cn.morefocus.base.module.support.dict.domain.entity.DictValueEntity;
import cn.morefocus.base.module.support.dict.domain.form.*;
import cn.morefocus.base.module.support.dict.domain.vo.DictKeyVO;
import cn.morefocus.base.module.support.dict.domain.vo.DictValueVO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Interner;
import com.google.common.collect.Interners;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 字典 服务
 *
 * @author loki
 */
@Service
public class DictService {

    @Resource
    private DictKeyMapper dictKeyMapper;
    @Resource
    private DictValueMapper dictValueMapper;
    @Resource
    private DictCacheService dictCacheService;
    /**
     * CODE锁
     */
    private static final Interner<String> CODE_POOL = Interners.newWeakInterner();


    /**
     * key添加
     *
     * @param keyAddForm
     * @return
     */
    public R<String> keyAdd(DictKeyAddForm keyAddForm) {
        synchronized (CODE_POOL.intern(keyAddForm.getKeyCode())) {
            DictKeyEntity dictKeyEntity = dictKeyMapper.selectByCode(keyAddForm.getKeyCode(), false);
            if (dictKeyEntity != null) {
                return R.error(UserErrorCode.ALREADY_EXIST);
            }
            dictKeyEntity = LocalBeanUtil.copy(keyAddForm, DictKeyEntity.class);
            dictKeyMapper.insert(dictKeyEntity);
        }
        return R.ok();
    }

    /**
     * 值添加
     *
     * @param valueAddForm
     * @return
     */
    public R<String> valueAdd(DictValueAddForm valueAddForm) {
        synchronized (CODE_POOL.intern(valueAddForm.getValueCode())) {
            DictValueEntity dictValueEntity = dictValueMapper.selectByCode(valueAddForm.getValueCode(), false);
            if (dictValueEntity != null) {
                return R.error(UserErrorCode.ALREADY_EXIST);
            }
            dictValueEntity = LocalBeanUtil.copy(valueAddForm, DictValueEntity.class);
            dictValueMapper.insert(dictValueEntity);
        }
        return R.ok();
    }

    /**
     * key 编辑
     *
     * @param keyUpdateForm
     * @return
     */
    public R<String> keyEdit(DictKeyUpdateForm keyUpdateForm) {
        synchronized (CODE_POOL.intern(keyUpdateForm.getKeyCode())) {
            DictKeyEntity dictKeyEntity = dictKeyMapper.selectByCode(keyUpdateForm.getKeyCode(), false);
            if (dictKeyEntity != null && !dictKeyEntity.getDictKeyId().equals(keyUpdateForm.getDictKeyId())) {
                return R.error(UserErrorCode.ALREADY_EXIST);
            }
            DictKeyEntity dictKeyUpdateEntity = LocalBeanUtil.copy(keyUpdateForm, DictKeyEntity.class);
            dictKeyMapper.updateById(dictKeyUpdateEntity);
        }
        return R.ok();
    }

    /**
     * 值编辑
     *
     * @param valueUpdateForm
     * @return
     */
    public R<String> valueEdit(DictValueUpdateForm valueUpdateForm) {
        DictKeyEntity dictKeyEntity = dictKeyMapper.selectById(valueUpdateForm.getDictKeyId());
        if (dictKeyEntity == null || dictKeyEntity.getDeleteFlag()) {
            return R.userErrorParam("key不能存在");
        }
        synchronized (CODE_POOL.intern(valueUpdateForm.getValueCode())) {
            DictValueEntity dictValueEntity = dictValueMapper.selectByCode(valueUpdateForm.getValueCode(), false);
            if (dictValueEntity != null && !dictValueEntity.getDictValueId().equals(valueUpdateForm.getDictValueId())) {
                return R.error(UserErrorCode.ALREADY_EXIST);
            }
            DictValueEntity dictValueUpdateEntity = LocalBeanUtil.copy(valueUpdateForm, DictValueEntity.class);
            dictValueMapper.updateById(dictValueUpdateEntity);
        }
        return R.ok();
    }

    /**
     * key删除
     *
     * @param keyIdList
     * @return
     */
    public R<String> keyDelete(List<Long> keyIdList) {
        if (CollectionUtils.isEmpty(keyIdList)) {
            return R.ok();
        }
        dictKeyMapper.updateDeletedFlagByIdList(keyIdList, true);
        return R.ok();
    }

    /**
     * 值删除
     *
     * @param valueIdList
     * @return
     */
    public R<String> valueDelete(List<Long> valueIdList) {
        if (CollectionUtils.isEmpty(valueIdList)) {
            return R.ok();
        }
        dictValueMapper.updateDeletedFlagByIdList(valueIdList, true);
        return R.ok();
    }

    /**
     * 分页查询key
     *
     * @param queryForm
     * @return
     */
    public R<PageResult<DictKeyVO>> keyQuery(DictKeyQueryForm queryForm) {
        queryForm.setDeleteFlag(false);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<DictKeyVO> list = dictKeyMapper.query(page, queryForm);
        PageResult<DictKeyVO> pageResult = PageUtil.convert2PageResult(page, list);
        if (pageResult.getEmptyFlag()) {
            return R.ok(pageResult);
        }
        return R.ok(pageResult);
    }

    /**
     * 所有key
     *
     * @return
     */
    public List<DictKeyVO> queryAllKey() {
        return LocalBeanUtil.copyList(dictKeyMapper.selectList(null), DictKeyVO.class);
    }

    /**
     * 分页查询值
     *
     * @param queryForm
     * @return
     */
    public R<PageResult<DictValueVO>> valueQuery(DictValueQueryForm queryForm) {
        queryForm.setDeleteFlag(false);
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<DictValueVO> list = dictValueMapper.query(page, queryForm);
        PageResult<DictValueVO> pageResult = PageUtil.convert2PageResult(page, list);
        if (pageResult.getEmptyFlag()) {
            return R.ok(pageResult);
        }
        return R.ok(pageResult);
    }


}