package cn.morefocus.admin.module.business.store.mapper;

import cn.morefocus.admin.module.business.store.domain.entity.StoreEntity;
import cn.morefocus.admin.module.business.store.domain.form.StoreQueryForm;
import cn.morefocus.admin.module.business.store.domain.vo.StoreVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 门店 Mapper
 *
 * @author loki
 * @date 2024-06-23 23:29:01
 */
@Mapper
@Component
public interface StoreMapper extends BaseMapper<StoreEntity> {

    /**
     * 分页 查询
     */
    List<StoreVO> queryPage(Page page, @Param("queryForm") StoreQueryForm queryForm);

    /**
     * 分页 查询
     */
    List<StoreVO> queryAll();

    /**
     * 更新删除状态
     */
    long updateDeleted(@Param("id") Long id, @Param("${isDeleted}") boolean isDeleted);

    /**
     * 批量更新删除状态
     */
    void batchUpdateDeleted(@Param("idList") List<Long> idList, @Param("${isDeleted}") boolean isDeleted);

}
