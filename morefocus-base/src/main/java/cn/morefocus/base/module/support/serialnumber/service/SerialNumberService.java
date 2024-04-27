package cn.morefocus.base.module.support.serialnumber.service;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.exception.BusinessException;
import cn.morefocus.base.common.util.LocalBeanUtil;
import cn.morefocus.base.common.util.LocalEnumUtil;
import cn.morefocus.base.module.support.serialnumber.constant.SerialNumberRuleTypeEnum;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberRecordEntity;
import cn.morefocus.base.module.support.serialnumber.domain.bo.SerialNumberAddFrom;
import cn.morefocus.base.module.support.serialnumber.domain.bo.SerialNumberUpdateFrom;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberGenerateResultDTO;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberInfoDTO;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberLastGenerateDTO;
import cn.morefocus.base.module.support.serialnumber.mapper.SerialNumberMapper;
import cn.morefocus.base.module.support.serialnumber.mapper.SerialNumberRecordMapper;
import cn.morefocus.base.module.support.serialnumber.strategy.SerialNumberGenerateService;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.RandomUtils;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 单据序列号 基类
 */
public abstract class SerialNumberService implements SerialNumberGenerateService {

    @Resource
    protected SerialNumberRecordMapper serialNumberRecordMapper;

    @Resource
    protected SerialNumberMapper serialNumberMapper;

    public abstract List<String> generateSerialNumberList(SerialNumberInfoDTO serialNumber, Integer count);

    private static final ConcurrentHashMap<Long, SerialNumberInfoDTO> SERIAL_NUMBER_STRATEGY = new ConcurrentHashMap<>();

    @PostConstruct
    void init() {
        List<SerialNumberEntity> serialNumberEntityList = serialNumberMapper.selectList(null);
        if (null == serialNumberEntityList) {
            return;
        }

        for (SerialNumberEntity serialNumberEntity : serialNumberEntityList) {
            SerialNumberRuleTypeEnum ruleTypeEnum = LocalEnumUtil.getEnumByName(serialNumberEntity.getRuleType().toUpperCase(), SerialNumberRuleTypeEnum.class);
            if (ruleTypeEnum == null) {
                throw new ExceptionInInitializerError("编码生成规则不存在");
            }

            String format = serialNumberEntity.getFormat();
            int startIndex = format.indexOf("[n");
            int endIndex = format.indexOf("n]");
            if (startIndex == -1 || endIndex == -1 || endIndex <= startIndex) {
                throw new ExceptionInInitializerError("编码生成规则错误 serialNumberId:" + serialNumberEntity.getSerialNumberId());
            }

            String numberFormat = format.substring(startIndex + 1, endIndex + 1);

            if (serialNumberEntity.getStepRandomRange() < 1) {
                throw new ExceptionInInitializerError("编码生成规则错误 serialNumberId:" + serialNumberEntity.getSerialNumberId());
            }

            SerialNumberInfoDTO serialNumberInfoBO = SerialNumberInfoDTO.builder()
                    .serialNumberId(serialNumberEntity.getSerialNumberId())
                    .serialNumberRuleTypeEnum(ruleTypeEnum)
                    .initNumber(serialNumberEntity.getInitNumber())
                    .format(serialNumberEntity.getFormat())
                    .stepRandomRange(serialNumberEntity.getStepRandomRange())
                    .haveDayFlag(format.contains(SerialNumberRuleTypeEnum.DAY.getValue()))
                    .haveMonthFlag(format.contains(SerialNumberRuleTypeEnum.MONTH.getValue()))
                    .haveYearFlag(format.contains(SerialNumberRuleTypeEnum.YEAR.getValue()))
                    .numberCount(endIndex - startIndex)
                    .numberFormat("\\[" + numberFormat + "\\]")
                    .build();
            SERIAL_NUMBER_STRATEGY.put(serialNumberEntity.getSerialNumberId(), serialNumberInfoBO);
        }

        //初始化数据
        initLastGenerateData(serialNumberEntityList);
    }

    /**
     * 新增
     */
    public R<String> addSerialNumber(SerialNumberAddFrom form) {
        SerialNumberEntity serialNumberEntity = LocalBeanUtil.copy(form, SerialNumberEntity.class);
        serialNumberMapper.insert(serialNumberEntity);

        init();
        return R.ok();
    }

    /**
     * 编辑
     */
    public R<String> updateSerialNumber(SerialNumberUpdateFrom form) {
        SerialNumberEntity serialNumberEntity = serialNumberMapper.selectById(form.getSerialNumberId());
        if (null == serialNumberEntity) {
            serialNumberEntity = LocalBeanUtil.copy(form, SerialNumberEntity.class);
            serialNumberMapper.insert(serialNumberEntity);
        } else {
            serialNumberEntity = LocalBeanUtil.copy(form, SerialNumberEntity.class);
            serialNumberMapper.updateById(serialNumberEntity);
        }

        init();
        return R.ok();
    }

    /**
     * 删除
     */
    public R<String> deleteSerialNumber(Long id) {
        serialNumberMapper.deleteById(id);
        return R.ok();
    }

    /**
     * 初始化上次生成的数据
     */
    public abstract void initLastGenerateData(List<SerialNumberEntity> serialNumberEntityList);

    @Override
    public String generate(Long serialNumberId) {
        List<String> generateList = this.generate(serialNumberId, 1);
        if (generateList == null || generateList.isEmpty()) {
            throw new BusinessException("生成编码失败");
        }
        return generateList.get(0);
    }

    @Override
    public List<String> generate(Long serialNumberId, Integer count) {
        SerialNumberInfoDTO serialNumberInfoBO = SerialNumberService.SERIAL_NUMBER_STRATEGY.get(serialNumberId);
        if (serialNumberInfoBO == null) {
            throw new BusinessException("生成编码失败");
        }
        return this.generateSerialNumberList(serialNumberInfoBO, count);
    }

    /**
     * 循环生成 number 集合
     */
    protected SerialNumberGenerateResultDTO loopNumberList(SerialNumberLastGenerateDTO lastGenerate, SerialNumberInfoDTO serialNumberInfo, Integer count) {
        Long lastNumber = lastGenerate.getLastNumber();
        boolean isReset = false;
        if (isResetInitNumber(lastGenerate, serialNumberInfo)) {
            lastNumber = serialNumberInfo.getInitNumber();
            isReset = true;
        }

        ArrayList<Long> numberList = Lists.newArrayListWithCapacity(count);
        for (int i = 0; i < count; i++) {
            Integer stepRandomRange = serialNumberInfo.getStepRandomRange();
            if (stepRandomRange > 1) {
                lastNumber = lastNumber + RandomUtils.nextInt(1, stepRandomRange + 1);
            } else {
                lastNumber = lastNumber + 1;
            }

            numberList.add(lastNumber);
        }

        return SerialNumberGenerateResultDTO
                .builder()
                .serialNumberId(serialNumberInfo.getSerialNumberId())
                .lastNumber(lastNumber)
                .lastTime(LocalDateTime.now())
                .numberList(numberList)
                .isReset(isReset)
                .build();
    }

    protected void saveRecord(SerialNumberGenerateResultDTO resultBO) {
        Long effectRows = serialNumberRecordMapper.updateRecord(resultBO.getSerialNumberId(),
                resultBO.getLastTime().toLocalDate(),
                resultBO.getLastNumber(),
                resultBO.getNumberList().size()
        );

        // 需要插入
        if (effectRows == null || effectRows == 0) {
            SerialNumberRecordEntity recordEntity = SerialNumberRecordEntity.builder()
                    .serialNumberId(resultBO.getSerialNumberId())
                    .recordDate(LocalDate.now())
                    .lastTime(resultBO.getLastTime())
                    .lastNumber(resultBO.getLastNumber())
                    .count((long) resultBO.getNumberList().size())
                    .build();
            serialNumberRecordMapper.insert(recordEntity);
        }

    }

    /**
     * 若不在规则周期内，重制初始值
     */
    private boolean isResetInitNumber(SerialNumberLastGenerateDTO lastGenerate, SerialNumberInfoDTO serialNumberInfo) {
        LocalDateTime lastTime = lastGenerate.getLastTime();
        if (lastTime == null) {
            return true;
        }

        SerialNumberRuleTypeEnum serialNumberRuleTypeEnum = serialNumberInfo.getSerialNumberRuleTypeEnum();
        int lastTimeYear = lastTime.getYear();
        int lastTimeMonth = lastTime.getMonthValue();
        int lastTimeDay = lastTime.getDayOfYear();

        LocalDateTime now = LocalDateTime.now();

        switch (serialNumberRuleTypeEnum) {
            case YEAR:
                return lastTimeYear != now.getYear();
            case MONTH:
                return lastTimeYear != now.getYear() || lastTimeMonth != now.getMonthValue();
            case DAY:
                return lastTimeYear != now.getYear() || lastTimeDay != now.getDayOfYear();
            default:
                return false;
        }
    }

    /**
     * 替换特殊rule，即替换[yyyy][mm][dd][nnn]等规则
     */
    protected List<String> formatNumberList(SerialNumberGenerateResultDTO generateResult, SerialNumberInfoDTO serialNumberInfo) {
        /**
         * 第一步：替换年、月、日
         */
        LocalDate lastTime = generateResult.getLastTime().toLocalDate();
        String year = String.valueOf(lastTime.getYear());
        String month = lastTime.getMonthValue() > 9 ? String.valueOf(lastTime.getMonthValue()) : "0" + lastTime.getMonthValue();
        String day = lastTime.getDayOfMonth() > 9 ? String.valueOf(lastTime.getDayOfMonth()) : "0" + lastTime.getDayOfMonth();

        // 把年月日替换
        String format = serialNumberInfo.getFormat();

        if (serialNumberInfo.getHaveYearFlag()) {
            format = format.replaceAll(SerialNumberRuleTypeEnum.YEAR.getRegex(), year);
        }
        if (serialNumberInfo.getHaveMonthFlag()) {
            format = format.replaceAll(SerialNumberRuleTypeEnum.MONTH.getRegex(), month);
        }
        if (serialNumberInfo.getHaveDayFlag()) {
            format = format.replaceAll(SerialNumberRuleTypeEnum.DAY.getRegex(), day);
        }

        /**
         * 第二步：替换数字
         */
        List<String> numberList = Lists.newArrayListWithCapacity(generateResult.getNumberList().size());
        for (Long number : generateResult.getNumberList()) {
            StringBuilder numberStringBuilder = new StringBuilder();
            int currentNumberCount = String.valueOf(number).length();
            //数量不够，前面补0
            if (serialNumberInfo.getNumberCount() > currentNumberCount) {
                int remain = serialNumberInfo.getNumberCount() - currentNumberCount;
                for (int i = 0; i < remain; i++) {
                    numberStringBuilder.append(0);
                }
            }
            numberStringBuilder.append(number);
            //最终替换
            String finalNumber = format.replaceAll(serialNumberInfo.getNumberFormat(), numberStringBuilder.toString());
            numberList.add(finalNumber);
        }
        return numberList;
    }

}
