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
    List<DictValueEntity> selectByIsDeleted(@Param("isDeleted") Boolean isDeleted);

    /**
     * 查找所有未删除的自带key
     */
    List<DictValueEntity> selectByIsDeletedAndKeyId(@Param("dictKeyId") Long dictKeyId, @Param("isDeleted") Boolean isDeleted);

    /**
     * 逻辑删除
     */
    void updateIsDeletedByIdList(@Param("dictValueIdList") List<Long> dictValueIdList, @Param("isDeleted") Boolean isDeleted);

    /**
     * 分页查询
     */
    List<DictValueVO> query(Page page, @Param("query") DictValueQueryForm queryForm);

    /**
     * 跟进code查询
     */
    DictValueEntity selectByCode(@Param("valueCode") String valueCode, @Param("isDeleted") Boolean isDeleted);
}
