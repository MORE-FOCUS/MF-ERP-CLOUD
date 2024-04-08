package cn.morefocus.base.common.json.serializer;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.module.support.file.service.FileService;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import org.apache.commons.lang3.StringUtils;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * 文件key进行序列化对象
 *
 *
 */
public class FileKeySerializer extends JsonSerializer<String> {

    @Resource
    private FileService fileService;


    @Override
    public void serialize(String value, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        if (StringUtils.isEmpty(value)) {
            jsonGenerator.writeString(value);
            return;
        }
        if (fileService == null) {
            jsonGenerator.writeString(value);
            return;
        }
        R<String> r = fileService.getFileUrl(value);
        if (r.getOk()) {
            jsonGenerator.writeString(r.getData());
            return;
        }
        jsonGenerator.writeString(value);
    }
}
