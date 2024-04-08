package cn.morefocus.base.module.support.serialnumber.strategy;

import cn.morefocus.base.common.exception.BusinessException;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberGenerateResultBO;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberInfoBO;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberLastGenerateBO;
import cn.morefocus.base.module.support.serialnumber.service.SerialNumberBaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 单据序列号 基于mysql锁实现
 *
 *
 */
@Slf4j
public class SerialNumberMysqlService extends SerialNumberBaseService {

    @Override
    @Transactional(rollbackFor = Throwable.class)
    public List<String> generateSerialNumberList(SerialNumberInfoBO serialNumberInfo, int count) {
        // // 获取上次的生成结果
        SerialNumberEntity serialNumberEntity = serialNumberMapper.selectForUpdate(serialNumberInfo.getSerialNumberId());
        if (serialNumberEntity == null) {
            throw new BusinessException("cannot found SerialNumberId 数据库不存在:" + serialNumberInfo.getSerialNumberId());
        }
        SerialNumberLastGenerateBO lastGenerateBO = SerialNumberLastGenerateBO
                .builder()
                .lastNumber(serialNumberEntity.getLastNumber())
                .lastTime(serialNumberEntity.getLastTime())
                .serialNumberId(serialNumberEntity.getSerialNumberId())
                .build();

        // 生成
        SerialNumberGenerateResultBO serialNumberGenerateResult = super.loopNumberList(lastGenerateBO, serialNumberInfo, count);

        // 将生成信息保存的内存和数据库
        lastGenerateBO.setLastNumber(serialNumberGenerateResult.getLastNumber());
        lastGenerateBO.setLastTime(serialNumberGenerateResult.getLastTime());
        serialNumberMapper.updateLastNumberAndTime(serialNumberInfo.getSerialNumberId(),
                serialNumberGenerateResult.getLastNumber(),
                serialNumberGenerateResult.getLastTime());

        // 把生成过程保存到数据库里
        super.saveRecord(serialNumberGenerateResult);

        return formatNumberList(serialNumberGenerateResult, serialNumberInfo);
    }

    @Override
    public void initLastGenerateData(List<SerialNumberEntity> serialNumberEntityList) {

    }
}
