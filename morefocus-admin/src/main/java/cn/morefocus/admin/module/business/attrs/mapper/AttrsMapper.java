package cn.morefocus.admin.module.business.attrs.mapper;

import cn.morefocus.admin.module.business.attrs.domain.entity.AttrsEntity;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsPageQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.form.AttrsQueryForm;
import cn.morefocus.admin.module.business.attrs.domain.vo.AttrsVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 单位 Mapper
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Mapper
@Component
public interface AttrsMapper extends BaseMapper<AttrsEntity> {

    /**
     * 分页 查询
     */
    List<AttrsVO> queryPage(Page page, @Param("queryForm") AttrsPageQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<AttrsVO> queryAll(@Param("queryForm") AttrsQueryForm queryForm);

    /**
     * 更新禁用|启用状态
     */
    void updateIsDisabled(@Param("id") Long id, @Param("isDisabled") Boolean isDisabled);
}
