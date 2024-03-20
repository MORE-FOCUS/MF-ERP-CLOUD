package cn.morefocus.base.module.support.helpdoc.service;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.module.support.helpdoc.mapper.HelpDocCatalogMapper;
import cn.morefocus.base.module.support.helpdoc.mapper.HelpDocMapper;
import cn.morefocus.base.module.support.helpdoc.domain.entity.HelpDocCatalogEntity;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocCatalogAddForm;
import cn.morefocus.base.module.support.helpdoc.domain.form.HelpDocCatalogUpdateForm;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocCatalogVO;
import cn.morefocus.base.module.support.helpdoc.domain.vo.HelpDocVO;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

/**
 * 帮助文档 目录
 *
 * @author loki
 */
@Service
public class HelpDocCatalogService {

    @Resource
    private HelpDocCatalogMapper helpDocCatalogMapper;

    @Resource
    private HelpDocMapper helpDocMapper;

    /**
     * 查询全部目录
     *
     * @return
     */
    public List<HelpDocCatalogVO> getAll() {
        return LocalBeanUtil.copyList(helpDocCatalogMapper.selectList(null), HelpDocCatalogVO.class);
    }

    /**
     * 添加目录
     *
     * @param helpDocCatalogAddForm
     * @return
     */
    public synchronized R<String> add(HelpDocCatalogAddForm helpDocCatalogAddForm) {
        List<HelpDocCatalogVO> helpDocCatalogList = getAll();
        Optional<HelpDocCatalogVO> exist = helpDocCatalogList.stream().filter(e -> helpDocCatalogAddForm.getName().equals(e.getName())).findFirst();
        if (exist.isPresent()) {
            return R.userErrorParam("存在相同名称的目录了");
        }

        helpDocCatalogMapper.insert(LocalBeanUtil.copy(helpDocCatalogAddForm, HelpDocCatalogEntity.class));
        return R.ok();
    }

    /**
     * 更新目录
     *
     * @param updateForm
     * @return
     */
    public synchronized R<String> update(HelpDocCatalogUpdateForm updateForm) {
        HelpDocCatalogEntity helpDocCatalogEntity = helpDocCatalogMapper.selectById(updateForm.getHelpDocCatalogId());
        if (helpDocCatalogEntity == null) {
            return R.userErrorParam("目录不存在");
        }

        List<HelpDocCatalogVO> helpDocCatalogList = getAll();
        Optional<HelpDocCatalogVO> exist = helpDocCatalogList.stream().filter(e -> updateForm.getName().equals(e.getName())).findFirst();
        if (exist.isPresent() && !exist.get().getHelpDocCatalogId().equals(updateForm.getHelpDocCatalogId())) {
            return R.userErrorParam("存在相同名称的目录了");
        }
        helpDocCatalogMapper.updateById(LocalBeanUtil.copy(updateForm, HelpDocCatalogEntity.class));
        return R.ok();
    }

    /**
     * 删除目录（如果有子目录、或者有帮助文档，则不能删除）
     *
     * @param helpDocCatalogId
     * @return
     */
    public synchronized R<String> delete(Long helpDocCatalogId) {
        if (helpDocCatalogId == null) {
            return R.ok();
        }

        HelpDocCatalogEntity helpDocCatalogEntity = helpDocCatalogMapper.selectById(helpDocCatalogId);
        if (helpDocCatalogEntity == null) {
            return R.userErrorParam("目录不存在");
        }

        //如果有子目录，则不能删除
        Optional<HelpDocCatalogVO> existOptional = getAll().stream().filter(e -> helpDocCatalogId.equals(e.getParentId())).findFirst();
        if (existOptional.isPresent()) {
            return R.userErrorParam("存在子目录：" + existOptional.get().getName());
        }

        //查询是否有帮助文档
        List<HelpDocVO> helpDocVOList = helpDocMapper.queryHelpDocByCatalogId(helpDocCatalogId);
        if (CollectionUtils.isNotEmpty(helpDocVOList)) {
            return R.userErrorParam("目录下存在文档，不能删除");
        }
        helpDocCatalogMapper.deleteById(helpDocCatalogId);
        return R.ok();
    }

}
