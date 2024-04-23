package cn.morefocus.base.module.support.serialnumber.strategy;

import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberGenerateResultDTO;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberInfoDTO;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberLastGenerateDTO;
import cn.morefocus.base.module.support.serialnumber.service.SerialNumberBaseService;
import com.google.common.collect.Interner;
import com.google.common.collect.Interners;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 单据序列号 基于内存锁实现
 *
 *
 */
@Service
public class SerialNumberInternService extends SerialNumberBaseService {

    /**
     * 按照 serialNumberId 进行锁
     */
    private static final Interner<Integer> POOL = Interners.newStrongInterner();

    private ConcurrentHashMap<Integer, SerialNumberLastGenerateDTO> serialNumberLastGenerateMap = new ConcurrentHashMap<>();

    @Override
    public void initLastGenerateData(List<SerialNumberEntity> serialNumberEntityList) {
        if (serialNumberEntityList == null) {
            return;
        }

        for (SerialNumberEntity serialNumberEntity : serialNumberEntityList) {
            SerialNumberLastGenerateDTO lastGenerateBO = SerialNumberLastGenerateDTO
                    .builder()
                    .serialNumberId(serialNumberEntity.getSerialNumberId())
                    .lastNumber(serialNumberEntity.getLastNumber())
                    .lastTime(serialNumberEntity.getLastTime())
                    .build();
            serialNumberLastGenerateMap.put(serialNumberEntity.getSerialNumberId(), lastGenerateBO);
        }
    }

    @Override
    public List<String> generateSerialNumberList(SerialNumberInfoDTO serialNumberInfo, int count) {
        SerialNumberGenerateResultDTO serialNumberGenerateResult = null;
        synchronized (POOL.intern(serialNumberInfo.getSerialNumberId())) {

            // 获取上次的生成结果
            SerialNumberLastGenerateDTO lastGenerateBO = serialNumberLastGenerateMap.get(serialNumberInfo.getSerialNumberId());

            // 生成
            serialNumberGenerateResult = super.loopNumberList(lastGenerateBO, serialNumberInfo, count);

            // 将生成信息保存的内存和数据库
            lastGenerateBO.setLastNumber(serialNumberGenerateResult.getLastNumber());
            lastGenerateBO.setLastTime(serialNumberGenerateResult.getLastTime());
            serialNumberMapper.updateLastNumberAndTime(serialNumberInfo.getSerialNumberId(),
                    serialNumberGenerateResult.getLastNumber(),
                    serialNumberGenerateResult.getLastTime());

            // 把生成过程保存到数据库里
            super.saveRecord(serialNumberGenerateResult);
        }

        return formatNumberList(serialNumberGenerateResult, serialNumberInfo);
    }


}
