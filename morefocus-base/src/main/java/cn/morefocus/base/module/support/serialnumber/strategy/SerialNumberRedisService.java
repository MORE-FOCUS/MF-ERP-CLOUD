package cn.morefocus.base.module.support.serialnumber.strategy;

import cn.morefocus.base.common.exception.BusinessException;
import cn.morefocus.base.constant.RedisKeyConst;
import cn.morefocus.base.module.support.redis.RedisService;
import cn.morefocus.base.module.support.serialnumber.domain.SerialNumberEntity;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberGenerateResultDTO;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberInfoDTO;
import cn.morefocus.base.module.support.serialnumber.domain.dto.SerialNumberLastGenerateDTO;
import cn.morefocus.base.module.support.serialnumber.service.SerialNumberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 单据序列号 基于redis锁实现
 */
@Primary
@Slf4j
@Service
public class SerialNumberRedisService extends SerialNumberService {

    private static final int MAX_GET_LOCK_COUNT = 5;

    private static final long SLEEP_MILLISECONDS = 200L;

    @Resource
    private RedisService redisService;

    @Override
    public void initLastGenerateData(List<SerialNumberEntity> serialNumberEntityList) {
        if (serialNumberEntityList == null) {
            return;
        }

        //删除之前的
        redisService.delete(RedisKeyConst.Support.SERIAL_NUMBER_LAST_INFO);

        for (SerialNumberEntity serialNumberEntity : serialNumberEntityList) {
            SerialNumberLastGenerateDTO lastGenerateBO = SerialNumberLastGenerateDTO
                    .builder()
                    .serialNumberId(serialNumberEntity.getSerialNumberId())
                    .lastNumber(serialNumberEntity.getLastNumber())
                    .lastTime(serialNumberEntity.getLastTime())
                    .build();

            redisService.mset(RedisKeyConst.Support.SERIAL_NUMBER_LAST_INFO,
                    String.valueOf(serialNumberEntity.getSerialNumberId()),
                    lastGenerateBO
            );
        }
    }

    @Override
    public List<String> generateSerialNumberList(SerialNumberInfoDTO serialNumberInfo, Integer count) {
        SerialNumberGenerateResultDTO serialNumberGenerateResult;
        String lockKey = RedisKeyConst.Support.SERIAL_NUMBER + serialNumberInfo.getSerialNumberId();
        try {
            boolean lock = false;
            for (int i = 0; i < MAX_GET_LOCK_COUNT; i++) {
                try {
                    lock = redisService.getLock(lockKey, 60 * 1000L);
                    if (lock) {
                        break;
                    }
                    Thread.sleep(SLEEP_MILLISECONDS);
                } catch (Throwable e) {
                    log.error(e.getMessage(), e);
                }
            }
            if (!lock) {
                throw new BusinessException("SerialNumber 尝试5次，未能生成单号");
            }

            // 获取上次的生成结果
            SerialNumberLastGenerateDTO lastGenerateBO = (SerialNumberLastGenerateDTO) redisService.mget(
                    RedisKeyConst.Support.SERIAL_NUMBER_LAST_INFO,
                    String.valueOf(serialNumberInfo.getSerialNumberId()));

            // 生成
            serialNumberGenerateResult = super.loopNumberList(lastGenerateBO, serialNumberInfo, count);

            // 将生成信息保存的内存和数据库
            lastGenerateBO.setLastNumber(serialNumberGenerateResult.getLastNumber());
            lastGenerateBO.setLastTime(serialNumberGenerateResult.getLastTime());
            serialNumberMapper.updateLastNumberAndTime(serialNumberInfo.getSerialNumberId(),
                    serialNumberGenerateResult.getLastNumber(),
                    serialNumberGenerateResult.getLastTime());

            redisService.mset(RedisKeyConst.Support.SERIAL_NUMBER_LAST_INFO,
                    String.valueOf(serialNumberInfo.getSerialNumberId()), lastGenerateBO);

            // 把生成过程保存到数据库里
            super.saveRecord(serialNumberGenerateResult);
        } catch (Throwable e) {
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            redisService.unLock(lockKey);
        }

        return formatNumberList(serialNumberGenerateResult, serialNumberInfo);
    }
}
