package cn.morefocus.base.module.support.codegenerator.service.variable.front;

import cn.hutool.core.bean.BeanUtil;
import cn.morefocus.base.module.support.codegenerator.constant.CodeQueryFieldQueryTypeEnum;
import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorConfigForm;
import cn.morefocus.base.module.support.codegenerator.domain.model.CodeQueryField;
import cn.morefocus.base.module.support.codegenerator.service.variable.CodeGenerateBaseVariableService;
import com.google.common.base.CaseFormat;

import java.util.*;

public class ListVariableService extends CodeGenerateBaseVariableService {

    @Override
    public boolean isSupport(CodeGeneratorConfigForm form) {
        return true;
    }

    @Override
    public Map<String, Object> getInjectVariablesMap(CodeGeneratorConfigForm form) {
        Map<String, Object> variablesMap = new HashMap<>(2);

        List<Map<String, Object>> variableList = new ArrayList<>();
        List<CodeQueryField> queryFields = form.getQueryFields();
        HashSet<String> frontImportSet = new HashSet<>();
        frontImportSet.add("import " + CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, form.getBasic().getModuleName()) + "Form from './" + CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_HYPHEN, form.getBasic().getModuleName()) + "-form.vue';");

        for (CodeQueryField queryField : queryFields) {
            Map<String, Object> objectMap = BeanUtil.beanToMap(queryField);
            variableList.add(objectMap);

            if ("Enum".equals(queryField.getQueryTypeEnum())) {
                frontImportSet.add("import SmartEnumSelect from '/@/components/framework/smart-enum-select/index.vue';");
            }

            if ("Dict".equals(queryField.getQueryTypeEnum())) {
                frontImportSet.add("import DictSelect from '/@/components/support/dict-select/index.vue';");
            }

            if (CodeQueryFieldQueryTypeEnum.DATE_RANGE.getValue().equals(queryField.getQueryTypeEnum())) {
                frontImportSet.add("import { defaultTimeRanges } from '/@/lib/default-time-ranges';");
            }

        }
        variablesMap.put("queryFields", variableList);
        variablesMap.put("frontImportList", new ArrayList<>(frontImportSet));
        return variablesMap;
    }
}
