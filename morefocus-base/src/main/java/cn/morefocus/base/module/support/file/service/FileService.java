package cn.morefocus.base.module.support.file.service;

import cn.hutool.core.util.StrUtil;
import cn.morefocus.base.common.code.UserErrorCode;
import cn.morefocus.base.common.constant.StringConst;
import cn.morefocus.base.common.domain.PageResult;
import cn.morefocus.base.common.domain.R;
import cn.morefocus.base.common.domain.RequestUser;
import cn.morefocus.base.common.util.LocalStringUtils;
import cn.morefocus.base.common.util.LocalEnumUtil;
import cn.morefocus.base.common.util.PageUtil;
import cn.morefocus.base.module.support.file.constant.FileFolderTypeEnum;
import cn.morefocus.base.module.support.file.mapper.FileMapper;
import cn.morefocus.base.module.support.file.domain.entity.FileEntity;
import cn.morefocus.base.module.support.file.domain.form.FileQueryForm;
import cn.morefocus.base.module.support.file.domain.vo.FileDownloadVO;
import cn.morefocus.base.module.support.file.domain.vo.FileUploadVO;
import cn.morefocus.base.module.support.file.domain.vo.FileVO;
import cn.morefocus.base.module.support.file.strategy.IFileStorageService;
import cn.morefocus.base.module.support.redis.RedisService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 文件服务
 *
 * @author loki
 */
@Service
public class FileService {

    /**
     * 文件名最大长度
     */
    private static final int FILE_NAME_MAX_LENGTH = 100;

    @Resource
    private IFileStorageService fileStorageService;

    @Resource
    private FileMapper fileMapper;

    @Resource
    private RedisService redisService;

    @Value("${spring.servlet.multipart.max-file-size}")
    private String maxFileSize;


    /**
     * 文件上传服务
     *
     * @param file
     * @param folderType 文件夹类型
     * @return
     */
    public R<FileUploadVO> fileUpload(MultipartFile file, Integer folderType, RequestUser requestUser) {
        FileFolderTypeEnum folderTypeEnum = LocalEnumUtil.getEnumByValue(folderType, FileFolderTypeEnum.class);
        if (null == folderTypeEnum) {
            return R.userErrorParam("文件夹错误");
        }

        if (null == file || file.getSize() == 0) {
            return R.userErrorParam("上传文件不能为空");
        }

        // 校验文件名称
        String originalFilename = file.getOriginalFilename();
        if (StringUtils.isBlank(originalFilename)) {
            return R.userErrorParam("上传文件名称不能为空");
        }

        if (originalFilename.length() > FILE_NAME_MAX_LENGTH) {
            return R.userErrorParam("文件名称最大长度为：" + FILE_NAME_MAX_LENGTH);
        }

        // 校验文件大小
        String maxSizeStr = maxFileSize.toLowerCase().replace("mb", "");
        long maxSize = Integer.parseInt(maxSizeStr) * 1024 * 1024L;
        if (file.getSize() > maxSize) {
            return R.userErrorParam("上传文件最大为:" + maxSize);
        }

        // 进行上传
        R<FileUploadVO> response = fileStorageService.upload(file, folderTypeEnum.getFolder());
        if (!response.getOk()) {
            return response;
        }

        // 上传成功 保存记录数据库
        FileUploadVO uploadVO = response.getData();
        FileEntity fileEntity = new FileEntity();
        fileEntity.setFolderType(folderTypeEnum.getValue());
        fileEntity.setFileName(originalFilename);
        fileEntity.setFileSize(file.getSize());
        fileEntity.setFileKey(uploadVO.getFileKey());
        fileEntity.setFileType(uploadVO.getFileType());
        fileEntity.setCreateBy(requestUser == null ? null : requestUser.getUserId());
        fileEntity.setCreateByName(requestUser == null ? null : requestUser.getUserName());
        fileEntity.setCreatorUserType(requestUser == null ? null : requestUser.getUserType().getValue());
        fileMapper.insert(fileEntity);

        // 将fileId 返回给前端
        uploadVO.setFileId(fileEntity.getFileId());

        return response;
    }

    /**
     * 批量获取文件信息
     *
     * @param fileKeyList
     * @return
     */
    public List<FileVO> getFileList(List<String> fileKeyList) {
        if (CollectionUtils.isEmpty(fileKeyList)) {
            return Lists.newArrayList();
        }

        // 查询数据库，并获取 file url
        HashSet<String> fileKeySet = new HashSet<>(fileKeyList);
        Map<String, FileVO> fileMap = fileMapper.selectByFileKeyList(fileKeySet)
                .stream().collect(Collectors.toMap(FileVO::getFileKey, Function.identity()));

        for (FileVO fileVO : fileMap.values()) {
            R<String> fileUrlResponse = fileStorageService.getFileUrl(fileVO.getFileKey());
            if (fileUrlResponse.getOk()) {
                fileVO.setFileUrl(fileUrlResponse.getData());
            }
        }

        // 返回结果
        List<FileVO> result = Lists.newArrayListWithCapacity(fileKeyList.size());
        for (String fileKey : fileKeyList) {
            FileVO fileVO = fileMap.get(fileKey);
            if (fileVO != null) {
                result.add(fileVO);
            }
        }

        return result;
    }


    /**
     * 根据文件绝对路径 获取文件URL
     * 支持单个 key 逗号分隔的形式
     *
     * @param fileKeys
     * @return
     */
    public R<String> getFileUrl(String fileKeys) {
        if (StringUtils.isBlank(fileKeys)) {
            return R.error(UserErrorCode.PARAM_ERROR);
        }

        List<String> fileKeyArray = StrUtil.split(fileKeys, StringConst.SEPARATOR);
        List<String> fileUrlList = Lists.newArrayListWithCapacity(fileKeyArray.size());
        for (String fileKey : fileKeyArray) {
            R<String> fileUrlResponse = fileStorageService.getFileUrl(fileKey);
            if (fileUrlResponse.getOk()) {
                fileUrlList.add(fileUrlResponse.getData());
            }
        }
        return R.ok(LocalStringUtils.join(StringConst.SEPARATOR, fileUrlList));
    }


    /**
     * 根据文件服务类型 和 FileKey 下载文件
     */
    public R<FileDownloadVO> getDownloadFile(String fileKey, String userAgent) {
        FileVO fileVO = fileMapper.getByFileKey(fileKey);
        if (fileVO == null) {
            return R.userErrorParam("文件不存在");
        }

        // 根据文件服务类 获取对应文件服务 查询 url
        R<FileDownloadVO> download = fileStorageService.download(fileKey);
        if (download.getOk()) {
            download.getData().getMetadata().setFileName(fileVO.getFileName());
        }
        return download;
    }

    /**
     * 分页查询
     */
    public PageResult<FileVO> queryPage(FileQueryForm queryForm) {
        Page<?> page = PageUtil.convert2PageQuery(queryForm);
        List<FileVO> list = fileMapper.queryPage(page, queryForm);
        return PageUtil.convert2PageResult(page, list);
    }


}
