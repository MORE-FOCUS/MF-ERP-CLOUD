package cn.morefocus.base.module.support.apiencrypt.service;

import cn.hutool.crypto.symmetric.AES;
import cn.morefocus.base.common.constant.StringConst;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.util.Base64;

/**
 * AES 加密和解密
 *
 *
 */


@Slf4j
//@Service
public class ApiEncryptServiceAesImpl implements ApiEncryptService {

    private static final String CHARSET = "UTF-8";

    private static final String AES_KEY = "1024abcd1024abcd1024abcd1024abcd";

    static {
        Security.addProvider(new BouncyCastleProvider());
    }

    @Override
    public String encrypt(String data) {
        try {

            //  AES 加密 并转为 base64
            AES aes = new AES(AES_KEY.getBytes(CHARSET));
            return aes.encryptBase64(data);


        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return StringConst.EMPTY;
        }
    }

    @Override
    public String decrypt(String data) {
        try {
            // 第一步： Base64 解码
            byte[] base64Decode = Base64.getDecoder().decode(data);

            // 第二步： AES 解密
            AES aes = new AES(AES_KEY.getBytes(CHARSET));
            byte[] decryptedBytes = aes.decrypt(base64Decode);
            return new String(decryptedBytes, CHARSET);

        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return StringConst.EMPTY;
        }
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        String s = "{\"age\":100,\"name\":\"卓大\"}";
        String jsonString = JSON.toJSONString(s);
        AES aes = new AES(AES_KEY.getBytes(CHARSET));
        System.out.println(new String(aes.encryptBase64(jsonString)));
    }

}
