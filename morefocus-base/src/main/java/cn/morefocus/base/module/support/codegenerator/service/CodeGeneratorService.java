package cn.morefocus.base.module.support.codegenerator.service;

import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.util.LocalStringUtils;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.codegenerator.constant.CodeGeneratorConstant;
import cn.morefocus.base.module.support.codegenerator.domain.entity.CodeGeneratorConfigEntity;
import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorConfigForm;
import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorPreviewForm;
import cn.morefocus.base.module.support.codegenerator.domain.form.TableQueryForm;
import cn.morefocus.base.module.support.codegenerator.domain.model.*;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableColumnVO;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableConfigVO;
import cn.morefocus.base.module.support.codegenerator.domain.vo.TableVO;
import cn.morefocus.base.module.support.codegenerator.mapper.CodeGeneratorConfigMapper;
import cn.morefocus.base.module.support.codegenerator.mapper.CodeGeneratorMapper;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Optional;

/**
 * 代码生成器 Service
 *
 *
 */
@Slf4j
@Service
public class CodeGeneratorService {

    @Resource
    private CodeGeneratorMapper codeGeneratorMapper;

    @Resource
    private CodeGeneratorConfigMapper codeGeneratorConfigMapper;

    @Resource
    private CodeGeneratorTemplateService codeGeneratorTemplateService;


    /**
     * 列信息
     */
    public List<TableColumnVO> getTableColumns(String tableName) {
        return codeGeneratorMapper.selectTableColumn(tableName);
    }


    /**
     * 查询数据库表数据
     */
    public PageResult<TableVO> queryTableList(TableQueryForm tableQueryForm) {
        Page<?> page = PageUtil.convert2PageQuery(tableQueryForm);
        List<TableVO> tableVOList = codeGeneratorMapper.queryTableList(page, tableQueryForm);
        return PageUtil.convert2PageResult(page, tableVOList);
    }

    /**
     * 获取 表的 配置信息
     */
    public TableConfigVO getTableConfig(String table) {

        TableConfigVO config = new TableConfigVO();

        CodeGeneratorConfigEntity codeGeneratorConfigEntity = codeGeneratorConfigMapper.selectById(table);
        if (codeGeneratorConfigEntity == null) {
            return config;
        }

        if (LocalStringUtils.isNotEmpty(codeGeneratorConfigEntity.getBasic())) {
            CodeBasic basic = JSON.parseObject(codeGeneratorConfigEntity.getBasic(), CodeBasic.class);
            config.setBasic(basic);
        }

        if (LocalStringUtils.isNotEmpty(codeGeneratorConfigEntity.getFields())) {
            List<CodeField> fields = JSONArray.parseArray(codeGeneratorConfigEntity.getFields(), CodeField.class);
            config.setFields(fields);
        }

        if (LocalStringUtils.isNotEmpty(codeGeneratorConfigEntity.getInsertAndUpdate())) {
            CodeInsertAndUpdate insertAndUpdate = JSON.parseObject(codeGeneratorConfigEntity.getInsertAndUpdate(), CodeInsertAndUpdate.class);
            config.setInsertAndUpdate(insertAndUpdate);
        }

        if (LocalStringUtils.isNotEmpty(codeGeneratorConfigEntity.getDeleteInfo())) {
            CodeDelete deleteInfo = JSON.parseObject(codeGeneratorConfigEntity.getDeleteInfo(), CodeDelete.class);
            config.setDeleteInfo(deleteInfo);
        }

        if (LocalStringUtils.isNotEmpty(codeGeneratorConfigEntity.getQueryFields())) {
            List<CodeQueryField> queryFields = JSONArray.parseArray(codeGeneratorConfigEntity.getQueryFields(), CodeQueryField.class);
            config.setQueryFields(queryFields);
        }

        if (LocalStringUtils.isNotEmpty(codeGeneratorConfigEntity.getTableFields())) {
            List<CodeTableField> tableFields = JSONArray.parseArray(codeGeneratorConfigEntity.getTableFields(), CodeTableField.class);
            config.setTableFields(tableFields);
        }

        return config;
    }

    /**
     * 更新配置
     */
    public synchronized R<String> updateConfig(CodeGeneratorConfigForm form) {
        long existCount = codeGeneratorMapper.countByTableName(form.getTableName());
        if (existCount == 0) {
            return R.userErrorParam("表不存在，请联系后端查看下数据库");
        }

        CodeGeneratorConfigEntity codeGeneratorConfigEntity = codeGeneratorConfigMapper.selectById(form.getTableName());
        boolean updateFlag = true;
        if (codeGeneratorConfigEntity == null) {
            codeGeneratorConfigEntity = new CodeGeneratorConfigEntity();
            updateFlag = false;
        }

        // 校验假删，必须有 is_deleted 字段
        List<TableColumnVO> tableColumns = getTableColumns(form.getTableName());
        if (null != form.getDeleteInfo() && form.getDeleteInfo().getIsSupportDelete() && !form.getDeleteInfo().getIsPhysicallyDeleted()) {
            Optional<TableColumnVO> any = tableColumns.stream().filter(e -> e.getColumnName().equals(CodeGeneratorConstant.DELETED_FLAG)).findAny();
            if (!any.isPresent()) {
                return R.userErrorParam("表结构中没有假删字段：" + CodeGeneratorConstant.DELETED_FLAG + ",请仔细排查");
            }
        }

        // 校验表必须有主键
        if (!tableColumns.stream().filter(e -> "PRI".equalsIgnoreCase(e.getColumnKey())).findAny().isPresent()) {
            return R.userErrorParam("表必须有主键，请联系后端查看下数据库表结构");
        }

        codeGeneratorConfigEntity.setTableName(form.getTableName());
        codeGeneratorConfigEntity.setBasic(JSON.toJSONString(form.getBasic()));
        codeGeneratorConfigEntity.setFields(JSONArray.toJSONString(form.getFields()));
        codeGeneratorConfigEntity.setInsertAndUpdate(JSON.toJSONString(form.getInsertAndUpdate()));
        codeGeneratorConfigEntity.setDeleteInfo(JSON.toJSONString(form.getDeleteInfo()));
        codeGeneratorConfigEntity.setQueryFields(JSONArray.toJSONString(form.getQueryFields()));
        codeGeneratorConfigEntity.setTableFields(JSONArray.toJSONString(form.getTableFields()));

        if (updateFlag) {
            codeGeneratorConfigMapper.updateById(codeGeneratorConfigEntity);
        } else {
            codeGeneratorConfigMapper.insert(codeGeneratorConfigEntity);
        }
        return R.ok();
    }

    /**
     * 预览
     */
    public R<String> preview(CodeGeneratorPreviewForm form) {
        long existCount = codeGeneratorMapper.countByTableName(form.getTableName());
        if (existCount == 0) {
            return R.userErrorParam("表不存在，请联系后端查看下数据库");
        }

        CodeGeneratorConfigEntity codeGeneratorConfigEntity = codeGeneratorConfigMapper.selectById(form.getTableName());
        if (codeGeneratorConfigEntity == null) {
            return R.userErrorParam("配置信息不存在，请先进行配置");
        }

        List<TableColumnVO> columns = getTableColumns(form.getTableName());
        if (CollectionUtils.isEmpty(columns)) {
            return R.userErrorParam("表没有列信息无法生成");
        }

        String result = codeGeneratorTemplateService.generate(form.getTableName(), form.getTemplateFile(), codeGeneratorConfigEntity);
        return R.ok(result);

    }

    /**
     * 下载代码
     */
    public R<byte[]> download(String tableName) {
        if (LocalStringUtils.isBlank(tableName)) {
            return R.userErrorParam("表名不能为空");
        }

        long existCount = codeGeneratorMapper.countByTableName(tableName);
        if (existCount == 0) {
            return R.userErrorParam("表不存在，请联系后端查看下数据库");
        }

        CodeGeneratorConfigEntity codeGeneratorConfigEntity = codeGeneratorConfigMapper.selectById(tableName);
        if (codeGeneratorConfigEntity == null) {
            return R.userErrorParam("配置信息不存在，请先进行配置");
        }

        List<TableColumnVO> columns = getTableColumns(tableName);
        if (CollectionUtils.isEmpty(columns)) {
            return R.userErrorParam("表没有列信息无法生成");
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        codeGeneratorTemplateService.zipGeneratedFiles(out, tableName, codeGeneratorConfigEntity);
        return R.ok(out.toByteArray());
    }
}