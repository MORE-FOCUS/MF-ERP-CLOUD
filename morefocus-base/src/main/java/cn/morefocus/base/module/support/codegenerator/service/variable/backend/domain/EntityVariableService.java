package cn.morefocus.base.module.support.codegenerator.service.variable.backend.domain;

import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorConfigForm;
import cn.morefocus.base.module.support.codegenerator.domain.model.CodeField;
import cn.morefocus.base.module.support.codegenerator.service.variable.CodeGenerateBaseVariableService;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

public class EntityVariableService extends CodeGenerateBaseVariableService {

    @Override
    public boolean isSupport(CodeGeneratorConfigForm form) {
        return true;
    }

    @Override
    public Map<String, Object> getInjectVariablesMap(CodeGeneratorConfigForm form) {
        Map<String, Object> variablesMap = new HashMap<>();


        variablesMap.put("packageName", form.getBasic().getJavaPackageName() + ".domain.entity");
        variablesMap.put("importPackageList", getImportPackageList(form.getFields()));


        return variablesMap;
    }


    public List<String> getImportPackageList(List<CodeField> fields) {
        if (CollectionUtils.isEmpty(fields)) {
            return Lists.newArrayList();
        }

        /**
         * 1、LocalDate、LocalDateTime、BigDecimal 类型的包名
         * 2、排序

         */
        List<String> result = fields.stream().map(e -> getJavaPackageName(e.getJavaType())).filter(Objects::nonNull).distinct().collect(Collectors.toList());

        // lombok
        result.add("import lombok.Data;");

        // mybatis plus
        result.add("import com.baomidou.mybatisplus.annotation.TableName;");

        //主键
        boolean isExistPrimaryKey = fields.stream().filter(e -> e.getPrimaryKeyFlag() != null && e.getPrimaryKeyFlag()).findFirst().isPresent();
        if (isExistPrimaryKey) {
            result.add("import com.baomidou.mybatisplus.annotation.TableId;");
        }

        //自增
        boolean isExistAutoIncrease = fields.stream().filter(e -> e.getAutoIncreaseFlag() != null && e.getAutoIncreaseFlag()).findFirst().isPresent();
        if (isExistAutoIncrease) {
            result.add("import com.baomidou.mybatisplus.annotation.IdType;");
        }

        Collections.sort(result);
        return result;
    }

}
