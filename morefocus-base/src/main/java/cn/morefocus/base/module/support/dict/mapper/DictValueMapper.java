package cn.morefocus.base.module.support.dict.mapper;

import cn.morefocus.base.module.support.dict.domain.entity.DictValueEntity;
import cn.morefocus.base.module.support.dict.domain.form.DictValueQueryForm;
import cn.morefocus.base.module.support.dict.domain.vo.DictValueVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 字典
 *
 *
 */
@Mapper
@Component
public interface DictValueMapper extends BaseMapper<DictValueEntity> {

    /**
     * 查找所有未删除的自带key
     */
    List<DictValueEntity> selectByDeletedFlag(@Param("deleteFlag") Boolean deleteFlag);

    /**
     * 查找所有未删除的自带key
     */
    List<DictValueEntity> selectByDeletedFlagAndKeyId(@Param("dictKeyId") Long dictKeyId, @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 逻辑删除
     */
    void updateDeletedFlagByIdList(@Param("dictValueIdList") List<Long> dictValueIdList, @Param("deleteFlag") Boolean deleteFlag);

    /**
     * 分页查询
     */
    List<DictValueVO> query(Page page, @Param("query") DictValueQueryForm queryForm);

    /**
     * 跟进code查询
     */
    DictValueEntity selectByCode(@Param("valueCode") String valueCode, @Param("deleteFlag") Boolean deleteFlag);
}
