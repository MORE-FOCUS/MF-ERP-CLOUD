package cn.morefocus.base.module.support.codegenerator.service.variable.backend;

import cn.morefocus.base.common.util.LocalEnumUtil;
import cn.morefocus.base.module.support.codegenerator.constant.CodeDeleteEnum;
import cn.morefocus.base.module.support.codegenerator.domain.form.CodeGeneratorConfigForm;
import cn.morefocus.base.module.support.codegenerator.domain.model.CodeInsertAndUpdateField;
import cn.morefocus.base.module.support.codegenerator.service.variable.CodeGenerateBaseVariableService;
import com.google.common.base.CaseFormat;
import org.apache.commons.collections4.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

public class ControllerVariableService extends CodeGenerateBaseVariableService {

    @Override
    public boolean isSupport(CodeGeneratorConfigForm form) {
        return true;
    }

    @Override
    public Map<String, Object> getInjectVariablesMap(CodeGeneratorConfigForm form) {
        Map<String, Object> variablesMap = new HashMap<>(2);

        List<CodeInsertAndUpdateField> updateFieldList = form.getInsertAndUpdate().getFieldList().stream().filter(e -> Boolean.TRUE.equals(e.getInsertFlag())).collect(Collectors.toList());

        variablesMap.put("packageName", form.getBasic().getJavaPackageName() + ".controller");

        List<String> packageList = getPackageList(updateFieldList, form);
        variablesMap.put("importPackageList", packageList);

        return variablesMap;
    }


    public List<String> getPackageList(List<CodeInsertAndUpdateField> fields, CodeGeneratorConfigForm form) {
        if (CollectionUtils.isEmpty(fields)) {
            return new ArrayList<>();
        }

        HashSet<String> packageSet = new HashSet<>();

        //1、javabean相关的包
        packageSet.addAll(getJavaBeanImportClass(form).stream().filter(e -> !e.contains("Entity;")).collect(Collectors.toList()));

        //2、其他包
        if (form.getDeleteInfo().getIsSupportDelete()) {

            CodeDeleteEnum codeDeleteEnum = LocalEnumUtil.getEnumByValue(form.getDeleteInfo().getDeleteEnum(), CodeDeleteEnum.class);
            if (codeDeleteEnum == CodeDeleteEnum.BATCH || codeDeleteEnum == CodeDeleteEnum.SINGLE_AND_BATCH) {
                //2、批量删除的话，要导入ValidateList
                packageSet.add("import cn.morefocus.common.common.domain.ValidateList;");
            }

            if (codeDeleteEnum == CodeDeleteEnum.SINGLE || codeDeleteEnum == CodeDeleteEnum.SINGLE_AND_BATCH) {
                //3、单个删除的话，要导入 @PathVariable
                packageSet.add("import org.springframework.web.bind.annotation.PathVariable;");
                packageSet.add("import org.springframework.web.bind.annotation.GetMapping;");
            }
        }

        packageSet.add("import " + form.getBasic().getJavaPackageName() + ".service." + CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, form.getBasic().getModuleName()) + "Service;");

        // 排序一下
        ArrayList<String> packageList = new ArrayList<>(packageSet);
        Collections.sort(packageList);
        return packageList;
    }

}
