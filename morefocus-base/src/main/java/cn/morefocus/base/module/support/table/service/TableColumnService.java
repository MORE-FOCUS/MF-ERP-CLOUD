package cn.morefocus.base.module.support.table.service;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.module.support.table.domain.TableColumnEntity;
import cn.morefocus.base.module.support.table.domain.TableColumnUpdateForm;
import cn.morefocus.base.module.support.table.mapper.TableColumnMapper;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 表格自定义列（前端用户自定义表格列，并保存到数据库里）
 */
@Service
public class TableColumnService {

    @Resource
    private TableColumnMapper tableColumnMapper;

    /**
     * 获取 - 表格列
     *
     * @return
     */
    public String getTableColumns(RequestUser requestUser, Integer tableId) {
        TableColumnEntity tableColumnEntity = tableColumnMapper.selectByUserIdAndTableId(requestUser.getUserId(), requestUser.getUserType().getValue(), tableId);
        return tableColumnEntity == null ? null : tableColumnEntity.getColumns();
    }

    /**
     * 更新表格列
     *
     * @return
     */
    public R<String> updateTableColumns(RequestUser requestUser, TableColumnUpdateForm updateForm) {
        if (CollectionUtils.isEmpty(updateForm.getColumnList())) {
            return R.ok();
        }
        Integer tableId = updateForm.getTableId();
        TableColumnEntity tableColumnEntity = tableColumnMapper.selectByUserIdAndTableId(requestUser.getUserId(), requestUser.getUserType().getValue(), tableId);
        if (tableColumnEntity == null) {
            tableColumnEntity = new TableColumnEntity();
            tableColumnEntity.setTableId(tableId);
            tableColumnEntity.setUserId(requestUser.getUserId());
            tableColumnEntity.setUserType(requestUser.getUserType().getValue());

            tableColumnEntity.setColumns(JSONArray.toJSONString(updateForm.getColumnList()));
            tableColumnMapper.insert(tableColumnEntity);
        } else {
            tableColumnEntity.setColumns(JSONArray.toJSONString(updateForm.getColumnList()));
            tableColumnMapper.updateById(tableColumnEntity);
        }
        return R.ok();
    }

    /**
     * 删除表格列
     *
     * @return
     */
    public R<String> deleteTableColumn(RequestUser requestUser, Integer tableId) {
        tableColumnMapper.deleteTableColumn(requestUser.getUserId(), requestUser.getUserType().getValue(), tableId);
        return R.ok();
    }
}
