package cn.morefocus.base.module.support.dict.mapper;

import cn.morefocus.base.module.support.dict.domain.entity.DictKeyEntity;
import cn.morefocus.base.module.support.dict.domain.form.DictKeyQueryForm;
import cn.morefocus.base.module.support.dict.domain.vo.DictKeyVO;
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
public interface DictKeyMapper extends BaseMapper<DictKeyEntity> {

    /**
     * 查找所有未删除的自带key
     */
    List<DictKeyEntity> selectByIsDeleted(@Param("isDeleted") Boolean isDeleted);

    /**
     * 逻辑删除
     */
    void updateIsDeletedByIdList(@Param("dictKeyIdList") List<Long> dictKeyIdList, @Param("isDeleted") Boolean isDeleted);

    /**
     * 分页查询
     */
    List<DictKeyVO> query(Page page, @Param("query") DictKeyQueryForm queryForm);

    /**
     * 跟进code查询
     */
    DictKeyEntity selectByCode(@Param("keyCode") String keyCode, @Param("isDeleted") Boolean isDeleted);
}
