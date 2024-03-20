package cn.morefocus.base.module.support.file.strategy;

import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.module.support.file.domain.vo.FileDownloadVO;
import cn.morefocus.base.module.support.file.domain.vo.FileUploadVO;
import org.springframework.web.multipart.MultipartFile;

/**
 * 接口
 *
 * @author loki
 */
public interface IFileStorageService {

    /**
     * 文件上传
     *
     * @param file
     * @param path
     * @return
     */
    R<FileUploadVO> upload(MultipartFile file, String path);

    /**
     * 获取文件url
     *
     * @param fileKey
     * @return
     */
    R<String> getFileUrl(String fileKey);


    /**
     * 流式下载（名称为原文件）
     *
     * @param key
     * @return
     */
    R<FileDownloadVO> download(String key);

    /**
     * 单个删除文件
     * 根据文件key删除
     *
     * @param fileKey
     * @return
     */
    R<String> delete(String fileKey);


    /**
     * 获取文件类型
     *
     * @param fileExt
     * @return
     */
    default String getContentType(String fileExt) {
        // 文件的后缀名
        if ("bmp".equalsIgnoreCase(fileExt)) {
            return "image/bmp";
        }
        if ("gif".equalsIgnoreCase(fileExt)) {
            return "image/gif";
        }
        if ("jpeg".equalsIgnoreCase(fileExt) || "jpg".equalsIgnoreCase(fileExt)) {
            return "image/jpeg";
        }
        if ("png".equalsIgnoreCase(fileExt)) {
            return "image/png";
        }
        if ("html".equalsIgnoreCase(fileExt)) {
            return "text/html";
        }
        if ("txt".equalsIgnoreCase(fileExt)) {
            return "text/plain";
        }
        if ("vsd".equalsIgnoreCase(fileExt)) {
            return "application/vnd.visio";
        }
        if ("ppt".equalsIgnoreCase(fileExt) || "pptx".equalsIgnoreCase(fileExt)) {
            return "application/vnd.ms-powerpoint";
        }
        if ("doc".equalsIgnoreCase(fileExt) || "docx".equalsIgnoreCase(fileExt)) {
            return "application/msword";
        }
        if ("pdf".equalsIgnoreCase(fileExt)) {
            return "application/pdf";
        }
        if ("xml".equalsIgnoreCase(fileExt)) {
            return "text/xml";
        }
        return "";
    }

}
