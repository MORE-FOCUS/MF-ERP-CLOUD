/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : MF_ERP_CLOUD

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 01/04/2024 00:44:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_abase
-- ----------------------------
DROP TABLE IF EXISTS `t_abase`;
CREATE TABLE `t_abase` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='分类表，主要用于商品分类';

-- ----------------------------
-- Records of t_abase
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_change_log
-- ----------------------------
DROP TABLE IF EXISTS `t_change_log`;
CREATE TABLE `t_change_log` (
  `change_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '更新日志id',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本',
  `type` int NOT NULL COMMENT '更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]',
  `publish_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布人',
  `public_date` date NOT NULL COMMENT '发布日期',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新内容',
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '跳转链接',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`change_log_id`) USING BTREE,
  UNIQUE KEY `version_unique` (`version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统更新日志';

-- ----------------------------
-- Records of t_change_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_code_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `t_code_generator_config`;
CREATE TABLE `t_code_generator_config` (
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `basic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '基础命名信息',
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '字段列表',
  `insert_and_update` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '新建、修改',
  `delete_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '删除',
  `query_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '查询',
  `table_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '列表',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '详情',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`table_name`) USING BTREE,
  UNIQUE KEY `table_unique` (`table_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成器的每个表的配置';

-- ----------------------------
-- Records of t_code_generator_config
-- ----------------------------
BEGIN;
INSERT INTO `t_code_generator_config` (`table_name`, `basic`, `fields`, `insert_and_update`, `delete_info`, `query_fields`, `table_fields`, `detail`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES ('t_category', '{\"backendAuthor\":\"卓\",\"backendDate\":1667615466000,\"copyright\":\"asd\",\"description\":\"分类表，主要用于商品分类\",\"frontAuthor\":\"卓\",\"frontDate\":1667615466000,\"javaPackageName\":\" </a-col>\",\"moduleName\":\"Category\"}', '[{\"autoIncreaseFlag\":true,\"columnComment\":\"分类id\",\"columnName\":\"category_id\",\"fieldName\":\"categoryId\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"分类id\",\"primaryKeyFlag\":true},{\"autoIncreaseFlag\":false,\"columnComment\":\"分类名称\",\"columnName\":\"category_name\",\"fieldName\":\"categoryName\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"分类名称\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"分类类型\",\"columnName\":\"category_type\",\"fieldName\":\"categoryType\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"分类类型\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"父级id\",\"columnName\":\"parent_id\",\"fieldName\":\"parentId\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"父级id\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"排序\",\"columnName\":\"sort\",\"fieldName\":\"sort\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"排序\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"是否禁用\",\"columnName\":\"disabled_flag\",\"fieldName\":\"disabledFlag\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"是否禁用\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"是否删除\",\"columnName\":\"deleted_flag\",\"fieldName\":\"deletedFlag\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"是否删除\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"\",\"columnName\":\"remark\",\"fieldName\":\"remark\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"备注\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"\",\"columnName\":\"update_time\",\"fieldName\":\"updateTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"更新时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"\",\"columnName\":\"create_time\",\"fieldName\":\"createTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"创建时间\",\"primaryKeyFlag\":false}]', '{\"countPerLine\":3,\"fieldList\":[{\"columnName\":\"category_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"category_name\",\"frontComponent\":\"Input\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"category_type\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"parent_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"sort\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"disabled_flag\",\"frontComponent\":\"BooleanSelect\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"deleted_flag\",\"frontComponent\":\"BooleanSelect\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"remark\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"update_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"create_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false}],\"isSupportInsertAndUpdate\":true,\"pageType\":\"modal\",\"width\":\"500px\"}', '{\"deleteEnum\":\"SingleAndBatch\",\"isPhysicallyDeleted\":false,\"isSupportDelete\":true}', '[]', '[{\"columnName\":\"category_id\",\"ellipsisFlag\":true,\"fieldName\":\"categoryId\",\"label\":\"分类id\",\"showFlag\":true},{\"columnName\":\"category_name\",\"ellipsisFlag\":true,\"fieldName\":\"categoryName\",\"label\":\"分类名称\",\"showFlag\":true},{\"columnName\":\"category_type\",\"ellipsisFlag\":true,\"fieldName\":\"categoryType\",\"label\":\"分类类型\",\"showFlag\":true},{\"columnName\":\"parent_id\",\"ellipsisFlag\":true,\"fieldName\":\"parentId\",\"label\":\"父级id\",\"showFlag\":true},{\"columnName\":\"sort\",\"ellipsisFlag\":true,\"fieldName\":\"sort\",\"label\":\"排序\",\"showFlag\":true},{\"columnName\":\"disabled_flag\",\"ellipsisFlag\":true,\"fieldName\":\"disabledFlag\",\"label\":\"是否禁用\",\"showFlag\":true},{\"columnName\":\"deleted_flag\",\"ellipsisFlag\":true,\"fieldName\":\"deletedFlag\",\"label\":\"是否删除\",\"showFlag\":true},{\"columnName\":\"remark\",\"ellipsisFlag\":true,\"fieldName\":\"remark\",\"label\":\"备注\",\"showFlag\":false},{\"columnName\":\"update_time\",\"ellipsisFlag\":true,\"fieldName\":\"updateTime\",\"label\":\"更新时间\",\"showFlag\":false},{\"columnName\":\"create_time\",\"ellipsisFlag\":true,\"fieldName\":\"createTime\",\"label\":\"创建时间\",\"showFlag\":false}]', NULL, 0, NULL, '2024-01-20 13:27:37', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:27:37', NULL, NULL, NULL);
INSERT INTO `t_code_generator_config` (`table_name`, `basic`, `fields`, `insert_and_update`, `delete_info`, `query_fields`, `table_fields`, `detail`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES ('t_change_log', '{\"backendAuthor\":\"卓大\",\"backendDate\":1667662267000,\"copyright\":\"1024创新实验室\",\"description\":\"系统更新日志\",\"frontAuthor\":\"卓大\",\"frontDate\":1667658667000,\"javaPackageName\":\"net.lab1024.sa.base.module.support.changelog\",\"moduleName\":\"ChangeLog\"}', '[{\"autoIncreaseFlag\":true,\"columnComment\":\"更新日志id\",\"columnName\":\"change_log_id\",\"fieldName\":\"changeLogId\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"更新日志id\",\"primaryKeyFlag\":true},{\"autoIncreaseFlag\":false,\"columnComment\":\"版本\",\"columnName\":\"version\",\"fieldName\":\"version\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"版本\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]\",\"columnName\":\"type\",\"enumName\":\"ChangeLogTypeEnum\",\"fieldName\":\"type\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"发布人\",\"columnName\":\"publish_author\",\"fieldName\":\"publishAuthor\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"发布人\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"发布日期\",\"columnName\":\"public_date\",\"fieldName\":\"publicDate\",\"javaType\":\"LocalDate\",\"jsType\":\"Date\",\"label\":\"发布日期\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新内容\",\"columnName\":\"content\",\"fieldName\":\"content\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"更新内容\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"跳转链接\",\"columnName\":\"link\",\"fieldName\":\"link\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"跳转链接\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"创建时间\",\"columnName\":\"create_time\",\"fieldName\":\"createTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"创建时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新时间\",\"columnName\":\"update_time\",\"fieldName\":\"updateTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"更新时间\",\"primaryKeyFlag\":false}]', '{\"countPerLine\":1,\"fieldList\":[{\"columnName\":\"change_log_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"version\",\"frontComponent\":\"Input\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"type\",\"frontComponent\":\"SmartEnumSelect\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"publish_author\",\"frontComponent\":\"Input\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"public_date\",\"frontComponent\":\"Date\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"content\",\"frontComponent\":\"Textarea\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"link\",\"frontComponent\":\"Textarea\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"create_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"update_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false}],\"isSupportInsertAndUpdate\":true,\"pageType\":\"modal\",\"width\":\"500\"}', '{\"deleteEnum\":\"SingleAndBatch\",\"isPhysicallyDeleted\":true,\"isSupportDelete\":true}', '[]', '[{\"columnName\":\"change_log_id\",\"ellipsisFlag\":true,\"fieldName\":\"changeLogId\",\"label\":\"更新日志id\",\"showFlag\":true},{\"columnName\":\"version\",\"ellipsisFlag\":true,\"fieldName\":\"version\",\"label\":\"版本\",\"showFlag\":true},{\"columnName\":\"type\",\"ellipsisFlag\":true,\"fieldName\":\"type\",\"label\":\"更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]\",\"showFlag\":true},{\"columnName\":\"publish_author\",\"ellipsisFlag\":true,\"fieldName\":\"publishAuthor\",\"label\":\"发布人\",\"showFlag\":true},{\"columnName\":\"public_date\",\"ellipsisFlag\":true,\"fieldName\":\"publicDate\",\"label\":\"发布日期\",\"showFlag\":true},{\"columnName\":\"content\",\"ellipsisFlag\":true,\"fieldName\":\"content\",\"label\":\"更新内容\",\"showFlag\":true},{\"columnName\":\"link\",\"ellipsisFlag\":true,\"fieldName\":\"link\",\"label\":\"跳转链接\",\"showFlag\":true},{\"columnName\":\"create_time\",\"ellipsisFlag\":true,\"fieldName\":\"createTime\",\"label\":\"创建时间\",\"showFlag\":true},{\"columnName\":\"update_time\",\"ellipsisFlag\":true,\"fieldName\":\"updateTime\",\"label\":\"更新时间\",\"showFlag\":true}]', NULL, 0, NULL, '2024-01-20 13:27:37', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:27:37', NULL, NULL, NULL);
INSERT INTO `t_code_generator_config` (`table_name`, `basic`, `fields`, `insert_and_update`, `delete_info`, `query_fields`, `table_fields`, `detail`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES ('t_job', '{\"backendAuthor\":\"loki\",\"backendDate\":1705826275000,\"copyright\":\"V1\",\"description\":\"定时任务调度表\",\"frontAuthor\":\"loki\",\"frontDate\":1705826275000,\"javaPackageName\":\"system\",\"moduleName\":\"Job\"}', '[{\"autoIncreaseFlag\":true,\"columnComment\":\"任务ID\",\"columnName\":\"job_id\",\"fieldName\":\"jobId\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"任务ID\",\"primaryKeyFlag\":true},{\"autoIncreaseFlag\":false,\"columnComment\":\"任务名称\",\"columnName\":\"job_name\",\"fieldName\":\"jobName\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"任务名称\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"任务组名\",\"columnName\":\"job_group\",\"fieldName\":\"jobGroup\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"任务组名\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"调用目标字符串\",\"columnName\":\"invoke_target\",\"fieldName\":\"invokeTarget\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"调用目标字符串\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"cron执行表达式\",\"columnName\":\"cron_expression\",\"fieldName\":\"cronExpression\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"cron执行表达式\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"计划执行错误策略（0-默认 1立即执行 2执行一次 3放弃执行）\",\"columnName\":\"misfire_policy\",\"fieldName\":\"misfirePolicy\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"计划执行错误策略（0-默认 1立即执行 2执行一次 3放弃执行）\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"是否并发执行（1-允许 0-禁止）\",\"columnName\":\"concurrent\",\"fieldName\":\"concurrent\",\"javaType\":\"Boolean\",\"jsType\":\"Boolean\",\"label\":\"是否并发执行（1-允许 0-禁止）\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"状态（1-正常 0-暂停）\",\"columnName\":\"status\",\"fieldName\":\"status\",\"javaType\":\"Boolean\",\"jsType\":\"Boolean\",\"label\":\"状态（1-正常 0-暂停）\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"任务唯一key\",\"columnName\":\"code\",\"fieldName\":\"code\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"任务唯一key\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"排序\",\"columnName\":\"sort_value\",\"fieldName\":\"sortValue\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"排序\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"备注\",\"columnName\":\"remark\",\"fieldName\":\"remark\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"备注\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新时间\",\"columnName\":\"update_time\",\"fieldName\":\"updateTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"更新时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新人ID\",\"columnName\":\"update_by\",\"fieldName\":\"updateBy\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"更新人ID\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新人名称\",\"columnName\":\"update_by_name\",\"fieldName\":\"updateByName\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"更新人名称\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"是否删除\",\"columnName\":\"delete_flag\",\"fieldName\":\"deleteFlag\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"是否删除\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"删除时间\",\"columnName\":\"delete_time\",\"fieldName\":\"deleteTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"删除时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"删除人ID\",\"columnName\":\"delete_by\",\"fieldName\":\"deleteBy\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"删除人ID\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"删除人名称\",\"columnName\":\"delete_by_name\",\"fieldName\":\"deleteByName\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"删除人名称\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"创建时间\",\"columnName\":\"create_time\",\"fieldName\":\"createTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"创建时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"创建人ID\",\"columnName\":\"create_by\",\"fieldName\":\"createBy\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"创建人ID\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"创建人名称\",\"columnName\":\"create_by_name\",\"fieldName\":\"createByName\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"创建人名称\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"部门ID\",\"columnName\":\"dept_id\",\"fieldName\":\"deptId\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"部门ID\",\"primaryKeyFlag\":false}]', '{\"countPerLine\":1,\"fieldList\":[{\"columnName\":\"job_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"job_name\",\"frontComponent\":\"Input\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"job_group\",\"frontComponent\":\"Input\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"invoke_target\",\"frontComponent\":\"Input\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"cron_expression\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"misfire_policy\",\"frontComponent\":\"BooleanSelect\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"concurrent\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"status\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"code\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"sort_value\",\"frontComponent\":\"InputNumber\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"remark\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"update_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"update_by\",\"frontComponent\":\"InputNumber\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"update_by_name\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"delete_flag\",\"frontComponent\":\"BooleanSelect\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"delete_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"delete_by\",\"frontComponent\":\"InputNumber\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"delete_by_name\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"create_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"create_by\",\"frontComponent\":\"InputNumber\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"create_by_name\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"dept_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false}],\"isSupportInsertAndUpdate\":true,\"pageType\":\"drawer\",\"width\":\"400\"}', '{\"deleteEnum\":\"SingleAndBatch\",\"isPhysicallyDeleted\":true,\"isSupportDelete\":true}', '[]', '[{\"columnName\":\"job_id\",\"ellipsisFlag\":true,\"fieldName\":\"jobId\",\"label\":\"任务ID\",\"showFlag\":true},{\"columnName\":\"job_name\",\"ellipsisFlag\":true,\"fieldName\":\"jobName\",\"label\":\"任务名称\",\"showFlag\":true},{\"columnName\":\"job_group\",\"ellipsisFlag\":true,\"fieldName\":\"jobGroup\",\"label\":\"任务组名\",\"showFlag\":true},{\"columnName\":\"invoke_target\",\"ellipsisFlag\":true,\"fieldName\":\"invokeTarget\",\"label\":\"调用目标字符串\",\"showFlag\":true},{\"columnName\":\"cron_expression\",\"ellipsisFlag\":true,\"fieldName\":\"cronExpression\",\"label\":\"cron执行表达式\",\"showFlag\":true},{\"columnName\":\"misfire_policy\",\"ellipsisFlag\":true,\"fieldName\":\"misfirePolicy\",\"label\":\"计划执行错误策略（0-默认 1立即执行 2执行一次 3放弃执行）\",\"showFlag\":true},{\"columnName\":\"concurrent\",\"ellipsisFlag\":true,\"fieldName\":\"concurrent\",\"label\":\"是否并发执行（1-允许 0-禁止）\",\"showFlag\":true},{\"columnName\":\"status\",\"ellipsisFlag\":true,\"fieldName\":\"status\",\"label\":\"状态（1-正常 0-暂停）\",\"showFlag\":true},{\"columnName\":\"code\",\"ellipsisFlag\":true,\"fieldName\":\"code\",\"label\":\"任务唯一key\",\"showFlag\":true},{\"columnName\":\"sort_value\",\"ellipsisFlag\":true,\"fieldName\":\"sortValue\",\"label\":\"排序\",\"showFlag\":true},{\"columnName\":\"remark\",\"ellipsisFlag\":true,\"fieldName\":\"remark\",\"label\":\"备注\",\"showFlag\":true},{\"columnName\":\"update_time\",\"ellipsisFlag\":true,\"fieldName\":\"updateTime\",\"label\":\"更新时间\",\"showFlag\":true},{\"columnName\":\"update_by\",\"ellipsisFlag\":true,\"fieldName\":\"updateBy\",\"label\":\"更新人ID\",\"showFlag\":true},{\"columnName\":\"update_by_name\",\"ellipsisFlag\":true,\"fieldName\":\"updateByName\",\"label\":\"更新人名称\",\"showFlag\":true},{\"columnName\":\"delete_flag\",\"ellipsisFlag\":true,\"fieldName\":\"deleteFlag\",\"label\":\"是否删除\",\"showFlag\":true},{\"columnName\":\"delete_time\",\"ellipsisFlag\":true,\"fieldName\":\"deleteTime\",\"label\":\"删除时间\",\"showFlag\":true},{\"columnName\":\"delete_by\",\"ellipsisFlag\":true,\"fieldName\":\"deleteBy\",\"label\":\"删除人ID\",\"showFlag\":true},{\"columnName\":\"delete_by_name\",\"ellipsisFlag\":true,\"fieldName\":\"deleteByName\",\"label\":\"删除人名称\",\"showFlag\":true},{\"columnName\":\"create_time\",\"ellipsisFlag\":true,\"fieldName\":\"createTime\",\"label\":\"创建时间\",\"showFlag\":true},{\"columnName\":\"create_by\",\"ellipsisFlag\":true,\"fieldName\":\"createBy\",\"label\":\"创建人ID\",\"showFlag\":true},{\"columnName\":\"create_by_name\",\"ellipsisFlag\":true,\"fieldName\":\"createByName\",\"label\":\"创建人名称\",\"showFlag\":true},{\"columnName\":\"dept_id\",\"ellipsisFlag\":true,\"fieldName\":\"deptId\",\"label\":\"部门ID\",\"showFlag\":true}]', NULL, 0, NULL, '2024-01-21 16:47:13', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 16:47:13', NULL, NULL, NULL);
INSERT INTO `t_code_generator_config` (`table_name`, `basic`, `fields`, `insert_and_update`, `delete_info`, `query_fields`, `table_fields`, `detail`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES ('t_login_fail', '{\"backendAuthor\":\"1024创新实验室-主任-卓大\",\"backendDate\":1697536957000,\"copyright\":\"1024创新实验室\",\"description\":\"登录失败\",\"frontAuthor\":\"1024创新实验室-主任-卓大\",\"frontDate\":1697536957000,\"javaPackageName\":\"net.lab1024.sa.common.module.support.securityprotect\",\"moduleName\":\"LoginFail\"}', '[{\"autoIncreaseFlag\":true,\"columnComment\":\"自增id\",\"columnName\":\"login_fail_id\",\"fieldName\":\"loginFailId\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"自增id\",\"primaryKeyFlag\":true},{\"autoIncreaseFlag\":false,\"columnComment\":\"用户id\",\"columnName\":\"user_id\",\"fieldName\":\"userId\",\"javaType\":\"Long\",\"jsType\":\"Number\",\"label\":\"用户id\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"用户类型\",\"columnName\":\"user_type\",\"fieldName\":\"userType\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"用户类型\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"登录名\",\"columnName\":\"login_name\",\"fieldName\":\"loginName\",\"javaType\":\"String\",\"jsType\":\"String\",\"label\":\"登录名\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"连续登录失败次数\",\"columnName\":\"login_fail_count\",\"fieldName\":\"loginFailCount\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"连续登录失败次数\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"锁定状态:1锁定，0未锁定\",\"columnName\":\"lock_flag\",\"fieldName\":\"lockFlag\",\"javaType\":\"Integer\",\"jsType\":\"Number\",\"label\":\"锁定状态:1锁定，0未锁定\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"连续登录失败锁定开始时间\",\"columnName\":\"login_lock_begin_time\",\"fieldName\":\"loginLockBeginTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"连续登录失败锁定开始时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"创建时间\",\"columnName\":\"create_time\",\"fieldName\":\"createTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"创建时间\",\"primaryKeyFlag\":false},{\"autoIncreaseFlag\":false,\"columnComment\":\"更新时间\",\"columnName\":\"update_time\",\"fieldName\":\"updateTime\",\"javaType\":\"LocalDateTime\",\"jsType\":\"Date\",\"label\":\"更新时间\",\"primaryKeyFlag\":false}]', '{\"countPerLine\":1,\"fieldList\":[{\"columnName\":\"login_fail_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"user_id\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"user_type\",\"frontComponent\":\"InputNumber\",\"insertFlag\":true,\"requiredFlag\":true,\"updateFlag\":false},{\"columnName\":\"login_name\",\"frontComponent\":\"Input\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"login_fail_count\",\"frontComponent\":\"InputNumber\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"lock_flag\",\"frontComponent\":\"BooleanSelect\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"login_lock_begin_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"create_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false},{\"columnName\":\"update_time\",\"frontComponent\":\"DateTime\",\"insertFlag\":false,\"requiredFlag\":false,\"updateFlag\":false}],\"isSupportInsertAndUpdate\":false,\"pageType\":\"modal\"}', '{\"deleteEnum\":\"SingleAndBatch\",\"isPhysicallyDeleted\":true,\"isSupportDelete\":true}', '[{\"columnNameList\":[\"login_name\"],\"fieldName\":\"loginName\",\"label\":\"登录名\",\"queryTypeEnum\":\"Like\",\"width\":\"200px\"},{\"columnNameList\":[\"login_lock_begin_time\"],\"fieldName\":\"loginLockBeginTime\",\"label\":\"登录失败锁定时间\",\"queryTypeEnum\":\"DateRange\",\"width\":\"200px\"}]', '[{\"columnName\":\"login_fail_id\",\"ellipsisFlag\":true,\"fieldName\":\"loginFailId\",\"label\":\"自增id\",\"showFlag\":false},{\"columnName\":\"user_id\",\"ellipsisFlag\":true,\"fieldName\":\"userId\",\"label\":\"用户id\",\"showFlag\":true},{\"columnName\":\"user_type\",\"ellipsisFlag\":true,\"fieldName\":\"userType\",\"label\":\"用户类型\",\"showFlag\":true},{\"columnName\":\"login_name\",\"ellipsisFlag\":true,\"fieldName\":\"loginName\",\"label\":\"登录名\",\"showFlag\":true},{\"columnName\":\"login_fail_count\",\"ellipsisFlag\":true,\"fieldName\":\"loginFailCount\",\"label\":\"连续登录失败次数\",\"showFlag\":true},{\"columnName\":\"lock_flag\",\"ellipsisFlag\":true,\"fieldName\":\"lockFlag\",\"label\":\"锁定状态:1锁定，0未锁定\",\"showFlag\":true},{\"columnName\":\"login_lock_begin_time\",\"ellipsisFlag\":true,\"fieldName\":\"loginLockBeginTime\",\"label\":\"连续登录失败锁定开始时间\",\"showFlag\":true},{\"columnName\":\"create_time\",\"ellipsisFlag\":true,\"fieldName\":\"createTime\",\"label\":\"创建时间\",\"showFlag\":true},{\"columnName\":\"update_time\",\"ellipsisFlag\":true,\"fieldName\":\"updateTime\",\"label\":\"更新时间\",\"showFlag\":true}]', NULL, 0, NULL, '2024-01-20 13:27:37', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:27:37', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名字',
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数key',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统配置';

-- ----------------------------
-- Records of t_config
-- ----------------------------
BEGIN;
INSERT INTO `t_config` (`config_id`, `config_name`, `config_key`, `config_value`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '万能密码', 'super_password', 'morefocus', 0, NULL, '2024-01-20 20:58:02', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:28:01', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_data_tracer
-- ----------------------------
DROP TABLE IF EXISTS `t_data_tracer`;
CREATE TABLE `t_data_tracer` (
  `data_tracer_id` bigint NOT NULL AUTO_INCREMENT,
  `data_id` bigint NOT NULL COMMENT '各种单据的id',
  `type` int NOT NULL COMMENT '单据类型',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '操作内容',
  `diff_old` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '差异：旧的数据',
  `diff_new` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '差异：新的数据',
  `extra_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '额外信息',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_type` int NOT NULL COMMENT '用户类型：1 后管用户 ',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `ip_region` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地区',
  `user_agent` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ua',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`data_tracer_id`) USING BTREE,
  KEY `order_id_order_type` (`data_id`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='各种单据操作记录';

-- ----------------------------
-- Records of t_data_tracer
-- ----------------------------
BEGIN;
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, 49, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, 50, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (3, 51, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (4, 52, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (5, 53, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (6, 54, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (7, 55, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (8, 56, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (9, 57, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (10, 58, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (11, 58, 2, '', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (12, 59, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (13, 17, 3, '新增', NULL, NULL, NULL, 44, 1, '卓大', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.47', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (14, 18, 3, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (15, 2, 3, '新增银行:<br/>银行信息ID:26<br/>账户名称:\"1024创新实验室\"<br/>禁用状态:false<br/>开户银行:\"工商银行\"<br/>备注:\"基本户\"<br/>账号:\"1024\"<br/>是否对公:true', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (16, 2, 3, '新增银行:<br/>银行信息ID:27<br/>账户名称:\"1024创新实验室\"<br/>禁用状态:false<br/>开户银行:\"建设银行\"<br/>备注:\"其他户\"<br/>账号:\"10241\"<br/>是否对公:false', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (17, 2, 3, '新增发票：<br/>禁用状态:false<br/>开户行:\"中国银行\"<br/>备注:\"\"<br/>银行账户:\"1024lab\"<br/>开票抬头:\"1024创新实验室\"<br/>纳税人识别号:\"1024lab\"', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (18, 2, 3, '修改企业信息', '统一社会信用代码:\"1024lab\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:有限企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大\"<br/>省份名称:\"河南省\"<br/>企业logo:\"public/common/fb827d63dda74a60ab8b4f70cc7c7d0a_20221022145641_jpg\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室\"<br/>邮箱:\"lab1024@163.com\"', '统一社会信用代码:\"1024lab\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:有限企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大\"<br/>省份名称:\"河南省\"<br/>企业logo:\"public/common/fb827d63dda74a60ab8b4f70cc7c7d0a_20221022145641_jpg\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室1\"<br/>邮箱:\"lab1024@163.com\"', NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (19, 2, 3, '修改企业信息', '统一社会信用代码:\"1024lab\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:有限企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大\"<br/>省份名称:\"河南省\"<br/>企业logo:\"public/common/fb827d63dda74a60ab8b4f70cc7c7d0a_20221022145641_jpg\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室1\"<br/>邮箱:\"lab1024@163.com\"', '统一社会信用代码:\"1024lab\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:有限企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大\"<br/>省份名称:\"河南省\"<br/>企业logo:\"public/common/fb827d63dda74a60ab8b4f70cc7c7d0a_20221022145641_jpg\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室\"<br/>邮箱:\"lab1024@163.com\"', NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (20, 61, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (21, 119, 3, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (22, 119, 3, '新增银行:<br/>银行信息ID:28<br/>账户名称:\"sdf\"<br/>禁用状态:false<br/>开户银行:\"sdf\"<br/>备注:\"sdf\"<br/>账号:\"sdfsdf\"<br/>是否对公:false', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (23, 119, 3, '新增发票：<br/>禁用状态:false<br/>开户行:\"sdfsdfsd\"<br/>备注:\"\"<br/>银行账户:\"sdfsdf\"<br/>开票抬头:\"sdf\"<br/>纳税人识别号:\"sdf\"', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (24, 119, 3, '修改企业信息', '统一社会信用代码:\"asd\"<br/>禁用状态:false<br/>删除状态:false<br/>联系人:\"asd\"<br/>类型:外资企业<br/>联系人电话:\"13123123123\"<br/>企业名称:\"asd\"', '统一社会信用代码:\"asd1\"<br/>详细地址:\"sdf\"<br/>城市名称:\"秦皇岛市\"<br/>区县名称:\"抚宁区\"<br/>禁用状态:false<br/>删除状态:false<br/>联系人:\"asd1\"<br/>省份名称:\"河北省\"<br/>类型:外资企业<br/>联系人电话:\"13123123123\"<br/>企业名称:\"asd\"<br/>邮箱:\"dfs@sdsd.dfd\"', NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (25, 9, 1, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (26, 9, 1, '', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (27, 9, 1, '', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (28, 9, 1, '删除', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (29, 119, 3, '删除', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (30, 62, 2, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (31, 2, 3, '更新发票：<br/>删除状态:由【false】变更为【】<br/>备注:由【\"\"】变更为【\"1\"】', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (32, 2, 3, '更新发票：<br/>删除状态:由【false】变更为【】<br/>备注:由【\"1\"】变更为【\"12\"】', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (33, 2, 3, '更新发票：<br/>删除状态:由【false】变更为【】', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (34, 2, 3, '更新发票：<br/>删除状态:由【false】变更为【】<br/>备注:由【\"12\"】变更为【\"123\"】', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (35, 10, 1, '新增', NULL, NULL, NULL, 47, 1, '善逸', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (36, 11, 1, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (37, 12, 1, '新增', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (38, 11, 1, '', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (39, 2, 3, '修改企业信息', '统一社会信用代码:\"1024lab\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:有限企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大\"<br/>省份名称:\"河南省\"<br/>企业logo:\"public/common/fb827d63dda74a60ab8b4f70cc7c7d0a_20221022145641_jpg\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室\"<br/>邮箱:\"lab1024@163.com\"', '营业执照:\"public/common/59b1ca99b7fe45d78678e6295798a699_20231201200459.jpg\"<br/>统一社会信用代码:\"1024lab1\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:外资企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大1\"<br/>省份名称:\"河南省\"<br/>企业logo:\"\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室1\"<br/>邮箱:\"lab1024@163.com\"', NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (40, 2, 3, '修改企业信息', '营业执照:\"public/common/59b1ca99b7fe45d78678e6295798a699_20231201200459.jpg\"<br/>统一社会信用代码:\"1024lab1\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:外资企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大1\"<br/>省份名称:\"河南省\"<br/>企业logo:\"\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室1\"<br/>邮箱:\"lab1024@163.com\"', '营业执照:\"public/common/59b1ca99b7fe45d78678e6295798a699_20231201200459.jpg\"<br/>统一社会信用代码:\"1024lab\"<br/>详细地址:\"1024大楼\"<br/>区县名称:\"洛龙区\"<br/>禁用状态:false<br/>类型:外资企业<br/>城市名称:\"洛阳市\"<br/>删除状态:false<br/>联系人:\"卓大\"<br/>省份名称:\"河南省\"<br/>企业logo:\"\"<br/>联系人电话:\"18637925892\"<br/>企业名称:\"1024创新实验室\"<br/>邮箱:\"lab1024@163.com\"', NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (41, 2, 3, '更新银行:<br/>', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (42, 2, 3, '更新发票：<br/>删除状态:由【false】变更为【】', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:30:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:08', NULL, NULL, NULL);
INSERT INTO `t_data_tracer` (`data_tracer_id`, `data_id`, `type`, `content`, `diff_old`, `diff_new`, `extra_data`, `user_id`, `user_type`, `user_name`, `ip`, `ip_region`, `user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (43, 12, 1, '', NULL, NULL, NULL, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, NULL, '2024-01-24 23:41:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 23:41:16', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `manager_id` bigint DEFAULT NULL COMMENT '部门负责人id',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '部门的父级id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='部门';

-- ----------------------------
-- Records of t_department
-- ----------------------------
BEGIN;
INSERT INTO `t_department` (`dept_id`, `name`, `manager_id`, `parent_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (1, 'MOREFOCUS', 1, 0, 1, NULL, '2024-01-20 21:10:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:37', NULL, NULL);
INSERT INTO `t_department` (`dept_id`, `name`, `manager_id`, `parent_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (2, '开发部', 44, 1, 2, NULL, '2024-01-20 21:10:10', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:37', NULL, NULL);
INSERT INTO `t_department` (`dept_id`, `name`, `manager_id`, `parent_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (3, '产品部', 2, 1, 3, NULL, '2024-01-20 21:10:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:37', NULL, NULL);
INSERT INTO `t_department` (`dept_id`, `name`, `manager_id`, `parent_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (4, '销售部', 64, 1, 4, NULL, '2024-01-20 21:10:27', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:37', NULL, NULL);
INSERT INTO `t_department` (`dept_id`, `name`, `manager_id`, `parent_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (5, '测试部', 48, 1, 1, NULL, '2024-01-20 21:10:37', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:30:37', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_dict_key
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_key`;
CREATE TABLE `t_dict_key` (
  `dict_key_id` bigint NOT NULL AUTO_INCREMENT,
  `key_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `key_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`dict_key_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字段key';

-- ----------------------------
-- Records of t_dict_key
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_key` (`dict_key_id`, `key_code`, `key_name`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, 'GODOS_PLACE', '商品产地', 0, NULL, '2024-01-20 13:31:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:31:06', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_dict_value
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_value`;
CREATE TABLE `t_dict_value` (
  `dict_value_id` bigint NOT NULL AUTO_INCREMENT,
  `dict_key_id` bigint NOT NULL,
  `value_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `value_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort_value` int NOT NULL DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`dict_value_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典的值';

-- ----------------------------
-- Records of t_dict_value
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_value` (`dict_value_id`, `dict_key_id`, `value_code`, `value_name`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, 1, 'LUO_YANG', '洛阳', 1, NULL, '2024-01-20 13:32:10', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:32:10', NULL, NULL, NULL);
INSERT INTO `t_dict_value` (`dict_value_id`, `dict_key_id`, `value_code`, `value_name`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, 1, 'ZHENG_ZHOU', '郑州', 1, NULL, '2024-01-20 13:32:10', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:32:10', NULL, NULL, NULL);
INSERT INTO `t_dict_value` (`dict_value_id`, `dict_key_id`, `value_code`, `value_name`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (3, 1, 'BEI_JING', '北京', 3, NULL, '2024-01-20 13:32:10', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:32:10', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `employee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '员工名称',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机号码',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `disabled_flag` tinyint unsigned NOT NULL COMMENT '是否被禁用 0否1是',
  `deleted_flag` tinyint unsigned NOT NULL COMMENT '是否删除0否 1是',
  `administrator_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否为超级管理员: 0 不是，1是',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='员工表';

-- ----------------------------
-- Records of t_employee
-- ----------------------------
BEGIN;
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (1, 'admin', '40cc20b8891cd3fd1f008ea7f4ac17c3', '管理员', 0, '13500000000', 1, 0, 0, 1, 0, NULL, '2024-01-20 13:32:59', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (2, 'huke', '40cc20b8891cd3fd1f008ea7f4ac17c3', '胡克', 0, '13123123121', 1, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (44, 'zhuoda', '91e48719a9c580d6cfa0a2d5a0e200b8', '卓大', 1, '18637925892', 1, 0, 0, 1, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (47, 'shanyi', 'bbc93f616246d8567f2955470ecfec23', '善逸', 1, '13123111123', 1, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (48, 'qinjiu', 'b1cfb0ed0080306199fa76c872d6a32e', '琴酒', 2, '14112343212', 2, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (63, 'kaiyun', '40cc20b8891cd3fd1f008ea7f4ac17c3', '开云', 0, '13112312346', 2, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (64, 'qingye', '40cc20b8891cd3fd1f008ea7f4ac17c3', '清野', 1, '13123123111', 2, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (65, 'feiye', '40cc20b8891cd3fd1f008ea7f4ac17c3', '飞叶', 1, '13123123112', 4, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (66, 'luoyi', '40cc20b8891cd3fd1f008ea7f4ac17c3', '罗伊', 1, '13123123142', 4, 1, 0, 0, 0, NULL, '2024-01-20 20:57:24', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (67, 'chuxiao', '7287168489ed5598741362cbec2b0741', '初晓', 1, '13123123123', 1, 1, 0, 0, 0, NULL, '2024-01-20 20:57:24', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (68, 'xuanpeng', '40cc20b8891cd3fd1f008ea7f4ac17c3', '玄朋', 1, '13123123124', 1, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
INSERT INTO `t_employee` (`employee_id`, `login_name`, `login_pwd`, `actual_name`, `gender`, `phone`, `dept_id`, `disabled_flag`, `deleted_flag`, `administrator_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`) VALUES (69, 'peixian', '40cc20b8891cd3fd1f008ea7f4ac17c3', '玄朋', 1, '18377482773', 1, 0, 0, 0, 0, NULL, '2024-01-20 20:56:54', NULL, NULL, 1, NULL, NULL, NULL, '2024-01-20 13:32:59', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_bill`;
CREATE TABLE `t_erp_bill` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `bill_type` tinyint DEFAULT NULL COMMENT '单据类型\n1：采购\n2：领用\n3：退货\n4：退库\n5：盘点\n6：调拨',
  `bill_no` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单据号',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `bill_status` tinyint DEFAULT NULL COMMENT '单据状态\n1：待审核\n2：待验收\n3：已完成\n99：已取消',
  `apply_employee_id` int DEFAULT NULL COMMENT '申请人ID',
  `apply_employee_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请人名称',
  `apply_department_id` int DEFAULT NULL COMMENT '申请部门ID',
  `apply_department_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请部门名称',
  `process_id` int DEFAULT NULL COMMENT '流程ID',
  `process_task_id` int DEFAULT NULL COMMENT '流程任务ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='采购单据';

-- ----------------------------
-- Records of t_erp_bill
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_type`, `bill_no`, `bill_date`, `bill_status`, `apply_employee_id`, `apply_employee_name`, `apply_department_id`, `apply_department_name`, `process_id`, `process_task_id`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_bill_detail`;
CREATE TABLE `t_erp_bill_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `bill_id` int DEFAULT NULL COMMENT '单据ID',
  `sku_id` int DEFAULT NULL COMMENT '商品ID',
  `quantity` decimal(10,2) DEFAULT NULL COMMENT '申请数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '入库单价',
  `is_stored` bit(1) DEFAULT NULL COMMENT '是否入库',
  `stored_quantity` decimal(10,2) DEFAULT NULL COMMENT '入库数量',
  `stored_time` datetime DEFAULT NULL COMMENT '入库时间',
  `stored_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入库图片，多张逗号拼接',
  `stored_employee_id` int DEFAULT NULL COMMENT '入库人ID',
  `stored_employee_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '入库人名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '总金额=入库数量*单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单据明细表';

-- ----------------------------
-- Records of t_erp_bill_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_bill_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `bill_id`, `sku_id`, `quantity`, `price`, `is_stored`, `stored_quantity`, `stored_time`, `stored_img_url`, `stored_employee_id`, `stored_employee_name`, `amount`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_brand`;
CREATE TABLE `t_erp_brand` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `state` bit(1) DEFAULT NULL COMMENT '0-禁用 1-启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='品牌';

-- ----------------------------
-- Records of t_erp_brand
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer`;
CREATE TABLE `t_erp_customer` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
  `category_id` int DEFAULT NULL COMMENT '分类ID',
  `code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `is_public` bit(1) DEFAULT NULL COMMENT '是否公开 公开之后其他门店也可以看到',
  `contacts` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系地址',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `work_telephone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位电话',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `wechat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信号',
  `postal` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮编',
  `qq` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'QQ',
  `tax` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传真',
  `state` bit(1) DEFAULT NULL COMMENT '0-禁用 1-启用',
  `origin_debt` decimal(10,2) DEFAULT NULL COMMENT '初始欠款',
  `debt` decimal(10,2) DEFAULT NULL COMMENT '欠款',
  `employee_id` int DEFAULT NULL COMMENT '关联业务员ID',
  `employee_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联业务员名称',
  `level_id` int DEFAULT NULL COMMENT '客户等级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ERP客户';

-- ----------------------------
-- Records of t_erp_customer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_customer_address
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer_address`;
CREATE TABLE `t_erp_customer_address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系地址',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `contacts` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `customer_id` int DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户地址\n';

-- ----------------------------
-- Records of t_erp_customer_address
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_customer_category
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer_category`;
CREATE TABLE `t_erp_customer_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `is_default` bit(1) DEFAULT b'0' COMMENT '是否默认',
  `pid` int DEFAULT NULL COMMENT '父节点ID',
  `disabled` bit(1) DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
  `level` tinyint DEFAULT NULL COMMENT '层级',
  `leaf` bit(1) DEFAULT b'0' COMMENT '是否叶子节点',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户类别';

-- ----------------------------
-- Records of t_erp_customer_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_customer_level
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer_level`;
CREATE TABLE `t_erp_customer_level` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `discount` tinyint DEFAULT NULL COMMENT '折扣率 最大100',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户等级';

-- ----------------------------
-- Records of t_erp_customer_level
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku`;
CREATE TABLE `t_erp_sku` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多个逗号拼接',
  `status` tinyint unsigned NOT NULL COMMENT '状态0-未上架 1-已上架 2-已下架 3-售罄',
  `sku_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `sku_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku';

-- ----------------------------
-- Records of t_erp_sku
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `t_erp_sku` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_attrs
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_attrs`;
CREATE TABLE `t_erp_sku_attrs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `attrs` json DEFAULT NULL COMMENT 'sku属性',
  `sku_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku编码',
  `sku_id` int DEFAULT NULL COMMENT 'sku_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SPU属性关系';

-- ----------------------------
-- Records of t_erp_sku_attrs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_bar_code
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_bar_code`;
CREATE TABLE `t_erp_sku_bar_code` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `sku_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `unit_id` int DEFAULT NULL COMMENT '单位ID',
  `unit_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位名称',
  `bar_code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '条形码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku 条形码';

-- ----------------------------
-- Records of t_erp_sku_bar_code
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_bar_code` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `bar_code`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_init_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_init_stock`;
CREATE TABLE `t_erp_sku_init_stock` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `spu_id` int DEFAULT NULL COMMENT 'spuid',
  `spu_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spu_no',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `sku_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_no',
  `price` decimal(10,2) DEFAULT NULL COMMENT '初始库存单价',
  `stock_id` int DEFAULT NULL COMMENT '库存ID',
  `stock_detail_id` int DEFAULT NULL COMMENT 'sku库存明细ID',
  `quantity` decimal(10,2) DEFAULT NULL COMMENT '初始库存',
  `warehouse_id` int DEFAULT NULL COMMENT '仓库ID',
  `warehouse_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名称',
  `store_id` int DEFAULT NULL COMMENT '门店ID',
  `store_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '门店名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='初始库存';

-- ----------------------------
-- Records of t_erp_sku_init_stock
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_init_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `price`, `stock_id`, `stock_detail_id`, `quantity`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_price
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_price`;
CREATE TABLE `t_erp_sku_price` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `sku_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `unit_id` int DEFAULT NULL COMMENT '单位ID',
  `unit_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '参考进价',
  `price_type` tinyint DEFAULT NULL COMMENT '1-参考进货价 2-批发价 3-零售价 4-最低零售价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku价格';

-- ----------------------------
-- Records of t_erp_sku_price
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_price` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `unit_id`, `unit_name`, `price`, `price_type`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_stock`;
CREATE TABLE `t_erp_sku_stock` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `spu_id` int DEFAULT NULL COMMENT 'spuid',
  `spu_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spu_no',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `sku_no` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_no',
  `sku_name` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `quantity` decimal(10,2) DEFAULT NULL COMMENT '库存数=库存明细库存数之和',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存';

-- ----------------------------
-- Records of t_erp_sku_stock
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_stock_detail`;
CREATE TABLE `t_erp_sku_stock_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `spu_id` int DEFAULT NULL COMMENT 'spuid',
  `spu_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spu_no',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `sku_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_no',
  `sku_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `quantity` decimal(10,2) DEFAULT NULL COMMENT '库存数',
  `price` decimal(10,2) DEFAULT NULL COMMENT '进货单价',
  `batch_id` int DEFAULT NULL COMMENT '入库批次ID',
  `stock_id` int DEFAULT NULL COMMENT 'sku库存ID',
  `origin_quantity` decimal(10,2) DEFAULT NULL COMMENT '初始库存',
  `origin_price` decimal(10,2) DEFAULT NULL COMMENT '初始单价',
  `warehouse_id` int DEFAULT NULL COMMENT '仓库ID',
  `warehouse_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名称',
  `store_id` int DEFAULT NULL COMMENT '门店ID',
  `store_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '门店名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存明细';

-- ----------------------------
-- Records of t_erp_sku_stock_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `spu_id`, `spu_no`, `sku_id`, `sku_no`, `sku_name`, `quantity`, `price`, `batch_id`, `stock_id`, `origin_quantity`, `origin_price`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_stock_detail_change_record
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_stock_detail_change_record`;
CREATE TABLE `t_erp_sku_stock_detail_change_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `sku_no` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku编码',
  `sku_stock_detail_id` int DEFAULT NULL COMMENT 'sku库存明细ID',
  `change_quantity` decimal(10,2) DEFAULT NULL COMMENT '变动数量',
  `change_type` tinyint DEFAULT NULL COMMENT '变动类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存明细变化日志';

-- ----------------------------
-- Records of t_erp_sku_stock_detail_change_record
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_stock_detail_change_record` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `sku_no`, `sku_stock_detail_id`, `change_quantity`, `change_type`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_sku_warn_list
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_warn_list`;
CREATE TABLE `t_erp_sku_warn_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多个逗号拼接',
  `status` tinyint unsigned NOT NULL COMMENT '状态0-未上架 1-已上架 2-已下架 3-售罄',
  `sku_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `sku_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `max_quantity_warn` bit(1) DEFAULT b'0' COMMENT '最大库存预警',
  `min_quantity_warn` bit(1) DEFAULT b'0' COMMENT '最小库存预警',
  `shelf_life_warn` bit(1) DEFAULT b'0' COMMENT '保质期预警',
  `warehouse_id` int DEFAULT NULL COMMENT '仓库ID',
  `warehouse_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名称',
  `store_id` int DEFAULT NULL COMMENT '门店ID',
  `store_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '门店名称',
  `sku_detail_id` int DEFAULT NULL COMMENT 'sku明细ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存预警列表';

-- ----------------------------
-- Records of t_erp_sku_warn_list
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (1, 0, NULL, '2022-10-10 22:27:24', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:15', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (2, 0, NULL, '2022-09-14 21:39:00', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:55:48', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (3, 0, NULL, '2022-09-14 22:01:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:03', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (4, 0, NULL, '2022-09-14 22:01:10', NULL, NULL, 0, NULL, NULL, NULL, '2022-07-14 20:56:09', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (351, 0, NULL, '2022-09-14 21:39:06', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:06', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (352, 0, NULL, '2022-09-14 21:39:25', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:25', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (353, 0, NULL, '2022-09-14 21:39:32', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:32', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (354, 0, NULL, '2022-09-14 21:39:38', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:38', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (355, 0, NULL, '2022-09-14 21:39:47', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:47', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (356, 0, NULL, '2022-09-14 21:39:57', NULL, NULL, 0, NULL, NULL, NULL, '2022-09-14 21:39:57', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (357, 0, NULL, '2022-10-10 22:27:39', NULL, NULL, 0, NULL, NULL, NULL, '2022-10-10 22:27:39', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_sku_warn_list` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `images`, `status`, `sku_no`, `sku_name`, `sku_id`, `max_quantity_warn`, `min_quantity_warn`, `shelf_life_warn`, `warehouse_id`, `warehouse_name`, `store_id`, `store_name`, `sku_detail_id`) VALUES (360, 0, NULL, '2023-12-04 17:26:55', NULL, NULL, 0, NULL, NULL, NULL, '2023-12-01 19:54:22', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_specs
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_specs`;
CREATE TABLE `t_erp_specs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `state` bit(1) DEFAULT b'1' COMMENT '0-禁用 1-启用',
  `category_id` int DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='规格';

-- ----------------------------
-- Records of t_erp_specs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_specs_category
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_specs_category`;
CREATE TABLE `t_erp_specs_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `pid` int DEFAULT NULL COMMENT '父节点ID',
  `is_default` bit(1) DEFAULT b'0' COMMENT '是否默认',
  `disabled` bit(1) DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
  `level` tinyint DEFAULT NULL COMMENT '层级',
  `leaf` bit(1) DEFAULT b'0' COMMENT '是否叶子节点',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='规格类别';

-- ----------------------------
-- Records of t_erp_specs_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu`;
CREATE TABLE `t_erp_spu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `status` tinyint DEFAULT '0' COMMENT '商品状态 0-未上架 1-已上架 2-已下架\n不同行业，商品状态不同\n其他\n1:预约中,2:售卖中,3:售罄\n',
  `category_id` int NOT NULL COMMENT '商品类目',
  `spu_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SPU编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多个逗号拼接',
  `production_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产地',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `specs` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `unit_id` int DEFAULT NULL COMMENT '单位ID',
  `brand_id` int DEFAULT NULL COMMENT '品牌ID',
  `enable_shelf_life` bit(1) DEFAULT b'0' COMMENT '是否开启保质期批次',
  `enable_attr` bit(1) DEFAULT b'0' COMMENT '是否开启辅助属性',
  `enable_multi_unit` bit(1) DEFAULT b'0' COMMENT '是否开启多单位',
  `disabled` bit(1) DEFAULT b'0' COMMENT '0-启用 1-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品';

-- ----------------------------
-- Records of t_erp_spu
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu` (`id`, `status`, `category_id`, `spu_no`, `name`, `images`, `production_place`, `price`, `specs`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `brand_id`, `enable_shelf_life`, `enable_attr`, `enable_multi_unit`, `disabled`) VALUES (1, 1, 353, NULL, 'Mote60', NULL, 'BEI_JING', 9999.00, NULL, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `t_erp_spu` (`id`, `status`, `category_id`, `spu_no`, `name`, `images`, `production_place`, `price`, `specs`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `brand_id`, `enable_shelf_life`, `enable_attr`, `enable_multi_unit`, `disabled`) VALUES (7, 1, 352, NULL, 'iphone15 pro', NULL, 'LUO_YANG', 50000.00, NULL, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `t_erp_spu` (`id`, `status`, `category_id`, `spu_no`, `name`, `images`, `production_place`, `price`, `specs`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `brand_id`, `enable_shelf_life`, `enable_attr`, `enable_multi_unit`, `disabled`) VALUES (8, 1, 352, NULL, 'iphone14', NULL, 'ZHENG_ZHOU', 150.00, NULL, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `t_erp_spu` (`id`, `status`, `category_id`, `spu_no`, `name`, `images`, `production_place`, `price`, `specs`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `brand_id`, `enable_shelf_life`, `enable_attr`, `enable_multi_unit`, `disabled`) VALUES (10, 1, 357, NULL, '小米15', NULL, 'LUO_YANG', 7999.00, NULL, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `t_erp_spu` (`id`, `status`, `category_id`, `spu_no`, `name`, `images`, `production_place`, `price`, `specs`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `brand_id`, `enable_shelf_life`, `enable_attr`, `enable_multi_unit`, `disabled`) VALUES (11, 1, 354, NULL, '青轴键盘', NULL, 'ZHENG_ZHOU', 199.00, NULL, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `t_erp_spu` (`id`, `status`, `category_id`, `spu_no`, `name`, `images`, `production_place`, `price`, `specs`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `brand_id`, `enable_shelf_life`, `enable_attr`, `enable_multi_unit`, `disabled`) VALUES (12, 1, 356, NULL, '罗技双模鼠标', NULL, 'BEI_JING', 99.00, NULL, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1');
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_attrs
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_attrs`;
CREATE TABLE `t_erp_spu_attrs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `attrs` json DEFAULT NULL COMMENT 'spu属性',
  `spu_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spu编码',
  `spu_id` int DEFAULT NULL COMMENT 'spu_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SPU属性关系';

-- ----------------------------
-- Records of t_erp_spu_attrs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_category
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_category`;
CREATE TABLE `t_erp_spu_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `disabled` bit(1) DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
  `level` tinyint DEFAULT NULL COMMENT '层级',
  `leaf` bit(1) DEFAULT b'0' COMMENT '是否叶子节点',
  `path` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
  `pid` int NOT NULL COMMENT '父级id',
  `state` tinyint NOT NULL DEFAULT '1' COMMENT '状态 1-上架 2-下架',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parent_id` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='分类表，主要用于商品分类';

-- ----------------------------
-- Records of t_erp_spu_category
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (1, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '手机', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (2, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '键盘', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (3, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '自定义1', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (4, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '自定义2', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (351, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '鼠标', NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (352, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '苹果', NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (353, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '华为', NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (354, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, 'IKBC', NULL, NULL, NULL, NULL, 2, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (355, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '双飞燕', NULL, NULL, NULL, NULL, 2, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (356, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '罗技', NULL, NULL, NULL, NULL, 351, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (357, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, '小米', NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `t_erp_spu_category` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `disabled`, `level`, `leaf`, `path`, `pid`, `state`) VALUES (360, 0, NULL, '2024-01-20 13:26:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:26:57', NULL, NULL, NULL, 'iphone', NULL, NULL, NULL, NULL, 352, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_package
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_package`;
CREATE TABLE `t_erp_spu_package` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '套餐价格',
  `state` bit(1) DEFAULT NULL COMMENT '0-禁用 1-启用',
  `goods_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称，多个逗号拼接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品套餐\n';

-- ----------------------------
-- Records of t_erp_spu_package
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (1, 0, NULL, '2024-03-30 23:17:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:35', NULL, NULL, NULL, '盒', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (2, 0, NULL, '2024-03-30 23:17:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:55', NULL, NULL, NULL, '双', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (3, 0, NULL, '2024-03-30 23:18:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:03', NULL, NULL, NULL, '台', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (4, 0, NULL, '2024-03-30 23:18:12', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:12', NULL, NULL, NULL, '件', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (5, 0, NULL, '2024-03-30 23:18:23', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:23', NULL, NULL, NULL, '个', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (6, 0, NULL, '2024-03-30 23:18:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:31', NULL, NULL, NULL, '公斤', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (7, 0, NULL, '2024-03-30 23:18:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:40', NULL, NULL, NULL, '克', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (8, 0, NULL, '2024-03-30 23:18:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:49', NULL, NULL, NULL, '卷', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (9, 0, NULL, '2024-03-30 23:18:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:57', NULL, NULL, NULL, '套', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (10, 0, NULL, '2024-03-30 23:19:14', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:14', NULL, NULL, NULL, '袋', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (11, 0, NULL, '2024-03-30 23:19:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:17', NULL, NULL, NULL, '只', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (12, 0, NULL, '2024-03-30 23:19:24', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:24', NULL, NULL, NULL, '罐', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (13, 0, NULL, '2024-03-30 23:19:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:31', NULL, NULL, NULL, '升', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (14, 0, NULL, '2024-03-30 23:19:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:36', NULL, NULL, NULL, '斤', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (15, 0, NULL, '2024-03-30 23:19:42', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:42', NULL, NULL, NULL, '杯', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (16, 0, NULL, '2024-03-30 23:19:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:48', NULL, NULL, NULL, '支', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (17, 0, NULL, '2024-03-30 23:19:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:54', NULL, NULL, NULL, '箱', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (18, 0, NULL, '2024-03-30 23:20:00', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:00', NULL, NULL, NULL, '粒', NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `price`, `state`, `goods_name`) VALUES (19, 0, NULL, '2024-03-30 23:20:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:06', NULL, NULL, NULL, '米', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_package_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_package_detail`;
CREATE TABLE `t_erp_spu_package_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `spu_id` int DEFAULT NULL COMMENT 'spuid',
  `quantity` decimal(10,2) DEFAULT NULL COMMENT '数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `package_id` int DEFAULT NULL COMMENT '套餐ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品套餐明细';

-- ----------------------------
-- Records of t_erp_spu_package_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (1, 0, NULL, '2024-03-30 23:17:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (2, 0, NULL, '2024-03-30 23:17:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (3, 0, NULL, '2024-03-30 23:18:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (4, 0, NULL, '2024-03-30 23:18:12', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (5, 0, NULL, '2024-03-30 23:18:23', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (6, 0, NULL, '2024-03-30 23:18:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (7, 0, NULL, '2024-03-30 23:18:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (8, 0, NULL, '2024-03-30 23:18:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (9, 0, NULL, '2024-03-30 23:18:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (10, 0, NULL, '2024-03-30 23:19:14', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (11, 0, NULL, '2024-03-30 23:19:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (12, 0, NULL, '2024-03-30 23:19:24', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (13, 0, NULL, '2024-03-30 23:19:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (14, 0, NULL, '2024-03-30 23:19:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (15, 0, NULL, '2024-03-30 23:19:42', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (16, 0, NULL, '2024-03-30 23:19:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (17, 0, NULL, '2024-03-30 23:19:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (18, 0, NULL, '2024-03-30 23:20:00', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_package_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `price`, `amount`, `package_id`) VALUES (19, 0, NULL, '2024-03-30 23:20:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_template
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_template`;
CREATE TABLE `t_erp_spu_template` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `state` bit(1) DEFAULT NULL COMMENT '0-禁用 1-启用',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称，多个逗号拼接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品模板';

-- ----------------------------
-- Records of t_erp_spu_template
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (1, 0, NULL, '2024-03-30 23:17:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:35', NULL, NULL, NULL, '盒', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (2, 0, NULL, '2024-03-30 23:17:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:55', NULL, NULL, NULL, '双', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (3, 0, NULL, '2024-03-30 23:18:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:03', NULL, NULL, NULL, '台', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (4, 0, NULL, '2024-03-30 23:18:12', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:12', NULL, NULL, NULL, '件', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (5, 0, NULL, '2024-03-30 23:18:23', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:23', NULL, NULL, NULL, '个', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (6, 0, NULL, '2024-03-30 23:18:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:31', NULL, NULL, NULL, '公斤', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (7, 0, NULL, '2024-03-30 23:18:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:40', NULL, NULL, NULL, '克', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (8, 0, NULL, '2024-03-30 23:18:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:49', NULL, NULL, NULL, '卷', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (9, 0, NULL, '2024-03-30 23:18:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:57', NULL, NULL, NULL, '套', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (10, 0, NULL, '2024-03-30 23:19:14', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:14', NULL, NULL, NULL, '袋', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (11, 0, NULL, '2024-03-30 23:19:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:17', NULL, NULL, NULL, '只', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (12, 0, NULL, '2024-03-30 23:19:24', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:24', NULL, NULL, NULL, '罐', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (13, 0, NULL, '2024-03-30 23:19:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:31', NULL, NULL, NULL, '升', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (14, 0, NULL, '2024-03-30 23:19:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:36', NULL, NULL, NULL, '斤', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (15, 0, NULL, '2024-03-30 23:19:42', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:42', NULL, NULL, NULL, '杯', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (16, 0, NULL, '2024-03-30 23:19:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:48', NULL, NULL, NULL, '支', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (17, 0, NULL, '2024-03-30 23:19:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:54', NULL, NULL, NULL, '箱', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (18, 0, NULL, '2024-03-30 23:20:00', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:00', NULL, NULL, NULL, '粒', NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`, `code`, `state`, `goods_name`) VALUES (19, 0, NULL, '2024-03-30 23:20:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:06', NULL, NULL, NULL, '米', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_template_detail`;
CREATE TABLE `t_erp_spu_template_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `sku_id` int DEFAULT NULL COMMENT 'skuid',
  `spu_id` int DEFAULT NULL COMMENT 'spuid',
  `quantity` decimal(10,2) DEFAULT NULL COMMENT '数量',
  `template_id` int DEFAULT NULL COMMENT '模板ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品模板明细';

-- ----------------------------
-- Records of t_erp_spu_template_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (1, 0, NULL, '2024-03-30 23:17:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (2, 0, NULL, '2024-03-30 23:17:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (3, 0, NULL, '2024-03-30 23:18:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (4, 0, NULL, '2024-03-30 23:18:12', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (5, 0, NULL, '2024-03-30 23:18:23', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (6, 0, NULL, '2024-03-30 23:18:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (7, 0, NULL, '2024-03-30 23:18:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (8, 0, NULL, '2024-03-30 23:18:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (9, 0, NULL, '2024-03-30 23:18:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (10, 0, NULL, '2024-03-30 23:19:14', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (11, 0, NULL, '2024-03-30 23:19:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (12, 0, NULL, '2024-03-30 23:19:24', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (13, 0, NULL, '2024-03-30 23:19:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (14, 0, NULL, '2024-03-30 23:19:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (15, 0, NULL, '2024-03-30 23:19:42', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (16, 0, NULL, '2024-03-30 23:19:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (17, 0, NULL, '2024-03-30 23:19:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (18, 0, NULL, '2024-03-30 23:20:00', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_erp_spu_template_detail` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `sku_id`, `spu_id`, `quantity`, `template_id`) VALUES (19, 0, NULL, '2024-03-30 23:20:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_spu_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_unit`;
CREATE TABLE `t_erp_spu_unit` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `unit_id` int DEFAULT NULL COMMENT '单位ID',
  `unit_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位名称',
  `is_basic_unit` bit(1) DEFAULT b'0' COMMENT '是否基础单位 1-是',
  `quantity` int DEFAULT NULL COMMENT '换算数量',
  `spu_id` int DEFAULT NULL COMMENT 'spuid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品单位';

-- ----------------------------
-- Records of t_erp_spu_unit
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_spu_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `unit_name`, `is_basic_unit`, `quantity`, `spu_id`) VALUES (1, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_erp_spu_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `unit_name`, `is_basic_unit`, `quantity`, `spu_id`) VALUES (7, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_erp_spu_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `unit_name`, `is_basic_unit`, `quantity`, `spu_id`) VALUES (8, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_erp_spu_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `unit_name`, `is_basic_unit`, `quantity`, `spu_id`) VALUES (10, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_erp_spu_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `unit_name`, `is_basic_unit`, `quantity`, `spu_id`) VALUES (11, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_erp_spu_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `unit_id`, `unit_name`, `is_basic_unit`, `quantity`, `spu_id`) VALUES (12, 0, NULL, '2024-01-20 13:35:16', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:16', NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_erp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_supplier`;
CREATE TABLE `t_erp_supplier` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否默认',
  `code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `category_id` int DEFAULT NULL COMMENT '类别id',
  `contacts` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `address` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系地址',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `work_telephone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '单位电话',
  `email` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `wechat` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信号',
  `postal` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮编',
  `qq` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'QQ',
  `tax` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传真',
  `state` bit(1) DEFAULT NULL COMMENT '0-禁用 1-启用',
  `origin_debt` decimal(10,2) DEFAULT NULL COMMENT '初始欠款',
  `debt` decimal(10,2) DEFAULT NULL COMMENT '欠款',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ERP供应商';

-- ----------------------------
-- Records of t_erp_supplier
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_supplier_category
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_supplier_category`;
CREATE TABLE `t_erp_supplier_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `pid` int DEFAULT NULL COMMENT '父节点ID',
  `is_default` bit(1) DEFAULT b'0' COMMENT '是否默认 true-默认',
  `disabled` bit(1) DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
  `level` tinyint DEFAULT NULL COMMENT '层级',
  `leaf` bit(1) DEFAULT b'0' COMMENT '是否叶子节点',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ERP供应商类别';

-- ----------------------------
-- Records of t_erp_supplier_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_erp_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_unit`;
CREATE TABLE `t_erp_unit` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单位';

-- ----------------------------
-- Records of t_erp_unit
-- ----------------------------
BEGIN;
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (1, 0, NULL, '2024-03-30 23:17:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:35', NULL, NULL, NULL, '盒');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (2, 0, NULL, '2024-03-30 23:17:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:17:55', NULL, NULL, NULL, '双');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (3, 0, NULL, '2024-03-30 23:18:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:03', NULL, NULL, NULL, '台');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (4, 0, NULL, '2024-03-30 23:18:12', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:12', NULL, NULL, NULL, '件');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (5, 0, NULL, '2024-03-30 23:18:23', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:23', NULL, NULL, NULL, '个');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (6, 0, NULL, '2024-03-30 23:18:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:31', NULL, NULL, NULL, '公斤');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (7, 0, NULL, '2024-03-30 23:18:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:40', NULL, NULL, NULL, '克');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (8, 0, NULL, '2024-03-30 23:18:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:49', NULL, NULL, NULL, '卷');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (9, 0, NULL, '2024-03-30 23:18:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:18:57', NULL, NULL, NULL, '套');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (10, 0, NULL, '2024-03-30 23:19:14', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:14', NULL, NULL, NULL, '袋');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (11, 0, NULL, '2024-03-30 23:19:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:17', NULL, NULL, NULL, '只');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (12, 0, NULL, '2024-03-30 23:19:24', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:24', NULL, NULL, NULL, '罐');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (13, 0, NULL, '2024-03-30 23:19:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:31', NULL, NULL, NULL, '升');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (14, 0, NULL, '2024-03-30 23:19:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:36', NULL, NULL, NULL, '斤');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (15, 0, NULL, '2024-03-30 23:19:42', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:42', NULL, NULL, NULL, '杯');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (16, 0, NULL, '2024-03-30 23:19:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:48', NULL, NULL, NULL, '支');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (17, 0, NULL, '2024-03-30 23:19:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:19:54', NULL, NULL, NULL, '箱');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (18, 0, NULL, '2024-03-30 23:20:00', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:00', NULL, NULL, NULL, '粒');
INSERT INTO `t_erp_unit` (`id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `name`) VALUES (19, 0, NULL, '2024-03-30 23:20:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-30 23:20:06', NULL, NULL, NULL, '米');
COMMIT;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `feedback_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feedback_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '反馈内容',
  `feedback_attachment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反馈图片',
  `user_type` int NOT NULL COMMENT '创建人用户类型',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`feedback_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='意见反馈';

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
BEGIN;
INSERT INTO `t_feedback` (`feedback_id`, `feedback_content`, `feedback_attachment`, `user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '希望增加微信公众号消息提醒功能', 'public/feedback/609fd595e8a9416b992c3a00e37cc8e0_20221022133322_jpg', 1, 0, NULL, '2024-01-20 13:34:13', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:13', NULL, NULL, NULL);
INSERT INTO `t_feedback` (`feedback_id`, `feedback_content`, `feedback_attachment`, `user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, '顶部菜单希望能尽快实现', '', 1, 0, NULL, '2024-01-20 13:34:13', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:13', NULL, NULL, NULL);
INSERT INTO `t_feedback` (`feedback_id`, `feedback_content`, `feedback_attachment`, `user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (3, 'app版本什么时候能推出？', '', 1, 0, NULL, '2024-01-20 13:34:13', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:13', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `file_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `folder_type` tinyint unsigned NOT NULL COMMENT '文件夹类型',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名称',
  `file_size` int DEFAULT NULL COMMENT '文件大小',
  `file_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件key，用于文件下载',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `creator_user_type` int DEFAULT NULL COMMENT '创建人用户类型',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`file_id`) USING BTREE,
  UNIQUE KEY `uk_file_key` (`file_key`) USING BTREE,
  KEY `module_id_module_type` (`folder_type`) USING BTREE,
  KEY `module_type` (`folder_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='文件';

-- ----------------------------
-- Records of t_file
-- ----------------------------
BEGIN;
INSERT INTO `t_file` (`file_id`, `folder_type`, `file_name`, `file_size`, `file_key`, `file_type`, `creator_user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (33, 1, 'profile-128-128.jpg', 19960, 'public/common/4a3a1f9dc47b4533a1289539d6ea7809_20231121204816.jpg', 'jpg', 1, 0, NULL, '2024-01-20 13:34:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:39', NULL, NULL, NULL);
INSERT INTO `t_file` (`file_id`, `folder_type`, `file_name`, `file_size`, `file_key`, `file_type`, `creator_user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (34, 1, 'profile-128-128.jpg', 19960, 'public/common/7e699fcecb1b4f33bd936751f3410341_20231128180116.jpg', 'jpg', 1, 0, NULL, '2024-01-20 13:34:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:39', NULL, NULL, NULL);
INSERT INTO `t_file` (`file_id`, `folder_type`, `file_name`, `file_size`, `file_key`, `file_type`, `creator_user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (35, 1, '商品模板 (3).xls', 19968, 'public/common/593c42569867486ebf4950e8f088a20c_20231201141913.xls', 'xls', 1, 0, NULL, '2024-01-20 13:34:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:39', NULL, NULL, NULL);
INSERT INTO `t_file` (`file_id`, `folder_type`, `file_name`, `file_size`, `file_key`, `file_type`, `creator_user_type`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (36, 1, 'profile-128-128.jpg', 19960, 'public/common/59b1ca99b7fe45d78678e6295798a699_20231201200459.jpg', 'jpg', 1, 0, NULL, '2024-01-20 13:34:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:34:39', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_heart_beat_record
-- ----------------------------
DROP TABLE IF EXISTS `t_heart_beat_record`;
CREATE TABLE `t_heart_beat_record` (
  `heart_beat_record_id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目名称',
  `server_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务器ip',
  `process_no` int NOT NULL COMMENT '进程号',
  `process_start_time` datetime NOT NULL COMMENT '进程开启时间',
  `heart_beat_time` datetime NOT NULL COMMENT '心跳时间',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`heart_beat_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='公用服务 - 服务心跳';

-- ----------------------------
-- Records of t_heart_beat_record
-- ----------------------------
BEGIN;
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, 'E:\\code_work_space\\idea\\smart-admin-developing\\smart-admin-api-developing', '127.0.0.1;192.168.137.1;192.168.19.183', 14452, '2024-01-08 15:35:03', '2024-01-08 19:26:24', 0, NULL, '2024-01-20 13:35:30', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:30', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (197, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 3648, '2024-01-19 21:25:41', '2024-01-19 22:06:57', 0, NULL, '2024-01-20 13:35:30', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:30', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (198, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 7435, '2024-01-19 23:13:57', '2024-01-19 23:15:12', 0, NULL, '2024-01-20 13:35:30', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:30', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (199, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 7592, '2024-01-20 13:49:33', '2024-01-20 13:55:46', 0, NULL, '2024-01-20 13:55:46', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:50:46', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (200, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 16022, '2024-01-20 20:04:19', '2024-01-20 20:10:52', 0, NULL, '2024-01-20 20:10:51', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:05:51', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (201, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 16982, '2024-01-20 20:26:52', '2024-01-20 20:28:06', 0, NULL, '2024-01-20 20:28:06', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:28:06', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (202, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 17337, '2024-01-20 20:30:10', '2024-01-20 20:31:33', 0, NULL, '2024-01-20 20:31:33', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:31:33', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (203, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 17594, '2024-01-20 20:36:25', '2024-01-20 20:42:41', 0, NULL, '2024-01-20 20:42:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:37:40', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (204, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 17791, '2024-01-20 20:43:08', '2024-01-20 20:44:22', 0, NULL, '2024-01-20 20:44:22', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:44:22', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (205, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 17861, '2024-01-20 20:45:25', '2024-01-20 21:06:40', 0, NULL, '2024-01-20 21:06:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:46:40', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (206, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 18738, '2024-01-20 21:08:02', '2024-01-20 21:49:19', 0, NULL, '2024-01-20 21:49:18', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:09:18', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (207, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 3996, '2024-01-21 13:04:23', '2024-01-21 14:10:45', 0, NULL, '2024-01-21 14:10:44', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:05:43', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (208, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 15306, '2024-01-21 16:38:17', '2024-01-21 17:04:36', 0, NULL, '2024-01-21 17:04:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 16:39:36', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (209, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 16170, '2024-01-21 17:09:23', '2024-01-21 18:30:40', 0, NULL, '2024-01-21 18:30:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 17:10:39', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (210, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 18100, '2024-01-21 18:32:48', '2024-01-21 21:44:04', 0, NULL, '2024-01-21 21:44:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 18:34:03', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (211, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 1445, '2024-01-24 22:06:36', '2024-01-24 23:47:56', 0, NULL, '2024-01-24 23:47:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:07:55', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (212, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.100;127.0.0.1', 4121, '2024-01-27 16:18:09', '2024-01-27 16:49:29', 0, NULL, '2024-01-27 16:49:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 16:19:28', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (213, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.100;127.0.0.1', 4921, '2024-01-27 16:50:10', '2024-01-27 17:06:29', 0, NULL, '2024-01-27 17:06:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 16:51:28', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (214, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.100;127.0.0.1', 5310, '2024-01-27 17:08:08', '2024-01-27 17:19:23', 0, NULL, '2024-01-27 17:19:22', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 17:09:22', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (215, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 2165, '2024-02-22 23:06:23', '2024-02-22 23:32:38', 0, NULL, '2024-02-22 23:32:38', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:07:38', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (216, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 3124, '2024-02-22 23:36:24', '2024-02-22 23:42:48', 0, NULL, '2024-02-22 23:42:47', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:37:47', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (217, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 3403, '2024-02-22 23:42:55', '2024-02-22 23:44:10', 0, NULL, '2024-02-22 23:44:09', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:44:09', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (218, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 3496, '2024-02-22 23:45:43', '2024-02-22 23:57:37', 0, NULL, '2024-02-22 23:57:36', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:46:55', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (219, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 3758, '2024-02-22 23:57:47', '2024-02-22 23:59:05', 0, NULL, '2024-02-22 23:59:05', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:59:05', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (220, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.101;127.0.0.1', 1688, '2024-02-28 22:31:01', '2024-02-29 00:22:26', 0, NULL, '2024-02-29 00:22:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 22:32:22', NULL, NULL, NULL);
INSERT INTO `t_heart_beat_record` (`heart_beat_record_id`, `project_path`, `server_ip`, `process_no`, `process_start_time`, `heart_beat_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (221, '/Users/jun/Documents/MF/template/MF-BOOT', '192.168.1.102;127.0.0.1', 1783, '2024-03-20 22:46:44', '2024-03-20 23:12:59', 0, NULL, '2024-03-20 23:12:58', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-20 22:47:58', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_help_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc`;
CREATE TABLE `t_help_doc` (
  `help_doc_id` bigint NOT NULL AUTO_INCREMENT,
  `help_doc_catalog_id` bigint NOT NULL COMMENT '类型1公告 2动态',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文本内容',
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'html内容',
  `attachment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附件',
  `sort_value` int NOT NULL DEFAULT '0' COMMENT '排序',
  `page_view_count` int NOT NULL DEFAULT '0' COMMENT '页面浏览量，传说中的pv',
  `user_view_count` int NOT NULL DEFAULT '0' COMMENT '用户浏览量，传说中的uv',
  `author` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`help_doc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档';

-- ----------------------------
-- Records of t_help_doc
-- ----------------------------
BEGIN;
INSERT INTO `t_help_doc` (`help_doc_id`, `help_doc_catalog_id`, `title`, `content_text`, `content_html`, `attachment`, `sort_value`, `page_view_count`, `user_view_count`, `author`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (32, 6, '企业名称该写什么？', '需求1：管理公司基本信息，包含：企业名称、Logo、地区、营业执照、联系人 等等，可以 增删拆改需求2：管理公司的银行账户，包含：银行信息、账户名称、账号、类型等，可以 增删拆改需求3：管理公司的发票信息，包含：开票抬头、纳税号、银行账户、开户行、备注等，可以 增删拆改需求4：对于公司信息、银行信息、发票信息 任何的修改，都有记录 数据变动记录；', '<ul><li style=\"text-align: start;\">需求1：管理公司基本信息，包含：企业名称、Logo、地区、营业执照、联系人 等等，可以 增删拆改</li><li style=\"text-align: start;\">需求2：管理公司的银行账户，包含：银行信息、账户名称、账号、类型等，可以 增删拆改</li><li style=\"text-align: start;\">需求3：管理公司的发票信息，包含：开票抬头、纳税号、银行账户、开户行、备注等，可以 增删拆改</li><li style=\"text-align: start;\">需求4：对于公司信息、银行信息、发票信息 任何的修改，都有记录 数据变动记录；</li></ul>', '', 0, 49, 1, '卓大', NULL, '2024-01-20 13:35:59', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:59', NULL, NULL, NULL);
INSERT INTO `t_help_doc` (`help_doc_id`, `help_doc_catalog_id`, `title`, `content_text`, `content_html`, `attachment`, `sort_value`, `page_view_count`, `user_view_count`, `author`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (33, 6, '谁有权限查看企业信息', '需求1：管理公司基本信息，包含：企业名称、Logo、地区、营业执照、联系人 等等，可以 增删拆改需求2：管理公司的银行账户，包含：银行信息、账户名称、账号、类型等，可以 增删拆改需求3：管理公司的发票信息，包含：开票抬头、纳税号、银行账户、开户行、备注等，可以 增删拆改需求4：对于公司信息、银行信息、发票信息 任何的修改，都有记录 数据变动记录；', '<ul><li style=\"text-align: start;\">需求1：管理公司基本信息，包含：企业名称、Logo、地区、营业执照、联系人 等等，可以 增删拆改</li><li style=\"text-align: start;\">需求2：管理公司的银行账户，包含：银行信息、账户名称、账号、类型等，可以 增删拆改</li><li style=\"text-align: start;\">需求3：管理公司的发票信息，包含：开票抬头、纳税号、银行账户、开户行、备注等，可以 增删拆改</li><li style=\"text-align: start;\">需求4：对于公司信息、银行信息、发票信息 任何的修改，都有记录 数据变动记录；</li></ul>', '', 0, 12, 1, '卓大', NULL, '2024-01-20 13:35:59', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:35:59', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_help_doc_catalog
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc_catalog`;
CREATE TABLE `t_help_doc_catalog` (
  `help_doc_catalog_id` bigint NOT NULL AUTO_INCREMENT COMMENT '帮助文档目录',
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort_value` int NOT NULL DEFAULT '0' COMMENT '排序字段',
  `parent_id` bigint NOT NULL COMMENT '父级id',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`help_doc_catalog_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档-目录';

-- ----------------------------
-- Records of t_help_doc_catalog
-- ----------------------------
BEGIN;
INSERT INTO `t_help_doc_catalog` (`help_doc_catalog_id`, `name`, `sort_value`, `parent_id`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (6, '企业信息', 0, 0, NULL, '2024-01-20 13:36:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:36:28', NULL, NULL, NULL);
INSERT INTO `t_help_doc_catalog` (`help_doc_catalog_id`, `name`, `sort_value`, `parent_id`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (9, '企业信用', 0, 6, NULL, '2024-01-20 13:36:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:36:28', NULL, NULL, NULL);
INSERT INTO `t_help_doc_catalog` (`help_doc_catalog_id`, `name`, `sort_value`, `parent_id`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (10, '采购文档', 0, 11, NULL, '2024-01-20 13:36:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:36:28', NULL, NULL, NULL);
INSERT INTO `t_help_doc_catalog` (`help_doc_catalog_id`, `name`, `sort_value`, `parent_id`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (11, '进销存', 0, 0, NULL, '2024-01-20 13:36:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:36:28', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_help_doc_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc_relation`;
CREATE TABLE `t_help_doc_relation` (
  `relation_id` bigint NOT NULL COMMENT '关联id',
  `relation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联名称',
  `help_doc_id` bigint NOT NULL COMMENT '文档id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`relation_id`,`help_doc_id`) USING BTREE,
  UNIQUE KEY `uni_menu_help_doc` (`relation_id`,`help_doc_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档-关联表';

-- ----------------------------
-- Records of t_help_doc_relation
-- ----------------------------
BEGIN;
INSERT INTO `t_help_doc_relation` (`relation_id`, `relation_name`, `help_doc_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (0, '首页', 32, 0, NULL, '2024-01-20 13:36:43', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:36:43', NULL, NULL, NULL);
INSERT INTO `t_help_doc_relation` (`relation_id`, `relation_name`, `help_doc_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (0, '首页', 33, 0, NULL, '2024-01-20 13:36:43', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:36:43', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_help_doc_view_record
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc_view_record`;
CREATE TABLE `t_help_doc_view_record` (
  `help_doc_id` bigint NOT NULL COMMENT '通知公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名称',
  `page_view_count` int DEFAULT '0' COMMENT '查看次数',
  `first_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首次ip',
  `first_user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首次用户设备等标识',
  `last_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后一次ip',
  `last_user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后一次用户设备等标识',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`help_doc_id`,`user_id`) USING BTREE,
  UNIQUE KEY `uk_notice_employee` (`help_doc_id`,`user_id`) USING BTREE COMMENT '资讯员工'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档-查看记录';

-- ----------------------------
-- Records of t_help_doc_view_record
-- ----------------------------
BEGIN;
INSERT INTO `t_help_doc_view_record` (`help_doc_id`, `user_id`, `user_name`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (31, 1, '管理员', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:37:02', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:37:02', NULL, NULL, NULL);
INSERT INTO `t_help_doc_view_record` (`help_doc_id`, `user_id`, `user_name`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (32, 1, '管理员', 49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:37:02', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:37:02', NULL, NULL, NULL);
INSERT INTO `t_help_doc_view_record` (`help_doc_id`, `user_id`, `user_name`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (33, 1, '管理员', 12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:37:02', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:37:02', NULL, NULL, NULL);
INSERT INTO `t_help_doc_view_record` (`help_doc_id`, `user_id`, `user_name`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (34, 1, '管理员', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:37:02', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:37:02', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint DEFAULT '0' COMMENT '计划执行错误策略（0-默认 1立即执行 2执行一次 3放弃执行）',
  `concurrent` bit(1) DEFAULT b'1' COMMENT '是否并发执行（1-允许 0-禁止）',
  `status` bit(1) DEFAULT b'1' COMMENT '状态（1-正常 0-暂停）',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务唯一key',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度表';

-- ----------------------------
-- Records of t_job
-- ----------------------------
BEGIN;
INSERT INTO `t_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `code`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (3, '测试任务', 'temp', 'testTask.test()', '0 0 */1 * * ?', 1, b'1', b'1', NULL, 0, NULL, '2024-03-20 22:55:51', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 16:40:49', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_id` bigint DEFAULT NULL COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `status` bit(1) DEFAULT b'1' COMMENT '执行状态（1正常 0-失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '异常信息',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `start_time` datetime DEFAULT NULL COMMENT '开始执行时间',
  `end_time` datetime DEFAULT NULL COMMENT '执行结束时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of t_job_log
-- ----------------------------
BEGIN;
INSERT INTO `t_job_log` (`job_log_id`, `job_id`, `job_name`, `job_group`, `invoke_target`, `job_message`, `status`, `exception_info`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`, `start_time`, `end_time`) VALUES (1, NULL, '测试任务', 'temp', 'testTask.test()', '测试任务 总共耗时：-4毫秒', b'0', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'testTask\' available\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:874)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1344)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\n	at cn.hutool.extra.spring.SpringUtil.getBean(SpringUtil.java:107)\n	at cn.morefocus.base.module.support.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:27)\n	at cn.morefocus.base.module.support.quartz.util.QuartzJobExecution.doExecute(QuartzJobExecution.java:12)\n	at cn.morefocus.base.module.support.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:34)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', 0, NULL, '2024-02-22 23:58:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:58:50', NULL, NULL, NULL, '2024-02-22 23:58:51', '2024-02-22 23:58:51');
COMMIT;

-- ----------------------------
-- Table structure for t_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `t_login_fail`;
CREATE TABLE `t_login_fail` (
  `login_fail_id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_type` int NOT NULL COMMENT '用户类型',
  `login_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录名',
  `login_fail_count` int DEFAULT NULL COMMENT '连续登录失败次数',
  `lock_flag` tinyint DEFAULT '0' COMMENT '锁定状态:1锁定，0未锁定',
  `login_lock_begin_time` datetime DEFAULT NULL COMMENT '连续登录失败锁定开始时间',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`login_fail_id`) USING BTREE,
  UNIQUE KEY `uid_and_utype` (`user_id`,`user_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='登录失败次数记录表';

-- ----------------------------
-- Records of t_login_fail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `login_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户id',
  `user_type` int NOT NULL COMMENT '用户类型',
  `user_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `login_ip` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ip',
  `login_ip_region` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ip地区',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'user-agent信息',
  `login_result` int NOT NULL COMMENT '登录结果：0成功 1失败 2 退出',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`login_log_id`) USING BTREE,
  KEY `customer_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户登录日志';

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
BEGIN;
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (111, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-20 20:36:58', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:36:58', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (112, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-21 13:08:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:08:28', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (113, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 2, 0, NULL, '2024-01-21 13:16:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:16:53', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (114, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-21 13:42:20', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:42:20', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (115, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 2, 0, NULL, '2024-01-21 13:51:45', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:51:45', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (116, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-21 13:52:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:52:39', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (117, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 2, 0, NULL, '2024-01-21 13:54:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:54:08', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (118, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-21 13:55:09', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:55:09', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (119, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-21 16:42:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 16:42:50', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (120, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-24 22:09:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:09:08', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (121, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 2, 0, NULL, '2024-01-24 22:37:46', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:37:46', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (122, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-24 22:37:52', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:37:52', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (123, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-01-27 16:19:07', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 16:19:07', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (124, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-02-22 23:12:51', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:12:51', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (125, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-02-28 22:32:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 22:32:48', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (126, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-02-28 23:34:20', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 23:34:20', NULL, NULL, NULL);
INSERT INTO `t_login_log` (`login_log_id`, `user_id`, `user_type`, `user_name`, `login_ip`, `login_ip_region`, `user_agent`, `login_result`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (127, 1, 1, '管理员', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 0, 0, '电脑端', '2024-03-20 22:55:23', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-20 22:55:23', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `menu_type` int NOT NULL COMMENT '类型',
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `sort_value` int DEFAULT NULL COMMENT '显示顺序',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `perms_type` int DEFAULT NULL COMMENT '权限类型',
  `api_perms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '后端权限字符串',
  `web_perms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '前端权限字符串',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `context_menu_id` bigint DEFAULT NULL COMMENT '功能点关联菜单ID',
  `frame_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为外链',
  `frame_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '外链地址',
  `cache_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `visible_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示状态',
  `disabled_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (26, '菜单管理', 2, 50, 1, '/menu/list', '/system/menu/menu-list.vue', NULL, NULL, NULL, 'CopyOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (40, '删除', 3, 26, NULL, NULL, NULL, 1, 'system:menu:batchDelete', 'system:menu:batchDelete', NULL, 26, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (45, '部门员工', 1, 0, 3, '/organization', NULL, NULL, NULL, NULL, 'UserSwitchOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (46, '部门员工', 2, 45, 1, '/employee/department', '/system/employee/department/index.vue', NULL, NULL, NULL, 'AuditOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (47, '商品管理', 2, 48, 1, '/erp/goods/list', '/business/erp/goods/goods-list.vue', NULL, NULL, NULL, 'AliwangwangOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (48, '商品管理', 1, 137, 10, '/goods', NULL, NULL, NULL, NULL, 'BarcodeOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (50, '系统设置', 1, 0, 6, '/setting', NULL, NULL, NULL, NULL, 'SettingOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (76, '角色管理', 2, 45, 2, '/employee/role', '/system/employee/role/index.vue', NULL, NULL, NULL, 'SlidersOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (78, '商品分类', 2, 48, 2, '/erp/catalog/goods', '/business/erp/catalog/goods-catalog.vue', NULL, NULL, NULL, 'ApartmentOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (79, '自定义分组', 2, 48, 3, '/erp/catalog/custom', '/business/erp/catalog/custom-catalog.vue', NULL, NULL, NULL, 'AppstoreAddOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (81, '请求监控', 2, 111, 3, '/support/operate-log/operate-log-list', '/support/operate-log/operate-log-list.vue', NULL, NULL, NULL, 'VideoCameraOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (85, '组件演示', 2, 84, NULL, '/demonstration/index', '/support/demonstration/index.vue', NULL, NULL, NULL, 'ClearOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (86, '添加部门', 3, 46, 1, NULL, NULL, 1, 'system:department:add', 'system:department:add', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (87, '修改部门', 3, 46, 2, NULL, NULL, 1, 'system:department:update', 'system:department:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (88, '删除部门', 3, 46, 3, NULL, NULL, 1, 'system:department:delete', 'system:department:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (91, '添加员工', 3, 46, NULL, NULL, NULL, 1, 'system:employee:add', 'system:employee:add', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (92, '编辑员工', 3, 46, NULL, NULL, NULL, 1, 'system:employee:update', 'system:employee:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (93, '禁用启用员工', 3, 46, NULL, NULL, NULL, 1, 'system:employee:disabled', 'system:employee:disabled', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (94, '调整员工部门', 3, 46, NULL, NULL, NULL, 1, 'system:employee:department:update', 'system:employee:department:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (95, '重置密码', 3, 46, NULL, NULL, NULL, 1, 'system:employee:password:reset', 'system:employee:password:reset', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (96, '删除员工', 3, 46, NULL, NULL, NULL, 1, 'system:employee:delete', 'system:employee:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (97, '添加角色', 3, 76, NULL, NULL, NULL, 1, 'system:role:add', 'system:role:add', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (98, '删除角色', 3, 76, NULL, NULL, NULL, 1, 'system:role:delete', 'system:role:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (99, '编辑角色', 3, 76, NULL, NULL, NULL, 1, 'system:role:update', 'system:role:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (100, '更新数据范围', 3, 76, NULL, NULL, NULL, 1, 'system:role:dataScope:update', 'system:role:dataScope:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (101, '批量移除员工', 3, 76, NULL, NULL, NULL, 1, 'system:role:employee:batch:delete', 'system:role:employee:batch:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (102, '移除员工', 3, 76, NULL, NULL, NULL, 1, 'system:role:employee:delete', 'system:role:employee:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (103, '添加员工', 3, 76, NULL, NULL, NULL, 1, 'system:role:employee:add', 'system:role:employee:add', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (104, '修改权限', 3, 76, NULL, NULL, NULL, 1, 'system:role:menu:update', 'system:role:menu:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (105, '添加', 3, 26, NULL, NULL, NULL, 1, 'system:menu:add', 'system:menu:add', NULL, 26, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (106, '编辑', 3, 26, NULL, NULL, NULL, 1, 'system:menu:update', 'system:menu:update', NULL, 26, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (109, '参数配置', 2, 50, 2, '/config/config-list', '/support/config/config-list.vue', NULL, NULL, NULL, 'AntDesignOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-24 22:36:31', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (110, '数据字典', 2, 50, 3, '/setting/dict', '/support/dict/index.vue', NULL, NULL, NULL, 'BarcodeOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-24 22:36:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (111, '监控服务', 1, 0, 100, '/monitor', NULL, NULL, NULL, NULL, 'BarChartOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (113, '查询', 3, 112, NULL, NULL, NULL, NULL, NULL, 'ad', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (114, '运维工具', 1, 0, 200, NULL, NULL, NULL, NULL, NULL, 'NodeCollapseOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (117, 'Reload', 2, 50, 6, '/hook', '/support/reload/reload-list.vue', NULL, NULL, NULL, 'ReloadOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-24 22:37:12', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (122, '数据库监控', 2, 111, 4, '/support/druid/index', NULL, NULL, NULL, NULL, 'ConsoleSqlOutlined', NULL, 1, 'http://localhost:1024/druid', 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (130, '单号管理', 2, 50, 4, '/support/serial-number/serial-number-list', '/support/serial-number/serial-number-list.vue', NULL, NULL, NULL, 'NumberOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-24 22:36:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (132, '通知公告', 2, 138, 2, '/oa/notice/notice-list', '/business/oa/notice/notice-list.vue', NULL, NULL, NULL, 'SoundOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (133, '缓存管理', 2, 50, 5, '/support/cache/cache-list', '/support/cache/cache-list.vue', NULL, NULL, NULL, 'BorderInnerOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-24 22:37:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (137, '进销存系统', 1, 0, 2, NULL, NULL, NULL, NULL, NULL, 'AccountBookOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (138, 'OA系统', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, 'BankOutlined', NULL, 0, NULL, 0, 0, 0, NULL, '2024-03-20 23:00:41', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (142, '公告详情', 2, 132, NULL, '/oa/notice/notice-detail', '/business/oa/notice/notice-detail.vue', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (143, '登录日志', 2, 213, 2, '/support/login-log/login-log-list', '/support/login-log/login-log-list.vue', NULL, NULL, NULL, 'LoginOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (144, '企业信息', 2, 138, 1, '/oa/enterprise/enterprise-list', '/business/oa/enterprise/enterprise-list.vue', NULL, NULL, NULL, 'ShopOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (145, '企业详情', 2, 138, NULL, '/oa/enterprise/enterprise-detail', '/business/oa/enterprise/enterprise-detail.vue', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (147, '帮助文档', 2, 218, 1, '/help-doc/help-doc-manage-list', '/support/help-doc/management/help-doc-manage-list.vue', NULL, NULL, NULL, 'FolderViewOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (148, '意见反馈', 2, 218, 2, '/feedback/feedback-list', '/support/feedback/feedback-list.vue', NULL, NULL, NULL, 'CoffeeOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (149, '我的通知', 2, 132, NULL, '/oa/notice/notice-employee-list', '/business/oa/notice/notice-employee-list.vue', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (150, '我的通知公告详情', 2, 132, NULL, '/oa/notice/notice-employee-detail', '/business/oa/notice/notice-employee-detail.vue', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (151, '代码生成', 2, 0, 600, '/support/code-generator', '/support/code-generator/code-generator-list.vue', NULL, NULL, NULL, 'CoffeeOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (152, '更新日志', 2, 218, 3, '/support/change-log/change-log-list', '/support/change-log/change-log-list.vue', NULL, NULL, NULL, 'HeartOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (153, '清除缓存', 3, 133, NULL, NULL, NULL, 1, 'support:cache:delete', 'support:cache:delete', NULL, 133, 0, NULL, 0, 1, 1, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (154, '获取缓存key', 3, 133, NULL, NULL, NULL, 1, 'support:cache:keys', 'support:cache:keys', NULL, 133, 0, NULL, 0, 1, 1, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (156, '查看结果', 3, 117, NULL, NULL, NULL, 1, 'support:reload:result', 'support:reload:result', NULL, 117, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (157, '单号生成', 3, 130, NULL, NULL, NULL, 1, 'support:serialNumber:generate', 'support:serialNumber:generate', NULL, 130, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (158, '生成记录', 3, 130, NULL, NULL, NULL, 1, 'support:serialNumber:record', 'support:serialNumber:record', NULL, 130, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (159, '新建', 3, 110, NULL, NULL, NULL, 1, 'support:dict:add', 'support:dict:add', NULL, 110, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (160, '编辑', 3, 110, NULL, NULL, NULL, 1, 'support:dict:edit', 'support:dict:edit', NULL, 110, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (161, '批量删除', 3, 110, NULL, NULL, NULL, 1, 'support:dict:delete', 'support:dict:delete', NULL, 110, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (162, '刷新缓存', 3, 110, NULL, NULL, NULL, 1, 'support:dict:refresh', 'support:dict:refresh', NULL, 110, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (163, '新建', 3, 109, NULL, NULL, NULL, 1, 'support:config:add', 'support:config:add', NULL, 109, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (164, '编辑', 3, 109, NULL, NULL, NULL, 1, 'support:config:update', 'support:config:update', NULL, 109, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (165, '查询', 3, 47, NULL, NULL, NULL, 1, 'goods:query', 'goods:query', NULL, 47, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (166, '新建', 3, 47, NULL, NULL, NULL, 1, 'goods:add', 'goods:add', NULL, 47, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (167, '批量删除', 3, 47, NULL, NULL, NULL, 1, 'goods:batchDelete', 'goods:batchDelete', NULL, 47, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (168, '查询', 3, 147, 11, NULL, NULL, 1, 'support:helpDoc:query', 'support:helpDoc:query', NULL, 147, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (169, '新建', 3, 147, 12, NULL, NULL, 1, 'support:helpDoc:add', 'support:helpDoc:add', NULL, 147, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (170, '新建目录', 3, 147, 1, NULL, NULL, 1, 'support:helpDocCatalog:addCategory', 'support:helpDocCatalog:addCategory', NULL, 147, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (171, '修改目录', 3, 147, 2, NULL, NULL, 1, 'support:helpDocCatalog:update', 'support:helpDocCatalog:update', NULL, 147, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (173, '新建', 3, 78, NULL, NULL, NULL, 1, 'category:add', 'category:add', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (174, '查询', 3, 78, NULL, NULL, NULL, 1, 'category:tree', 'category:tree', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (175, '编辑', 3, 78, NULL, NULL, NULL, 1, 'category:update', 'category:update', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (176, '删除', 3, 78, NULL, NULL, NULL, 1, 'category:delete', 'category:delete', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (177, '新建', 3, 79, NULL, NULL, NULL, 1, 'category:add', 'custom:category:add', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (178, '查询', 3, 79, NULL, NULL, NULL, 1, 'category:tree', 'custom:category:tree', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (179, '编辑', 3, 79, NULL, NULL, NULL, 1, 'category:update', 'custom:category:update', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (180, '删除', 3, 79, NULL, NULL, NULL, 1, 'category:delete', 'custom:category:delete', NULL, 78, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (181, '查询', 3, 144, NULL, NULL, NULL, 1, 'oa:enterprise:query', 'oa:enterprise:query', NULL, 144, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (182, '新建', 3, 144, NULL, NULL, NULL, 1, 'oa:enterprise:add', 'oa:enterprise:add', NULL, 144, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (183, '编辑', 3, 144, NULL, NULL, NULL, 1, 'oa:enterprise:update', 'oa:enterprise:update', NULL, 144, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (184, '删除', 3, 144, NULL, NULL, NULL, 1, 'oa:enterprise:delete', 'oa:enterprise:delete', NULL, 144, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (185, '查询', 3, 132, NULL, NULL, NULL, 1, 'oa:notice:query', 'oa:notice:query', NULL, 132, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (186, '新建', 3, 132, NULL, NULL, NULL, 1, 'oa:notice:add', 'oa:notice:add', NULL, 132, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (187, '编辑', 3, 132, NULL, NULL, NULL, 1, 'oa:notice:update', 'oa:notice:update', NULL, 132, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (188, '删除', 3, 132, NULL, NULL, NULL, 1, 'oa:notice:delete', 'oa:notice:delete', NULL, 132, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (190, '查询', 3, 152, NULL, NULL, NULL, 1, '', 'support:changeLog:query', NULL, 152, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (191, '新建', 3, 152, NULL, NULL, NULL, 1, 'support:changeLog:add', 'support:changeLog:add', NULL, 152, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (192, '批量删除', 3, 152, NULL, NULL, NULL, 1, 'support:changeLog:batchDelete', 'support:changeLog:batchDelete', NULL, 152, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (193, '文件管理', 2, 50, 7, '/support/file/file-list', '/support/file/file-list.vue', NULL, NULL, NULL, 'FolderOpenOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-24 22:37:33', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (194, '删除', 3, 47, NULL, NULL, NULL, 1, 'goods:delete', 'goods:delete', NULL, 47, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (195, '修改', 3, 47, NULL, NULL, NULL, 1, 'goods:update', 'goods:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (196, '查看详情', 3, 145, NULL, NULL, NULL, 1, 'oa:enterprise:detail', 'oa:enterprise:detail', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (198, '删除', 3, 152, NULL, NULL, NULL, 1, 'support:changeLog:delete', 'support:changeLog:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (199, '查询', 3, 109, NULL, NULL, NULL, 1, 'support:config:query', 'support:config:query', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (200, '查询', 3, 193, NULL, NULL, NULL, 1, 'support:file:query', 'support:file:query', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (201, '删除', 3, 147, 14, NULL, NULL, 1, 'support:helpDoc:delete', 'support:helpDoc:delete', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (202, '更新', 3, 147, 13, NULL, NULL, 1, 'support:helpDoc:update', 'support:helpDoc:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (203, '查询', 3, 143, NULL, NULL, NULL, 1, 'support:loginLog:query', 'support:loginLog:query', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (204, '查询', 3, 81, NULL, NULL, NULL, 1, 'support:operateLog:query', 'support:operateLog:query', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (205, '详情', 3, 81, NULL, NULL, NULL, 1, 'support:operateLog:detail', 'support:operateLog:detail', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (206, '心跳监控', 2, 111, 1, '/support/heart-beat/heart-beat-list', '/support/heart-beat/heart-beat-list.vue', 1, NULL, NULL, 'FallOutlined', NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (207, '更新', 3, 152, NULL, NULL, NULL, 1, 'support:changeLog:update', 'support:changeLog:update', NULL, NULL, 0, NULL, 0, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (212, '查询', 3, 117, NULL, NULL, NULL, 1, 'support:reload:query', 'support:reload:query', NULL, NULL, 0, NULL, 1, 1, 1, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (213, '网络安全', 1, 0, 5, NULL, NULL, 1, NULL, NULL, 'SafetyCertificateOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (214, '登录锁定', 2, 213, 1, '/support/login-fail', '/support/login-fail/login-fail-list.vue', 1, NULL, NULL, 'LockOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (215, '接口加解密', 2, 213, 3, '/support/api-encrypt', '/support/api-encrypt/api-encrypt-index.vue', 1, NULL, NULL, 'CodepenCircleOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (216, '导出', 3, 47, NULL, NULL, NULL, 1, 'goods:exportGoods', 'goods:exportGoods', NULL, NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (217, '导入', 3, 47, 3, NULL, NULL, 1, 'goods:importGoods', 'goods:importGoods', NULL, NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (218, '文档中心', 1, 0, 4, NULL, NULL, 1, NULL, NULL, 'FileSearchOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-20 13:38:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:21', NULL, NULL, NULL);
INSERT INTO `t_menu` (`menu_id`, `menu_name`, `menu_type`, `parent_id`, `sort_value`, `path`, `component`, `perms_type`, `api_perms`, `web_perms`, `icon`, `context_menu_id`, `frame_flag`, `frame_url`, `cache_flag`, `visible_flag`, `disabled_flag`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (219, '定时任务', 2, 50, 8, '/support/job', '/support/job/job-list.vue', 1, NULL, NULL, 'DashboardOutlined', NULL, 0, NULL, 1, 1, 0, NULL, '2024-01-24 22:39:18', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:35:07', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `notice_id` bigint NOT NULL AUTO_INCREMENT,
  `notice_type_id` bigint NOT NULL COMMENT '类型1公告 2动态',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `all_visible_flag` tinyint(1) NOT NULL COMMENT '是否全部可见',
  `scheduled_publish_flag` tinyint(1) NOT NULL COMMENT '是否定时发布',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `content_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文本内容',
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'html内容',
  `attachment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附件',
  `page_view_count` int NOT NULL DEFAULT '0' COMMENT '页面浏览量，传说中的pv',
  `user_view_count` int NOT NULL DEFAULT '0' COMMENT '用户浏览量，传说中的uv',
  `source` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '来源',
  `author` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `document_number` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文号，如：1024创新实验室发〔2022〕字第36号',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知';

-- ----------------------------
-- Records of t_notice
-- ----------------------------
BEGIN;
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (49, 1, 'Spring Boot 3.0.0 首个 RC 发布', 1, 0, '2024-01-01 20:22:23', 'Spring Boot 3.0.0 首个 RC 发布\nSpring Boot 3.0 首个 RC 已发布，此外还为两个分支发布了更新：2.7.5 & 2.6.13。\n3.0.0-RC1\n发布公告写道，此版本包含 135 项功能增强、文档改进、依赖升级和 Bugfix。\nSpring Boot 3.0 的开发工作始于实验性的 Spring Native，旨在为 GraalVM 原生镜像提供支持。在该版本中，开发者现在可以使用标准 Spring Boot Maven 或 Gradle 插件将 Spring Boot 应用程序转换为原生可执行文件，而无需任何特殊配置。\n此版本还在参考文档中添加新内容来解释 AOT 处理背后的概念以及如何开始生成第一个 GraalVM 原生镜像。\n除此之外，Spring Boot 3.0 还完成了迁移到 JakartaEE 9 的工作，以及将使用的 Java 版本升级到 Java 17。\n其他新特性：\n为 Spring Data JDBC 提供更灵活的自动配置为 Prometheus 示例提供自动配置增强 Log4j2 功能，包括配置文件支持和环境属性查找\n详情查看 Release Note。\nSpring Boot 2.7.5 和 2.6.13 的更新内容主要是修复错误，优化文档和升级依赖，详情查看 Release Note (2.7.5、2.6.13)。\n相关链接\nSpring Boot 的详细介绍：点击查看Spring Boot 的下载地址：点击下载', '<h1 style=\"text-indent: 0px; text-align: start;\"><a href=\"https://www.oschina.net/news/214401/spring-boot-3-0-0-rc1-released\" target=\"_blank\">Spring&nbsp;Boot&nbsp;3.0.0&nbsp;首个&nbsp;RC&nbsp;发布</a></h1><p>Spring&nbsp;Boot&nbsp;3.0 首个&nbsp;RC 已发布，此外还为两个分支发布了更新：2.7.5 & 2.6.13。</p><p>3.0.0-RC1</p><p>发布公告写道，此版本包含 135&nbsp;项功能增强、文档改进、依赖升级和&nbsp;Bugfix。</p><p>Spring&nbsp;Boot&nbsp;3.0&nbsp;的开发工作始于实验性的&nbsp;Spring&nbsp;Native，旨在为&nbsp;GraalVM&nbsp;原生镜像提供支持。在该版本中，开发者现在可以使用标准&nbsp;Spring&nbsp;Boot&nbsp;Maven&nbsp;或&nbsp;Gradle&nbsp;插件将&nbsp;Spring&nbsp;Boot&nbsp;应用程序转换为原生可执行文件，而无需任何特殊配置。</p><p>此版本还在参考文档中添加新内容来解释 AOT&nbsp;处理背后的概念以及如何开始生成第一个&nbsp;GraalVM&nbsp;原生镜像。</p><p>除此之外，Spring&nbsp;Boot&nbsp;3.0&nbsp;还完成了迁移到 JakartaEE&nbsp;9&nbsp;的工作，以及将使用的&nbsp;Java&nbsp;版本升级到&nbsp;Java&nbsp;17。</p><p>其他新特性：</p><p>为&nbsp;Spring&nbsp;Data&nbsp;JDBC&nbsp;提供更灵活的自动配置为&nbsp;Prometheus&nbsp;示例提供自动配置增强&nbsp;Log4j2&nbsp;功能，包括配置文件支持和环境属性查找</p><p>详情查看&nbsp;Release&nbsp;Note。</p><p>Spring&nbsp;Boot&nbsp;2.7.5&nbsp;和&nbsp;2.6.13&nbsp;的更新内容主要是修复错误，优化文档和升级依赖，详情查看&nbsp;Release&nbsp;Note&nbsp;(2.7.5、2.6.13)。</p><p>相关链接</p><p>Spring&nbsp;Boot&nbsp;的详细介绍：点击查看Spring&nbsp;Boot&nbsp;的下载地址：点击下载</p>', '', 0, 0, '开源中国', '卓大', NULL, 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (50, 1, 'Oracle 推出 JDK 8 的直接替代品', 1, 0, '2024-01-01 20:22:23', 'Oracle 推出 JDK 8 的直接替代品\n来源: OSCHINA\n编辑: 白开水不加糖\n2022-10-20 08:14:29\n 0\n为了向传统的 Java 8 服务器工作负载提供 Java 17 级别的性能，Oracle 宣布推出 Java SE Subscription Enterprise Performance Pack (Enterprise Performance Pack)。并声称这是 JDK 8 的直接替代品，现已在 MyOracleSupport 上面向所有 Java SE 订阅客户和 Oracle 云基础设施 (OCI) 用户免费提供。\n“Enterprise Performance Pack 为 JDK 8 用户提供了在 JDK 8 和 JDK 17 发布之间的 7 年时间里，为 Java 带来的重大内存管理和性能改进。这些改进包括：现代垃圾回收算法、紧凑字符串、增强的可观察性和数十种其他优化。”\nJava 8 发布于 2014 年，和 Java 17 一样都是长期支持 (LTS) 版本；尽管发布距今已有近九年的历史，但仍被很多开发人员和组织所广泛应用。New Relic 发布的一份 “2022 年 Java 生态系统状况报告” 数据表明，Java 8 仍被 46.45% 的 Java 应用程序在生产中使用。\n根据介绍，Enterprise Performance Pack 在 Intel 和基于 Arm 的系统（如 Ampere Altra）上支持 headless Linux 64 位工作负载。\nOracle 方面称，使用 Enterprise Performance Pack 的客户将可以立即看到以或接近内存或 CPU 容量运行的 JDK 8 工作负载的好处。在 Oracle 自己的产品和云服务进行的测试表明，高负载应用程序的内存和性能都提高了大约 40%。即使没有接近容量运行的 JDK 8 应用程序，也可以会看到高达 5% 的性能提升。\n虽然 Enterprise Performance Pack 中包含的许多改进可以通过默认选项获得，但 Oracle 建议用户还是自己研究文档，以最大限度地提高性能并最大限度地降低内存使用率。例如，通过启用可扩展的低延迟 ZGC 垃圾收集器来提高应用程序响应能力，需要通过 -XX:+UseZGC 选项。', '<h3>Oracle&nbsp;推出&nbsp;JDK&nbsp;8&nbsp;的直接替代品</h3><p>来源:&nbsp;OSCHINA</p><p>编辑: 白开水不加糖</p><p>2022-10-20&nbsp;08:14:29</p><p> 0</p><p>为了向传统的&nbsp;Java&nbsp;8&nbsp;服务器工作负载提供&nbsp;Java&nbsp;17&nbsp;级别的性能，Oracle 宣布推出&nbsp;Java&nbsp;SE&nbsp;Subscription&nbsp;Enterprise&nbsp;Performance&nbsp;Pack&nbsp;(Enterprise&nbsp;Performance&nbsp;Pack)。并声称这是 JDK&nbsp;8&nbsp;的直接替代品，现已在 MyOracleSupport 上面向所有&nbsp;Java&nbsp;SE&nbsp;订阅客户和&nbsp;Oracle&nbsp;云基础设施&nbsp;(OCI)&nbsp;用户免费提供。</p><p>“Enterprise&nbsp;Performance&nbsp;Pack&nbsp;为&nbsp;JDK&nbsp;8&nbsp;用户提供了在&nbsp;JDK&nbsp;8&nbsp;和&nbsp;JDK&nbsp;17&nbsp;发布之间的&nbsp;7&nbsp;年时间里，为&nbsp;Java&nbsp;带来的重大内存管理和性能改进。这些改进包括：现代垃圾回收算法、紧凑字符串、增强的可观察性和数十种其他优化。”</p><p>Java&nbsp;8&nbsp;发布于&nbsp;2014&nbsp;年，和&nbsp;Java&nbsp;17&nbsp;一样都是长期支持&nbsp;(LTS)&nbsp;版本；尽管发布距今已有近九年的历史，但仍被很多开发人员和组织所广泛应用。New&nbsp;Relic&nbsp;发布的一份 “2022&nbsp;年&nbsp;Java&nbsp;生态系统状况报告”&nbsp;数据表明，Java&nbsp;8&nbsp;仍被&nbsp;46.45%&nbsp;的&nbsp;Java&nbsp;应用程序在生产中使用。</p><p>根据介绍，Enterprise&nbsp;Performance&nbsp;Pack&nbsp;在&nbsp;Intel&nbsp;和基于&nbsp;Arm&nbsp;的系统（如&nbsp;Ampere&nbsp;Altra）上支持 headless&nbsp;Linux&nbsp;64&nbsp;位工作负载。</p><p>Oracle 方面称，使用&nbsp;Enterprise&nbsp;Performance&nbsp;Pack&nbsp;的客户将可以立即看到以或接近内存或&nbsp;CPU&nbsp;容量运行的&nbsp;JDK&nbsp;8&nbsp;工作负载的好处。在&nbsp;Oracle&nbsp;自己的产品和云服务进行的测试表明，高负载应用程序的内存和性能都提高了大约&nbsp;40%。即使没有接近容量运行的&nbsp;JDK&nbsp;8&nbsp;应用程序，也可以会看到高达&nbsp;5%&nbsp;的性能提升。</p><p>虽然&nbsp;Enterprise&nbsp;Performance&nbsp;Pack&nbsp;中包含的许多改进可以通过默认选项获得，但 Oracle 建议用户还是自己研究文档，以最大限度地提高性能并最大限度地降低内存使用率。例如，通过启用可扩展的低延迟&nbsp;ZGC&nbsp;垃圾收集器来提高应用程序响应能力，需要通过&nbsp;-XX:+UseZGC&nbsp;选项。</p>', '', 0, 0, 'OSChina', '卓大', NULL, 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (51, 1, 'Spring Framework 6.0.0 RC2 发布', 1, 0, '2024-01-01 20:22:23', 'Spring Framework 6.0.0 RC2 发布\nSpring Framework 6.0.0 发布了第二个 RC 版本。\n新特性\n确保可以在构建时评估 classpath 检查 #29352为 JPA 持久化回调引入 Register 反射提示 #29348检查 @RegisterReflectionForBinding 是否至少指定一个类 #29346为 AOT 引擎设置引入 builder API #29341支持检测正在进行的 AOT 处理 #29340重新组织 HTTP Observation 类型 #29334支持在没有 java.beans.Introspector 的前提下，执行基本属性判断 #29320为BindingReflectionHintsRegistrar 添加 Kotlin 数据类组件支持 #29316将 HttpServiceFactory 和 RSocketServiceProxyFactory 切换到 builder 模型，以便优先进行可编程配置 #29296引入基于 GraalVM FieldValueTransformer API 的 PreComputeFieldFeature#29081在 TestContext 框架中引入 SPI 来处理 ApplicationContext 故障 #28826SimpleEvaluationContext 支持禁用 array 分配 #28808DateTimeFormatterRegistrar 支持默认回退到 ISO 解析 #26985\nSpring Framework 6.0 作为重大更新，要求使用 Java 17 或更高版本，并且已迁移到 Jakarta EE 9+（在 jakarta 命名空间中取代了以前基于 javax 的 EE API），以及对其他基础设施的修改。基于这些变化，Spring Framework 6.0 支持最新 Web 容器，如 Tomcat 10 / Jetty 11，以及最新的持久性框架 Hibernate ORM 6.1。这些特性仅可用于 Servlet API 和 JPA 的 jakarta 命名空间变体。\n值得一提的是，开发者可通过此版本在基于 Spring 的应用中体验 “虚拟线程”（JDK 19 中的预览版 “Project Loom”），查看此文章了解更多细节。现在提供了自定义选项来插入基于虚拟线程的 Executor 实现，目标是在 Project Loom 正式可用时提供 “一等公民” 的配置选项。\n除了上述的变化，Spring Framework 6.0 还包含许多其他改进和特性，例如：\n提供基于 @HttpExchange 服务接口的 HTTP 接口客户端对 RFC 7807 问题详细信息的支持Spring HTTP 客户端提供基于 Micrometer 的可观察性……\n详情查看 Release Note。\n按照发布计划，Spring Framework 6.0 将于 11 月正式 GA。', '<h1 style=\"text-indent: 0px; text-align: start;\"><a href=\"https://www.oschina.net/news/214472/spring-framework-6-0-0-rc2-released\" target=\"_blank\">Spring&nbsp;Framework&nbsp;6.0.0&nbsp;RC2&nbsp;发布</a></h1><p style=\"text-indent: 0px; text-align: left;\">Spring&nbsp;Framework&nbsp;6.0.0&nbsp;发布了<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fspring.io%2Fblog%2F2022%2F10%2F20%2Fspring-framework-6-0-0-rc2-available-now\" target=\"_blank\">第二个&nbsp;RC&nbsp;版本</a>。</p><p style=\"text-indent: 0px; text-align: left;\"><strong>新特性</strong></p><ul style=\"text-indent: 0px; text-align: left;\"><li>确保可以在构建时评估&nbsp;classpath&nbsp;检查&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29352\" target=\"_blank\">#29352</a></li><li>为&nbsp;JPA&nbsp;持久化回调引入&nbsp;Register&nbsp;反射提示&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29348\" target=\"_blank\">#29348</a></li><li>检查&nbsp;<span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>@RegisterReflectionForBinding</code></span>&nbsp;是否至少指定一个类&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29346\" target=\"_blank\">#29346</a></li><li>为&nbsp;AOT&nbsp;引擎设置引入&nbsp;builder&nbsp;API&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29341\" target=\"_blank\">#29341</a></li><li>支持检测正在进行的&nbsp;AOT&nbsp;处理&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29340\" target=\"_blank\">#29340</a></li><li>重新组织&nbsp;HTTP&nbsp;Observation&nbsp;类型&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29334\" target=\"_blank\">#29334</a></li><li>支持在没有&nbsp;java.beans.Introspector&nbsp;的前提下，执行基本属性判断&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29320\" target=\"_blank\">#29320</a></li><li>为<span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>BindingReflectionHintsRegistrar</code></span>&nbsp;添加&nbsp;Kotlin&nbsp;数据类组件支持&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29316\" target=\"_blank\">#29316</a></li><li>将&nbsp;HttpServiceFactory&nbsp;和&nbsp;RSocketServiceProxyFactory&nbsp;切换到&nbsp;builder&nbsp;模型，以便优先进行可编程配置&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29296\" target=\"_blank\">#29296</a></li><li>引入基于&nbsp;GraalVM&nbsp;<span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>FieldValueTransformer</code></span>&nbsp;API&nbsp;的&nbsp;<span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>PreComputeFieldFeature</code></span><a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F29081\" target=\"_blank\">#29081</a></li><li>在&nbsp;TestContext&nbsp;框架中引入&nbsp;SPI&nbsp;来处理&nbsp;ApplicationContext&nbsp;故障&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F28826\" target=\"_blank\">#28826</a></li><li>SimpleEvaluationContext&nbsp;支持禁用&nbsp;array&nbsp;分配&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F28808\" target=\"_blank\">#28808</a></li><li>DateTimeFormatterRegistrar&nbsp;支持默认回退到&nbsp;ISO&nbsp;解析&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Fissues%2F26985\" target=\"_blank\">#26985</a></li></ul><p style=\"text-indent: 0px; text-align: left;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">Spring&nbsp;Framework&nbsp;6.0&nbsp;作为重大更新，要求</span><span style=\"color: rgb(51, 51, 51);\"><strong>使用&nbsp;Java&nbsp;17&nbsp;或更高版本</strong></span><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">，并且已迁移到&nbsp;Jakarta&nbsp;EE&nbsp;9+（在&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>jakarta</code></span><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">&nbsp;命名空间中取代了以前基于&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>javax</code></span><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">&nbsp;的&nbsp;EE&nbsp;API），以及对其他基础设施的修改。基于这些变化，Spring&nbsp;Framework&nbsp;6.0&nbsp;支持最新&nbsp;Web&nbsp;容器，如&nbsp;</span><a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Ftomcat.apache.org%2Fwhichversion.html\" target=\"_blank\">Tomcat&nbsp;10</a><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">&nbsp;/&nbsp;</span><a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fwww.eclipse.org%2Fjetty%2Fdownload.php\" target=\"_blank\">Jetty&nbsp;11</a><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">，以及最新的持久性框架&nbsp;</span><a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fhibernate.org%2Form%2Freleases%2F6.1%2F\" target=\"_blank\">Hibernate&nbsp;ORM&nbsp;6.1</a><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">。这些特性仅可用于&nbsp;Servlet&nbsp;API&nbsp;和&nbsp;JPA&nbsp;的&nbsp;jakarta&nbsp;命名空间变体。</span></p><p style=\"text-indent: 0px; text-align: left;\">值得一提的是，开发者可通过此版本在基于&nbsp;Spring&nbsp;的应用中体验&nbsp;“虚拟线程”（JDK&nbsp;19&nbsp;中的预览版&nbsp;“Project&nbsp;Loom”），<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fspring.io%2Fblog%2F2022%2F10%2F11%2Fembracing-virtual-threads\" target=\"_blank\">查看此文章</a>了解更多细节。现在提供了自定义选项来插入基于虚拟线程的&nbsp;<span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>Executor</code></span>&nbsp;实现，目标是在&nbsp;Project&nbsp;Loom&nbsp;正式可用时提供&nbsp;“一等公民”&nbsp;的配置选项。</p><p style=\"text-indent: 0px; text-align: left;\">除了上述的变化，Spring&nbsp;Framework&nbsp;6.0&nbsp;还包含许多其他改进和特性，例如：</p><ul style=\"text-indent: 0px; text-align: left;\"><li>提供基于&nbsp;<span style=\"color: rgb(51, 51, 51); font-size: 13px;\"><code>@HttpExchange</code></span>&nbsp;服务接口的&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fdocs.spring.io%2Fspring-framework%2Fdocs%2F6.0.0-RC1%2Freference%2Fhtml%2Fintegration.html%23rest-http-interface\" target=\"_blank\">HTTP&nbsp;接口客户端</a></li><li>对&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fdocs.spring.io%2Fspring-framework%2Fdocs%2F6.0.0-RC1%2Freference%2Fhtml%2Fweb.html%23mvc-ann-rest-exceptions\" target=\"_blank\">RFC&nbsp;7807&nbsp;问题详细信息</a>的支持</li><li>Spring&nbsp;HTTP&nbsp;客户端提供基于&nbsp;Micrometer&nbsp;的可观察性</li><li>……</li></ul><p style=\"text-indent: 0px; text-align: left;\"><a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fspring-projects%2Fspring-framework%2Freleases%2Ftag%2Fv6.0.0-RC2\" target=\"_blank\">详情查看&nbsp;Release&nbsp;Note</a>。</p><p style=\"text-indent: 0px; text-align: left;\">按照发布计划，Spring&nbsp;Framework&nbsp;6.0&nbsp;将于&nbsp;11&nbsp;月正式&nbsp;GA。</p>', '', 0, 0, 'CSDN', '罗伊', NULL, 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (52, 1, 'Windows Terminal 正式成为 Windows 11 默认终端', 1, 0, '2024-01-01 20:22:23', '今年 7 月 ，微软在 Windows 11 的 Beta 版本测试了将系统默认终端设置为 Windows Terminal 。如今该设置已登录稳定版本，从 Windows 11 22H2 版本开始，Windows Terminal 将正式成为 Windows 11 的默认设置。\n默认终端是在打开命令行应用程序时默认启动的终端模拟器。从 Windows 诞生之日起，其默认终端一直是 Windows 控制台主机 conhost.exe。此次更新则意味着，以后 Windows 11 的所有命令行应用程序都将在 Windows Terminal 中自动打开。\nWindows Terminal 拥有非常多现代化的功能，毕竟它很新（ 2019 年 5 月在 Microsoft Build 上首次发布），吸取了很多现代终端的灵感。它支持多选项卡和窗格、命令面板等现代化的 UI 和操作方式，以及大量的自定义选项，比如目录、配置文件图标、自定义背景图像、配色方案、字体和透明度。\n当然，如果不想用 Windows Terminal，用户也可以在 Windows 设置中的 隐私和安全 > 开发人员页面和 Windows 终端设置 中调整默认终端设置，（此更新使用 “让 Windows 决定” 作为默认选择，即默认采用 Windows Terminal） 。\n此外，如果在更新之前就已设置其他默认终端，此次更新不会覆盖你的偏好。\n关于 Windows 11 默认终端的更多详情可查看微软博客。', '<p style=\"text-indent: 0px; text-align: left;\">今年&nbsp;7&nbsp;月&nbsp;，微软在&nbsp;Windows&nbsp;11&nbsp;的&nbsp;Beta&nbsp;版本<a href=\"https://www.oschina.net/news/204429/wt-default-terminal-in-win11-beta-channel\" target=\"\">测试</a>了将系统默认终端设置为&nbsp;Windows&nbsp;Terminal&nbsp;。如今该设置已登录稳定版本，从&nbsp;Windows&nbsp;11&nbsp;22H2&nbsp;版本开始，Windows&nbsp;Terminal&nbsp;将<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fdevblogs.microsoft.com%2Fcommandline%2Fwindows-terminal-is-now-the-default-in-windows-11%2F\" target=\"_blank\">正式成为</a>&nbsp;Windows&nbsp;11&nbsp;的默认设置。</p><p style=\"text-indent: 0px; text-align: left;\">默认终端是在打开命令行应用程序时默认启动的终端模拟器。从&nbsp;Windows&nbsp;诞生之日起，其默认终端一直是&nbsp;Windows&nbsp;控制台主机&nbsp;conhost.exe。此次更新则意味着，以后&nbsp;Windows&nbsp;11&nbsp;的所有命令行应用程序都将在&nbsp;Windows&nbsp;Terminal&nbsp;中自动打开。</p><p style=\"text-indent: 0px; text-align: left;\">Windows&nbsp;Terminal&nbsp;拥有非常多现代化的功能，毕竟它<span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);\">很新（&nbsp;2019&nbsp;年&nbsp;5&nbsp;月在&nbsp;Microsoft&nbsp;Build&nbsp;上首次发布），吸取了很多现代终端的灵感。它支持多</span>选项卡和窗格、命令面板等现代化的&nbsp;UI&nbsp;和操作方式，以及大量的自定义选项，比如目录、配置文件图标、自定义背景图像、配色方案、字体和透明度。</p><p style=\"text-indent: 0px; text-align: left;\">当然，如果不想用&nbsp;Windows&nbsp;Terminal，用户也可以在&nbsp;Windows&nbsp;设置中的&nbsp;<em>隐私和安全&nbsp;&gt;&nbsp;开发人员页面和&nbsp;Windows&nbsp;终端设置&nbsp;</em>中调整默认终端设置，（此更新使用&nbsp;“让&nbsp;Windows&nbsp;决定”&nbsp;作为默认选择，即默认采用&nbsp;Windows&nbsp;Terminal）&nbsp;。</p><p style=\"text-indent: 0px; text-align: left;\">此外，如果在更新之前就已设置其他默认终端，此次更新<strong>不会覆盖</strong>你的偏好。</p><p style=\"text-indent: 0px; text-align: left;\">关于&nbsp;Windows&nbsp;11&nbsp;默认终端的更多详情可查看<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fdevblogs.microsoft.com%2Fcommandline%2Fwindows-terminal-is-now-the-default-in-windows-11%2F\" target=\"_blank\">微软博客</a>。</p>', '', 0, 0, '开源中国', '善逸', NULL, 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (53, 1, 'TypeScript 诞生 10 周年', 1, 0, '2024-01-01 20:22:23', 'TypeScript 已经诞生 10 年了。10 年前 ——2012 年 10 月 1 日，TypeScript 首次公开亮相。当时主导 TypeScript 开发的 Anders Hejlsberg 这样描述 TypeScript：\n它是 JavaScript 的类型化超集，可被编译成常用的 JavaScript。TypeScript 还可以通过启用丰富的工具体验来极大地帮助提升生产力，与此同时开发者保持不变维护现有的代码，并继续使用喜爱的 JavaScript 库。TypeScript is a typed superset of JavaScript that compiles to idiomatic (normal) JavaScript, can dramatically improve your productivity by enabling rich tooling experiences, all while maintaining your existing code and continuing to use the same JavaScript libraries you already love.\n微软在博客中回顾了 TypeScript 刚亮相时受到的评价，大多数人对它都是持怀疑态度，毕竟这对于许多 JavaScript 开发者来说，试图将静态类型引入 JavaScript 是一个笑话 —— 或是邪恶的阴谋。反对者则直言这是十分愚蠢的想法，他们认为当时已存在可以编译为 JavaScript 的强类型语言，例如 C#、Java 和 C++。他们还吐槽主导 TypeScript 开发的 Anders Hejlsberg 对静态类型有 “迷之执着”。\n当时微软意识到 JavaScript 未来将会被应用到无数场景，而且他们公司内部团队在处理复杂的 JavaScript 代码库时面临着巨大的挑战，所以他们觉得有必要创造强大的工具来帮助编写 JavaScript—— 尤其是针对大型 JavaScript 项目。基于此需求，TypeScript 也确定了自己的定位和特性，它是 JavaScript 的超集，将类型检查和静态分析、显式接口和最佳实践结合到单一语言和编译器中。通过在 JavaScript 上构建，TypeScript 能够更接近目标运行时，同时仅添加支持大型应用程序和大型团队所需的语法糖。\n团队还坚持 TypeScript 要能够与现有的 JavaScript 无缝交互，与 JavaScript 共同进化，并且看上去也和 JavaScript 类似。\nTypeScript 诞生之初的部分设计目标：\n不会对已有的程序增加运行时开销与当前和未来的 ECMAScript 提案保持一致保留所有 JavaScript 代码的运行时行为避免添加表达式类型的语法 (expression-level syntax)使用一致、完全可擦除的结构化类型系统……\n这些目标指导着 TypeScript 的发展方向：关注类型系统，成为 JavaScript 的类型检查器，只添加类型检查所需的语法，避免添加新的运行时语法和行为。\n微软提到，TypeScript 拥有如今的繁荣生态离不开一个重要属性：开源。TypeScript 一开始就是免费且开源 —— 语言规范和编译器都是开源项目，并且以真正开放的方式来运作。事实上，微软当时对外展现出的姿态并不是现在的 “拥抱开源”，所以他们内部并没真正认识到 TypeScript 的开源是如何帮助它走向成功。因此有人认为，TypeScript 在很大程度上引导微软开始更多地转向开源。\n现在，TypeScript 仍在积极发展和迭代改进，并被全球数百万开发者使用。在诸多编程语言排名、指数或开发者调查中，TypeScript 一直位居前列，也是最受欢迎和最常用的编程语言。', '<p style=\"text-indent: 0px; text-align: start;\">TypeScript&nbsp;已经诞生&nbsp;10&nbsp;年了。10&nbsp;年前&nbsp;——2012&nbsp;年&nbsp;10&nbsp;月&nbsp;1&nbsp;日，TypeScript&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fweb.archive.org%2Fweb%2F20121003001910%2Fhttps%3A%2F%2Fblogs.msdn.com%2Fb%2Fsomasegar%2Farchive%2F2012%2F10%2F01%2Ftypescript-javascript-development-at-application-scale.aspx\" target=\"_blank\"><strong>首次公开亮相</strong></a>。当时主导&nbsp;TypeScript&nbsp;开发的&nbsp;Anders&nbsp;Hejlsberg&nbsp;这样描述&nbsp;TypeScript：</p><blockquote style=\"text-indent: 0px; text-align: left;\">它是&nbsp;JavaScript&nbsp;的类型化超集，可被编译成常用的&nbsp;JavaScript。TypeScript&nbsp;还可以通过启用丰富的工具体验来极大地帮助提升生产力，与此同时开发者保持不变维护现有的代码，并继续使用喜爱的&nbsp;JavaScript&nbsp;库。TypeScript&nbsp;is&nbsp;a&nbsp;typed&nbsp;superset&nbsp;of&nbsp;JavaScript&nbsp;that&nbsp;compiles&nbsp;to&nbsp;idiomatic&nbsp;(normal)&nbsp;JavaScript,&nbsp;can&nbsp;dramatically&nbsp;improve&nbsp;your&nbsp;productivity&nbsp;by&nbsp;enabling&nbsp;rich&nbsp;tooling&nbsp;experiences,&nbsp;all&nbsp;while&nbsp;maintaining&nbsp;your&nbsp;existing&nbsp;code&nbsp;and&nbsp;continuing&nbsp;to&nbsp;use&nbsp;the&nbsp;same&nbsp;JavaScript&nbsp;libraries&nbsp;you&nbsp;already&nbsp;love.</blockquote><p style=\"text-indent: 0px; text-align: left;\">微软在博客中回顾了&nbsp;TypeScript&nbsp;刚亮相时受到的评价，大多数人对它都是持怀疑态度，毕竟这对于许多&nbsp;JavaScript&nbsp;开发者来说，试图将静态类型引入&nbsp;JavaScript&nbsp;是一个笑话&nbsp;——&nbsp;或是邪恶的阴谋。反对者则直言这是十分愚蠢的想法，他们认为当时已存在可以编译为&nbsp;JavaScript&nbsp;的强类型语言，例如&nbsp;C#、Java&nbsp;和&nbsp;C++。他们还吐槽主导&nbsp;TypeScript&nbsp;开发的&nbsp;Anders&nbsp;Hejlsberg&nbsp;对静态类型有&nbsp;“迷之执着”。</p><p style=\"text-indent: 0px; text-align: start;\">当时微软意识到&nbsp;JavaScript&nbsp;未来将会被应用到无数场景，而且他们公司内部团队在处理复杂的&nbsp;JavaScript&nbsp;代码库时面临着巨大的挑战，所以他们觉得有必要创造强大的工具来帮助编写&nbsp;JavaScript——&nbsp;尤其是针对大型&nbsp;JavaScript&nbsp;项目。基于此需求，TypeScript&nbsp;也确定了自己的定位和特性，它是&nbsp;JavaScript&nbsp;的超集，将类型检查和静态分析、显式接口和最佳实践结合到单一语言和编译器中。通过在&nbsp;JavaScript&nbsp;上构建，TypeScript&nbsp;能够更接近目标运行时，同时仅添加支持大型应用程序和大型团队所需的语法糖。</p><p style=\"text-indent: 0px; text-align: start;\">团队还坚持&nbsp;TypeScript&nbsp;要能够与现有的&nbsp;JavaScript&nbsp;无缝交互，与&nbsp;JavaScript&nbsp;共同进化，并且看上去也和&nbsp;JavaScript&nbsp;类似。</p><p style=\"text-indent: 0px; text-align: start;\">TypeScript&nbsp;诞生之初的部分<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fgithub.com%2Fmicrosoft%2FTypeScript%2Fwiki%2FTypeScript-Design-Goals%2F53ffa9b1802cd8e18dfe4b2cd4e9ef5d4182df10\" target=\"_blank\"><strong>设计目标</strong></a>：</p><ul style=\"text-indent: 0px; text-align: left;\"><li>不会对已有的程序增加运行时开销</li><li>与当前和未来的&nbsp;ECMAScript&nbsp;提案保持一致</li><li>保留所有&nbsp;JavaScript&nbsp;代码的运行时行为</li><li>避免添加表达式类型的语法&nbsp;(expression-level&nbsp;syntax)</li><li>使用一致、完全可擦除的结构化类型系统</li><li>……</li></ul><p style=\"text-indent: 0px; text-align: start;\">这些目标指导着&nbsp;TypeScript&nbsp;的发展方向：关注类型系统，成为&nbsp;JavaScript&nbsp;的类型检查器，只添加类型检查所需的语法，避免添加新的运行时语法和行为。</p><p style=\"text-indent: 0px; text-align: start;\">微软提到，TypeScript&nbsp;拥有如今的繁荣生态离不开一个重要属性：<strong>开源</strong>。TypeScript&nbsp;一开始就是免费且开源&nbsp;——<span style=\"color: rgb(51, 51, 51);\">&nbsp;语言规范和编译器都是开源项目，</span>并且以真正开放的方式来运作。事实上，微软当时对外展现出的姿态并不是现在的&nbsp;“拥抱开源”，所以他们内部并没真正认识到&nbsp;TypeScript&nbsp;的开源是如何帮助它走向成功。因此有人认为，TypeScript&nbsp;在很大程度上引导微软开始更多地转向开源。</p><p style=\"text-indent: 0px; text-align: start;\">现在，TypeScript&nbsp;仍在积极发展和迭代改进，并被全球数百万开发者使用。在诸多编程语言排名、指数或开发者调查中，TypeScript&nbsp;一直位居前列，也是最受欢迎和最常用的编程语言。</p>', '', 0, 0, '开源中国', '开云', NULL, 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (54, 1, 'JetBrains Fleet 公测，下一代 IDE', 1, 0, '2024-01-01 20:22:23', 'JetBrains 宣布首次公共预览 Fleet，所有人都可以使用。Fleet 是由 JetBrains 打造的下一代 IDE，于 2021 年首次正式推出。它是一个新的分布式多语言编辑器和 IDE，基于 JetBrains 在后端的 IntelliJ 平台，采用了全新的用户界面和分布式架构从头开始构建。\n下载 Fleet：https://www.jetbrains.com.cn/fleet/download/\n\n公告表示，自从最初宣布 Fleet 以来，有超过 137,000 人报名参加私人预览；官方最初之所以决定从封闭式预览开始，是为了能够以渐进的方式处理反馈。现如今，JetBrains Fleet 仍处于起步阶段，还有大量的工作要做。其向公众开放预览的原因有两个方面：“首先，我们认为让所有注册者再等下去是不对的，但单独邀请这么多人对我们来说也缺乏意义。面向公众开放预览对我们来说更容易。第二，也是最重要的，我们一直是一家以开放态度打造产品的公司。我们不希望 Fleet 在这方面有任何不同。”\nJetBrains 方面提供了一个图表，以显示 Fleet 目前提供支持的语言和技术，以及每个技术的状态。但值得注意的是，Fleet 仍处于早期阶段，有些事情可能无法按预期工作；所以即使有些东西被列为受支持的，也有可能存在问题。\n同时 JetBrains 也强调称，他们并不打算取代其现有的 IDE。\n因此，请不要期望在 Fleet 中看到与我们的 IDE（如 IntelliJ IDEA）完全相同的功能。尽管我们会继续开发 Fleet，我们 IDE 的所有功能也不会出现在其中。Fleet 是我们为开发者提供不同用户体验的一个机会。话虽如此，我们确实希望听到你认为 Fleet 还缺少什么功能的反馈，例如特定的重构选项、工具集成等。我们现有的 IDE 将继续发展。我们对其有很多计划，包括性能改进、新的用户界面、远程开发等等。最后，Fleet 还在底层采用了我们现有工具的智慧，所以这些工具都不会消失。\nJetBrains 透露，在未来几个月他们将致力于稳定 Fleet，并尽可能地解决得到的反馈。同时，将在以下领域开展工作：\n为插件作者提供 API 支持和 SDK–鉴于 Fleet 有一个分布式架构，我们需要努力为插件作者简化工作。 虽然我们保证会为扩展 Fleet 提供一个平台，但也请求大家在这方面多一点耐心。 性能 – 我们希望 Fleet 不仅在内存占用方面，而且在响应时间方面都能表现出色。 有很多地方我们仍然可以提高性能，我们将在这些方面努力。 主题和键盘地图 – 我们知道许多开发者已经习惯了他们现有的编辑器和 IDE，当他们转移到新的 IDE 时，往往会想念他们以前的键盘绑定和主题。 我们将致力于增加对更多主题和键盘映射的支持。 我们当然也会致力于 Vim 的模拟。\n更多详情可查看官方博客。', '<p style=\"text-indent: 0px; text-align: left;\">JetBrains&nbsp;<a href=\"https://my.oschina.net/u/5494143/blog/5584325\" target=\"\">宣布</a>首次公共预览&nbsp;<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fwww.jetbrains.com.cn%2Ffleet%2F\" target=\"_blank\">Fleet</a>，所有人都可以使用。Fleet&nbsp;是由&nbsp;JetBrains&nbsp;打造的下一代&nbsp;IDE，于&nbsp;2021&nbsp;年首次正式<a href=\"https://my.oschina.net/u/5494143/blog/5332934\" target=\"\">推出</a>。它是一个新的分布式多语言编辑器和&nbsp;IDE，基于&nbsp;JetBrains&nbsp;在后端的&nbsp;IntelliJ&nbsp;平台，采用了全新的用户界面和分布式架构从头开始构建。</p><p style=\"text-indent: 0px; text-align: left;\"><strong>下载&nbsp;Fleet：</strong><a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fwww.jetbrains.com.cn%2Ffleet%2Fdownload%2F\" target=\"_blank\">https://www.jetbrains.com.cn/fleet/download/</a></p><p style=\"text-indent: 0px; text-align: left;\"><br></p><p style=\"text-indent: 0px; text-align: left;\">公告表示，自从最初宣布&nbsp;Fleet&nbsp;以来，有超过&nbsp;137,000&nbsp;人报名参加私人预览；官方最初之所以决定从封闭式预览开始，是为了能够以渐进的方式处理反馈。现如今，JetBrains&nbsp;Fleet&nbsp;仍处于起步阶段，还有大量的工作要做。其向公众开放预览的原因有两个方面：“首先，我们认为让所有注册者再等下去是不对的，但单独邀请这么多人对我们来说也缺乏意义。面向公众开放预览对我们来说更容易。第二，也是最重要的，我们一直是一家以开放态度打造产品的公司。我们不希望&nbsp;Fleet&nbsp;在这方面有任何不同。”</p><p style=\"text-indent: 0px; text-align: left;\">JetBrains&nbsp;方面提供了一个<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fjb.gg%2Ffleet-feature-matrix\" target=\"_blank\">图表</a>，以显示&nbsp;Fleet&nbsp;目前提供支持的语言和技术，以及每个技术的状态。但值得注意的是，Fleet&nbsp;仍处于早期阶段，有些事情可能无法按预期工作；所以即使有些东西被列为受支持的，也有可能存在问题。</p><p style=\"text-indent: 0px; text-align: left;\">同时&nbsp;JetBrains&nbsp;也强调称，他们并不打算取代其现有的&nbsp;IDE。</p><blockquote style=\"text-indent: 0px; text-align: left;\">因此，请不要期望在&nbsp;Fleet&nbsp;中看到与我们的&nbsp;IDE（如&nbsp;IntelliJ&nbsp;IDEA）完全相同的功能。尽管我们会继续开发&nbsp;Fleet，我们&nbsp;IDE&nbsp;的所有功能也不会出现在其中。Fleet&nbsp;是我们为开发者提供不同用户体验的一个机会。话虽如此，我们确实希望听到你认为&nbsp;Fleet&nbsp;还缺少什么功能的反馈，例如特定的重构选项、工具集成等。我们现有的&nbsp;IDE&nbsp;将继续发展。我们对其有很多计划，包括性能改进、新的用户界面、远程开发等等。最后，Fleet&nbsp;还在底层采用了我们现有工具的智慧，所以这些工具都不会消失。</blockquote><p style=\"text-indent: 0px; text-align: start;\">JetBrains&nbsp;透露，在未来几个月他们将致力于稳定&nbsp;Fleet，并尽可能地解决得到的反馈。同时，将在以下领域开展工作：</p><ul style=\"text-indent: 0px; text-align: left;\"><li><strong>为插件作者提供&nbsp;API&nbsp;支持和&nbsp;SDK</strong>–鉴于&nbsp;Fleet&nbsp;有一个<a href=\"https://www.oschina.net/action/GoToLink?url=https%3A%2F%2Fblog.jetbrains.com%2Fzh-hans%2Ffleet%2F2022%2F01%2Ffleet-below-deck-part-i-architecture-overview%2F\" target=\"_blank\">分布式架构</a>，我们需要努力为插件作者简化工作。&nbsp;虽然我们保证会为扩展&nbsp;Fleet&nbsp;提供一个平台，但也请求大家在这方面多一点耐心。&nbsp;</li><li><strong>性能</strong>&nbsp;–&nbsp;我们希望&nbsp;Fleet&nbsp;不仅在内存占用方面，而且在响应时间方面都能表现出色。&nbsp;有很多地方我们仍然可以提高性能，我们将在这些方面努力。&nbsp;</li><li><strong>主题和键盘地图</strong>&nbsp;–&nbsp;我们知道许多开发者已经习惯了他们现有的编辑器和&nbsp;IDE，当他们转移到新的&nbsp;IDE&nbsp;时，往往会想念他们以前的键盘绑定和主题。&nbsp;我们将致力于增加对更多主题和键盘映射的支持。&nbsp;我们当然也会致力于&nbsp;Vim&nbsp;的模拟。</li></ul><p style=\"text-indent: 0px; text-align: left;\">更多详情可<a href=\"https://my.oschina.net/u/5494143/blog/5584325\" target=\"\">查看官方博客</a>。</p>', '', 0, 0, 'CSDN', '开云', NULL, 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (55, 2, '1024创新实验室 十一放假通知', 1, 0, '2024-01-01 20:22:23', '国庆假期即将来临，根据国务院办公厅关于国庆节的放假安排，废纸信息网安排如下：10月1日至7日放假调休，共7天。\n衷心预祝\n国庆快乐，阖家幸福！', '<p style=\"text-indent: 0px; text-align: justify;\">国庆假期即将来临，根据国务院办公厅关于国庆节的放假安排，废纸信息网安排如下：<strong>10月1日至7日放假调休</strong>，共7天。</p><p style=\"text-indent: 0px; text-align: justify;\"><strong>衷心预祝</strong></p><p style=\"text-indent: 0px; text-align: justify;\"><strong>国庆快乐，阖家幸福！</strong></p>', '', 0, 0, '人力行政部', '卓大', '1024创新实验室发〔2022〕字第36号', 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (56, 2, '十月份技术分享会议', 1, 0, '2024-01-01 20:22:23', '尊敬的各位技术大佬：\n1024创新实验室技术分享即将隆重举行\n现将有关会议事宜通知如下：\n一、会议内容\n1、研究探讨SmartAdmin的技术体系\n二、会议形式\n大会专题小会分组讨论;\n三、会议时间及地点\n会议报到时间：xxx1年6月14日\n会议报到地点：洛阳市', '<p style=\"text-indent: 0px; text-align: start;\">尊敬的各位技术大佬：</p><p style=\"text-indent: 0px; text-align: start;\">1024创新实验室技术分享即将隆重举行</p><p style=\"text-indent: 0px; text-align: start;\">现将有关会议事宜通知如下：</p><p style=\"text-indent: 0px; text-align: start;\"><strong>一、会议内容</strong></p><p style=\"text-indent: 0px; text-align: start;\">1、研究探讨SmartAdmin的技术体系</p><p style=\"text-indent: 0px; text-align: start;\"><strong>二、会议形式</strong></p><p style=\"text-indent: 0px; text-align: start;\">大会专题小会分组讨论;</p><p style=\"text-indent: 0px; text-align: start;\"><strong>三、会议时间及地点</strong></p><p style=\"text-indent: 0px; text-align: start;\">会议报到时间：xxx1年6月14日</p><p style=\"text-indent: 0px; text-align: start;\">会议报到地点：洛阳市</p>', '', 0, 0, '技术部', '开云', '1024创新实验室发〔2022〕字第33号', 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (57, 2, '关于疫情防控上班通知', 1, 0, '2024-01-01 20:22:23', '近期，国内部分地区疫情频发，多地疫情出现外溢，为有效降低我市疫情输入和传播风险，洛阳市疾病预防控制中心发布疫情防控公众提示：\n一、所有入（返）洛阳人员均需提前3天向目的地社区（村居）、酒店宾馆、接待单位等所属网格进行报备，或通过“洛阳即时通系统”进行自主报备，配合做好健康码和行程码查验、核酸检测、隔离观察和健康监测等相关疫情防控措施。\n二、倡导广大群众减少跨地市出行，避免人群大范围流动引发的疫情传播扩散风险。\n三、对7天内有高风险区旅居史的人员，采取7天集中隔离医学观察；对7天内有中风险区旅居史的人员，采取7天居家隔离医学观察，如不具备居家隔离医学观察条件的，采取集中隔离医学观察。\n四、对疫情发生地出现一定范围社区传播或已实施大范围社区管控措施，基于对疫情输入风险研判结果，对近7天内来自疫情发生地所在县（市、区）的流入人员，参照中风险区旅居史人员的防控要求采取相应措施。\n五、对所有省外入（返）洛阳人员，须持有48小时内核酸检测阴性证明，抵达后进行“5天3检”，每次检测间隔24小时。推广“落地检”，按照“自愿免费即采即走，不限制流动”的原则，抵达我市后，立即进行1次核酸检测。\n六、加强重点机构场所疫情防控，坚持非必要不举办，对确需举办的培训、会展、文艺演出等大型聚集性活动，查验48小时内核酸检测阴性证明；建筑工地等人员密集型单位，查验外省（区、市）返岗人员48小时内核酸检测阴性证明；养老机构、儿童福利机构等查验探访人员48小时内核酸检测阴性证明；对进入宾馆、酒店和旅游景区等人流密集场所时，查验48小时内核酸检测阴性证明。\n七、近期有外出旅行史的人员，请密切关注疫情发生地区公布的病例和无症状感染者流调轨迹信息和中高风险区信息。有涉疫风险的人员要立即向社区（村）、住宿宾馆和单位报告，配合落实隔离医学观察。\n八、发热病人、健康码“黄码”等人员要履行个人防护责任，主动配合健康监测和核酸检测，在未排除感染风险前不出行。\n', '<p style=\"text-indent: 0px; text-align: justify;\">近期，国内部分地区疫情频发，多地疫情出现外溢，为有效降低我市疫情输入和传播风险，洛阳市疾病预防控制中心发布疫情防控公众提示：</p><p style=\"text-indent: 0px; text-align: justify;\">一、所有入（返）洛阳人员均需提前3天向目的地社区（村居）、酒店宾馆、接待单位等所属网格进行报备，或通过“洛阳即时通系统”进行自主报备，配合做好健康码和行程码查验、核酸检测、隔离观察和健康监测等相关疫情防控措施。</p><p style=\"text-indent: 0px; text-align: justify;\">二、倡导广大群众减少跨地市出行，避免人群大范围流动引发的疫情传播扩散风险。</p><p style=\"text-indent: 0px; text-align: justify;\">三、对7天内有高风险区旅居史的人员，采取7天集中隔离医学观察；对7天内有中风险区旅居史的人员，采取7天居家隔离医学观察，如不具备居家隔离医学观察条件的，采取集中隔离医学观察。</p><p style=\"text-indent: 0px; text-align: justify;\">四、对疫情发生地出现一定范围社区传播或已实施大范围社区管控措施，基于对疫情输入风险研判结果，对近7天内来自疫情发生地所在县（市、区）的流入人员，参照中风险区旅居史人员的防控要求采取相应措施。</p><p style=\"text-indent: 0px; text-align: justify;\">五、对所有省外入（返）洛阳人员，须持有48小时内核酸检测阴性证明，抵达后进行“5天3检”，每次检测间隔24小时。推广“落地检”，按照“自愿免费即采即走，不限制流动”的原则，抵达我市后，立即进行1次核酸检测。</p><p style=\"text-indent: 0px; text-align: justify;\">六、加强重点机构场所疫情防控，坚持非必要不举办，对确需举办的培训、会展、文艺演出等大型聚集性活动，查验48小时内核酸检测阴性证明；建筑工地等人员密集型单位，查验外省（区、市）返岗人员48小时内核酸检测阴性证明；养老机构、儿童福利机构等查验探访人员48小时内核酸检测阴性证明；对进入宾馆、酒店和旅游景区等人流密集场所时，查验48小时内核酸检测阴性证明。</p><p style=\"text-indent: 0px; text-align: justify;\">七、近期有外出旅行史的人员，请密切关注疫情发生地区公布的病例和无症状感染者流调轨迹信息和中高风险区信息。有涉疫风险的人员要立即向社区（村）、住宿宾馆和单位报告，配合落实隔离医学观察。</p><p style=\"text-indent: 0px; text-align: justify;\">八、发热病人、健康码“黄码”等人员要履行个人防护责任，主动配合健康监测和核酸检测，在未排除感染风险前不出行。</p><p style=\"text-indent: 0px; text-align: justify;\"><br></p>', '', 0, 0, '行政部', '卓大', '1024创新实验室发〔2022〕字第40号', 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (58, 2, '办公室消杀关键位置通知', 1, 0, '2024-01-01 20:22:23', '开展消毒消杀是杀灭病源、切断疫情传播的有效手段，是防控疫情的重要措施。为了切实将新型冠状病毒肺炎疫情防控工作落到实处，守护好辖区居民及工作人员的身体健康和生命安全，青山镇高度重视新型冠状病毒肺炎的消杀工作，将采购的防护服，防护面罩，一次性手套，口罩，84消毒液，酒精消毒液以及喷雾工具等消毒消杀物资，分发到镇级各站所各村（社区），全镇开展消杀工作。', '<p><span style=\"color: rgb(93, 93, 93); background-color: rgb(247, 247, 247);\">开展消毒消杀是杀灭病源、切断疫情传播的有效手段，是防控疫情的重要措施。为了切实将新型冠状病毒肺炎疫情防控工作落到实处，守护好辖区居民及工作人员的身体健康和生命安全，青山镇高度重视新型冠状病毒肺炎的消杀工作，将采购的防护服，防护面罩，一次性手套，口罩，84消毒液，酒精消毒液以及喷雾工具等消毒消杀物资，分发到镇级各站所各村（社区），全镇开展消杀工作。</span></p>', '', 0, 0, '行政部', '卓大', '1024创新实验室发〔2022〕字第26号', 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (59, 2, '十月份人事任命通知', 1, 0, '2024-01-01 20:22:23', '1024创新实验室发〔2022〕字第36号\n1024创新实验室发〔2022〕字第36号\n1024创新实验室发〔2022〕字第36号\n1024创新实验室发〔2022〕字第36号\n1024创新实验室发〔2022〕字第36号\n1024创新实验室发〔2022〕字第36号', '<p>1024创新实验室发〔2022〕字第36号</p><p>1024创新实验室发〔2022〕字第36号</p><p>1024创新实验室发〔2022〕字第36号</p><p>1024创新实验室发〔2022〕字第36号</p><p>1024创新实验室发〔2022〕字第36号</p><p>1024创新实验室发〔2022〕字第36号</p>', '', 0, 0, '销售部', '卓大', '1024创新实验室发〔2022〕字第30号', 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
INSERT INTO `t_notice` (`notice_id`, `notice_type_id`, `title`, `all_visible_flag`, `scheduled_publish_flag`, `publish_time`, `content_text`, `content_html`, `attachment`, `page_view_count`, `user_view_count`, `source`, `author`, `document_number`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (60, 2, '1024创新实验室 春节放假通知', 1, 0, '2024-01-01 20:22:23', '春节假期即将来临，根据国务院办公厅关于国庆节的放假安排，废纸信息网安排如下：10月1日至7日放假调休，共7天。\n衷心预祝\n国庆快乐，阖家幸福！', '<p style=\"text-indent: 0px; text-align: justify;\">国庆假期即将来临，根据国务院办公厅关于国庆节的放假安排，废纸信息网安排如下：<strong>10月1日至7日放假调休</strong>，共7天。</p><p style=\"text-indent: 0px; text-align: justify;\"><strong>衷心预祝</strong></p><p style=\"text-indent: 0px; text-align: justify;\"><strong>国庆快乐，阖家幸福！</strong></p>', '', 0, 0, '人力行政部', '卓大', '1024创新实验室发〔2022〕字第36号', 0, NULL, '2024-01-20 13:38:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:35', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_notice_type
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_type`;
CREATE TABLE `t_notice_type` (
  `notice_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '通知类型',
  `notice_type_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`notice_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知类型';

-- ----------------------------
-- Records of t_notice_type
-- ----------------------------
BEGIN;
INSERT INTO `t_notice_type` (`notice_type_id`, `notice_type_name`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '公告', 0, NULL, '2024-01-20 13:38:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:49', NULL, NULL, NULL);
INSERT INTO `t_notice_type` (`notice_type_id`, `notice_type_name`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, '通知', 0, NULL, '2024-01-20 13:38:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:38:49', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_notice_view_record
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_view_record`;
CREATE TABLE `t_notice_view_record` (
  `notice_id` bigint NOT NULL COMMENT '通知公告id',
  `employee_id` bigint NOT NULL COMMENT '员工id',
  `page_view_count` int DEFAULT '0' COMMENT '查看次数',
  `first_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首次ip',
  `first_user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首次用户设备等标识',
  `last_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后一次ip',
  `last_user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后一次用户设备等标识',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`notice_id`,`employee_id`) USING BTREE,
  UNIQUE KEY `uk_notice_employee` (`notice_id`,`employee_id`) USING BTREE COMMENT '资讯员工'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知查看记录';

-- ----------------------------
-- Records of t_notice_view_record
-- ----------------------------
BEGIN;
INSERT INTO `t_notice_view_record` (`notice_id`, `employee_id`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (54, 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', NULL, NULL, 0, NULL, '2024-01-20 13:39:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:39:03', NULL, NULL, NULL);
INSERT INTO `t_notice_view_record` (`notice_id`, `employee_id`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (56, 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', NULL, NULL, 0, NULL, '2024-01-20 13:39:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:39:03', NULL, NULL, NULL);
INSERT INTO `t_notice_view_record` (`notice_id`, `employee_id`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (59, 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', NULL, NULL, 0, NULL, '2024-01-20 13:39:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:39:03', NULL, NULL, NULL);
INSERT INTO `t_notice_view_record` (`notice_id`, `employee_id`, `page_view_count`, `first_ip`, `first_user_agent`, `last_ip`, `last_user_agent`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (60, 1, 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 0, NULL, '2024-01-20 13:39:03', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:39:03', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_notice_visible_range
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_visible_range`;
CREATE TABLE `t_notice_visible_range` (
  `notice_id` bigint NOT NULL COMMENT '资讯id',
  `data_type` tinyint NOT NULL COMMENT '数据类型1员工 2部门',
  `data_id` bigint NOT NULL COMMENT '员工or部门id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  UNIQUE KEY `uk_notice_data` (`notice_id`,`data_type`,`data_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知可见范围';

-- ----------------------------
-- Records of t_notice_visible_range
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_oa_bank
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_bank`;
CREATE TABLE `t_oa_bank` (
  `bank_id` bigint NOT NULL AUTO_INCREMENT COMMENT '银行信息ID',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户银行',
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户名称',
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `business_flag` tinyint(1) NOT NULL COMMENT '是否对公',
  `enterprise_id` bigint NOT NULL COMMENT '企业ID',
  `disabled_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`bank_id`) USING BTREE,
  KEY `idx_enterprise_id` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='OA银行信息\n';

-- ----------------------------
-- Records of t_oa_bank
-- ----------------------------
BEGIN;
INSERT INTO `t_oa_bank` (`bank_id`, `bank_name`, `account_name`, `account_number`, `business_flag`, `enterprise_id`, `disabled_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (26, '工商银行', '1024创新实验室', '1024', 1, 2, 0, 0, NULL, '2024-01-20 13:40:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:40:53', NULL, NULL, NULL);
INSERT INTO `t_oa_bank` (`bank_id`, `bank_name`, `account_name`, `account_number`, `business_flag`, `enterprise_id`, `disabled_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (27, '建设银行', '1024创新实验室', '10241', 0, 2, 0, 0, NULL, '2024-01-20 13:40:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:40:53', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_oa_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_enterprise`;
CREATE TABLE `t_oa_enterprise` (
  `enterprise_id` bigint NOT NULL AUTO_INCREMENT COMMENT '企业ID',
  `enterprise_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
  `enterprise_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业logo',
  `type` int NOT NULL DEFAULT '1' COMMENT '类型（1:有限公司;2:合伙公司）',
  `unified_social_credit_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统一社会信用代码',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `contact_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省份',
  `province_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省份名称',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市',
  `city_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市名称',
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区县',
  `district_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区县名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `business_license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '营业执照',
  `disabled_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='OA企业模块\r\n';

-- ----------------------------
-- Records of t_oa_enterprise
-- ----------------------------
BEGIN;
INSERT INTO `t_oa_enterprise` (`enterprise_id`, `enterprise_name`, `enterprise_logo`, `type`, `unified_social_credit_code`, `contact`, `contact_phone`, `email`, `province`, `province_name`, `city`, `city_name`, `district`, `district_name`, `address`, `business_license`, `disabled_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '1024创新区块链实验室', 'public/common/f4a76fa720814949a610f05f6f9545bf_20221022170256_jpg', 1, '1024lab_block', '开云', '18637925892', NULL, '410000', '河南省', '410300', '洛阳市', '410311', '洛龙区', '区块链大楼', 'public/common/852b7e19bef94af39c1a6156edf47cfb_20221022170332_jpg', 0, 0, NULL, '2024-01-20 13:41:10', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:41:10', NULL, NULL, NULL);
INSERT INTO `t_oa_enterprise` (`enterprise_id`, `enterprise_name`, `enterprise_logo`, `type`, `unified_social_credit_code`, `contact`, `contact_phone`, `email`, `province`, `province_name`, `city`, `city_name`, `district`, `district_name`, `address`, `business_license`, `disabled_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, '1024创新实验室', '', 2, '1024lab', '卓大', '18637925892', 'lab1024@163.com', '410000', '河南省', '410300', '洛阳市', '410311', '洛龙区', '1024大楼', 'public/common/59b1ca99b7fe45d78678e6295798a699_20231201200459.jpg', 0, 0, NULL, '2024-01-20 13:41:10', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:41:10', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_oa_enterprise_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_enterprise_employee`;
CREATE TABLE `t_oa_enterprise_employee` (
  `enterprise_employee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `enterprise_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单ID',
  `employee_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货物名称',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`enterprise_employee_id`) USING BTREE,
  UNIQUE KEY `uk_enterprise_employee` (`enterprise_id`,`employee_id`) USING BTREE,
  KEY `idx_employee_id` (`employee_id`) USING BTREE,
  KEY `idx_enterprise_id` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='企业关联的员工';

-- ----------------------------
-- Records of t_oa_enterprise_employee
-- ----------------------------
BEGIN;
INSERT INTO `t_oa_enterprise_employee` (`enterprise_employee_id`, `enterprise_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (154, '2', '2', 0, NULL, '2024-01-20 13:41:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:41:25', NULL, NULL, NULL);
INSERT INTO `t_oa_enterprise_employee` (`enterprise_employee_id`, `enterprise_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (155, '2', '44', 0, NULL, '2024-01-20 13:41:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:41:25', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_oa_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_invoice`;
CREATE TABLE `t_oa_invoice` (
  `invoice_id` bigint NOT NULL AUTO_INCREMENT COMMENT '发票信息ID',
  `invoice_heads` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开票抬头',
  `taxpayer_identification_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '纳税人识别号',
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行账户',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户行',
  `enterprise_id` bigint NOT NULL COMMENT '企业ID',
  `disabled_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`invoice_id`) USING BTREE,
  KEY `idx_enterprise_id` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='OA发票信息\n';

-- ----------------------------
-- Records of t_oa_invoice
-- ----------------------------
BEGIN;
INSERT INTO `t_oa_invoice` (`invoice_id`, `invoice_heads`, `taxpayer_identification_number`, `account_number`, `bank_name`, `enterprise_id`, `disabled_flag`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (15, '1024创新实验室', '1024lab', '1024lab', '中国银行', 2, 0, 0, NULL, '2024-01-20 13:41:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:41:50', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_log`;
CREATE TABLE `t_operate_log` (
  `operate_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operate_user_id` bigint NOT NULL COMMENT '用户id',
  `operate_user_type` int NOT NULL COMMENT '用户类型',
  `operate_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求路径',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求ip',
  `ip_region` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求ip地区',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求user-agent',
  `success_flag` tinyint DEFAULT NULL COMMENT '请求结果 0失败 1成功',
  `fail_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '失败原因',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`operate_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='操作记录';

-- ----------------------------
-- Records of t_operate_log
-- ----------------------------
BEGIN;
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (654, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 20:37:07', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:37:07', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (655, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 20:37:07', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:37:07', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (656, 1, 1, '管理员', 'OA办公-企业', '分页查询企业模块 @author loki', '/oa/enterprise/page/query', 'cn.morefocus.admin.module.business.oa.enterprise.controller.EnterpriseController.queryByPage', '[{\"deleteFlag\":false,\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 20:38:26', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:38:26', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (657, 1, 1, '管理员', 'OA办公-通知公告', '通知公告类型-获取全部 @author loki', '/oa/noticeType/getAll', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.getAll', '', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 20:38:29', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:38:29', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (658, 1, 1, '管理员', 'OA办公-通知公告', '【管理】通知公告-分页查询 @author loki', '/oa/notice/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.query', '[{\"documentNumber\":\"\",\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t_employee.department_id\' in \'on clause\'\n### The error may exist in file [/Users/jun/Documents/MF/template/MF-BOOT/morefocus-admin/target/classes/mapper/business/oa/notice/NoticeMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT         t_notice.* ,         t_notice_type.notice_type_name as noticeTypeName,         t_employee.actual_name as createUserName,         t_department.name as departmentName         FROM t_notice         left join t_notice_type on t_notice_type.notice_type_id = t_notice.notice_type_id         left join t_employee on t_notice.create_user_id = t_employee.employee_id         left join t_department on t_employee.department_id = t_department.department_id                                  ORDER BY t_notice.publish_time DESC, t_notice.notice_id DESC LIMIT ?\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t_employee.department_id\' in \'on clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'t_employee.department_id\' in \'on clause\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy107.selectList(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy151.query(Unknown Source)\n	at cn.morefocus.admin.module.business.oa.notice.service.NoticeService.query(NoticeService.java:75)\n	at cn.morefocus.admin.module.business.oa.notice.service.NoticeService$$FastClassBySpringCGLIB$$6db2f911.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\n	at cn.morefocus.admin.module.business.oa.notice.service.NoticeService$$EnhancerBySpringCGLIB$$aae12b48.query(<generated>)\n	at cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.query(NoticeController.java:77)\n	at cn.morefocus.admin.module.business.oa.notice.controller.NoticeController$$FastClassBySpringCGLIB$$8cddf6f3.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\n	at cn.morefocus.admin.module.business.oa.notice.controller.NoticeController$$EnhancerBySpringCGLIB$$9b22bdd8.query(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:696)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:779)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.github.xiaoymin.knife4j.extend.filter.basic.ServletSecurityBasicAuthFilter.doFilter(ServletSecurityBasicAuthFilter.java:56)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:74)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:687)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\nCaused by: java.sql.SQLSyntaxErrorException: Unknown column \'t_employee.department_id\' in \'on clause\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:354)\n	at com.p6spy.engine.wrapper.PreparedStatementWrapper.execute(PreparedStatementWrapper.java:362)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3446)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:434)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3444)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:434)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3444)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:152)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:483)\n	at sun.reflect.GeneratedMethodAccessor180.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.$Proxy129.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:64)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\n	at sun.reflect.GeneratedMethodAccessor212.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:64)\n	at com.sun.proxy.$Proxy127.query(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:63)\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:325)\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:109)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:81)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:62)\n	at com.sun.proxy.$Proxy125.query(Unknown Source)\n	at sun.reflect.GeneratedMethodAccessor211.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\n	at cn.morefocus.admin.module.system.datascope.MyBatisPlugin.intercept(MyBatisPlugin.java:60)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:62)\n	at com.sun.proxy.$Proxy125.query(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:151)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:145)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\n	at sun.reflect.GeneratedMethodAccessor219.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 96 more\n', 0, NULL, '2024-01-20 20:38:29', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:38:29', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (659, 1, 1, '管理员', 'OA办公-通知公告', '【管理】通知公告-分页查询 @author loki', '/oa/notice/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.query', '[{\"documentNumber\":\"\",\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 0, 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t_notice.create_user_id\' in \'on clause\'\n### The error may exist in file [/Users/jun/Documents/MF/template/MF-BOOT/morefocus-admin/target/classes/mapper/business/oa/notice/NoticeMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT         t_notice.* ,         t_notice_type.notice_type_name as noticeTypeName,         t_employee.actual_name as createUserName,         t_department.name as departmentName         FROM t_notice         left join t_notice_type on t_notice_type.notice_type_id = t_notice.notice_type_id         left join t_employee on t_notice.create_user_id = t_employee.employee_id         left join t_department on t_employee.dept_id = t_department.department_id                                  ORDER BY t_notice.publish_time DESC, t_notice.notice_id DESC LIMIT ?\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t_notice.create_user_id\' in \'on clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'t_notice.create_user_id\' in \'on clause\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy107.selectList(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy151.query(Unknown Source)\n	at cn.morefocus.admin.module.business.oa.notice.service.NoticeService.query(NoticeService.java:75)\n	at cn.morefocus.admin.module.business.oa.notice.service.NoticeService$$FastClassBySpringCGLIB$$6db2f911.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\n	at cn.morefocus.admin.module.business.oa.notice.service.NoticeService$$EnhancerBySpringCGLIB$$40a8748c.query(<generated>)\n	at cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.query(NoticeController.java:77)\n	at cn.morefocus.admin.module.business.oa.notice.controller.NoticeController$$FastClassBySpringCGLIB$$8cddf6f3.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.adapter.AfterReturningAdviceInterceptor.invoke(AfterReturningAdviceInterceptor.java:57)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\n	at cn.morefocus.admin.module.business.oa.notice.controller.NoticeController$$EnhancerBySpringCGLIB$$f756d995.query(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:696)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:779)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.github.xiaoymin.knife4j.extend.filter.basic.ServletSecurityBasicAuthFilter.doFilter(ServletSecurityBasicAuthFilter.java:56)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:74)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:687)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:745)\nCaused by: java.sql.SQLSyntaxErrorException: Unknown column \'t_notice.create_user_id\' in \'on clause\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:120)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:354)\n	at com.p6spy.engine.wrapper.PreparedStatementWrapper.execute(PreparedStatementWrapper.java:362)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3446)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:434)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3444)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:434)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3444)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:152)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:483)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\n	at com.sun.proxy.$Proxy129.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:64)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:64)\n	at com.sun.proxy.$Proxy127.query(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:63)\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:325)\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:109)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:81)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:62)\n	at com.sun.proxy.$Proxy125.query(Unknown Source)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\n	at cn.morefocus.admin.module.system.datascope.MyBatisPlugin.intercept(MyBatisPlugin.java:60)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:62)\n	at com.sun.proxy.$Proxy125.query(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:151)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:145)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:140)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 96 more\n', 0, NULL, '2024-01-20 20:43:59', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:43:59', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (660, 1, 1, '管理员', 'OA办公-通知公告', '【管理】通知公告-分页查询 @author loki', '/oa/notice/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.query', '[{\"documentNumber\":\"\",\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 20:45:57', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:45:57', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (661, 1, 1, '管理员', 'OA办公-通知公告', '【管理】通知公告-分页查询 @author loki', '/oa/notice/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.query', '[{\"documentNumber\":\"\",\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 20:46:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 20:46:25', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (662, 1, 1, '管理员', 'OA办公-企业', '分页查询企业模块 @author loki', '/oa/enterprise/page/query', 'cn.morefocus.admin.module.business.oa.enterprise.controller.EnterpriseController.queryByPage', '[{\"deleteFlag\":false,\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:23:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:23:48', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (663, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:23:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:23:50', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (664, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:23:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:23:50', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (665, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:24:01', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:24:01', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (666, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:24:01', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:24:01', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (667, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:24:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:24:25', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (668, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-20 21:24:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 21:24:25', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (669, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:08:33', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:08:33', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (670, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:08:33', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:08:33', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (671, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:08:48', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:08:48', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (672, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:08:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:08:49', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (673, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:42:22', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:42:22', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (674, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:42:22', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:42:22', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (675, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:43:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:43:35', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (676, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:43:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:43:35', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (677, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:43:47', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:43:47', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (678, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:43:47', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:43:47', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (679, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:44:07', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:44:07', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (680, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:44:07', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:44:07', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (681, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:50:11', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:50:11', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (682, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:50:11', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:50:11', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (683, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:52:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:52:40', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (684, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:52:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:52:40', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (685, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:55:11', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:55:11', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (686, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:55:11', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:55:11', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (687, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:56:45', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:56:45', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (688, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:56:45', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:56:45', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (689, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:57:18', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:57:18', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (690, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:57:18', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:57:18', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (691, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:57:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:57:35', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (692, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:57:35', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:57:35', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (693, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:58:01', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:58:01', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (694, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:58:01', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:58:01', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (695, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:58:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:58:08', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (696, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:58:08', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:58:08', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (697, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:58:44', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:58:44', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (698, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:58:44', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:58:44', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (699, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:59:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:59:55', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (700, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 13:59:55', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 13:59:55', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (701, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 14:04:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 14:04:39', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (702, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 14:04:39', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 14:04:39', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (703, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 16:42:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 16:42:53', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (704, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-21 16:42:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-21 16:42:53', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (705, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-24 22:09:11', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:09:11', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (706, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-24 22:09:11', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:09:11', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (707, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-24 22:37:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:37:54', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (708, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-24 22:37:54', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:37:54', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (709, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-24 22:37:59', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:37:59', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (710, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-24 22:37:59', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-24 22:37:59', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (711, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-27 16:19:09', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 16:19:09', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (712, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-01-27 16:19:09', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-27 16:19:09', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (713, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-22 23:12:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:12:53', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (714, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-22 23:12:53', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-22 23:12:53', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (715, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-28 22:32:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 22:32:50', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (716, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-28 22:32:50', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 22:32:50', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (717, 1, 1, '管理员', 'OA办公-企业', '分页查询企业模块 @author loki', '/oa/enterprise/page/query', 'cn.morefocus.admin.module.business.oa.enterprise.controller.EnterpriseController.queryByPage', '[{\"deleteFlag\":false,\"keywords\":\"\",\"pageNum\":1,\"pageSize\":10,\"searchCount\":true}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-28 22:41:05', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 22:41:05', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (718, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-28 23:34:21', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 23:34:21', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (719, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-02-28 23:34:22', NULL, NULL, 0, NULL, NULL, NULL, '2024-02-28 23:34:22', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (720, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-03-20 22:55:26', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-20 22:55:26', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (721, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-03-20 22:55:26', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-20 22:55:26', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (722, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":1,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-03-20 22:59:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-20 22:59:17', NULL, NULL, NULL);
INSERT INTO `t_operate_log` (`operate_log_id`, `operate_user_id`, `operate_user_type`, `operate_user_name`, `module`, `content`, `url`, `method`, `param`, `ip`, `ip_region`, `user_agent`, `success_flag`, `fail_reason`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (723, 1, 1, '管理员', 'OA办公-通知公告', '【员工】通知公告-查询全部 @author loki', '/oa/notice/employee/query', 'cn.morefocus.admin.module.business.oa.notice.controller.NoticeController.queryEmployeeNotice', '[{\"noticeTypeId\":2,\"pageNum\":1,\"pageSize\":6,\"searchCount\":false}]', '127.0.0.1', '0|0|0|内网IP|内网IP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1, NULL, 0, NULL, '2024-03-20 22:59:17', NULL, NULL, 0, NULL, NULL, NULL, '2024-03-20 22:59:17', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_reload_item
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_item`;
CREATE TABLE `t_reload_item` (
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '项名称',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数 可选',
  `identification` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '运行标识',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`tag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='reload项目';

-- ----------------------------
-- Records of t_reload_item
-- ----------------------------
BEGIN;
INSERT INTO `t_reload_item` (`tag`, `args`, `identification`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES ('system_config', 'e', 'e', 0, NULL, '2024-01-20 13:42:28', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:42:28', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_reload_result
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_result`;
CREATE TABLE `t_reload_result` (
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行标识',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` tinyint unsigned NOT NULL COMMENT '是否成功 ',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='reload结果';

-- ----------------------------
-- Records of t_reload_result
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色编码',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `role_code_uni` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`role_id`, `role_name`, `role_code`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '技术总监', NULL, 0, NULL, '2024-01-20 13:43:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:43:49', NULL, NULL, NULL);
INSERT INTO `t_role` (`role_id`, `role_name`, `role_code`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (34, '销售总监', 'cto', 0, NULL, '2024-01-20 13:43:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:43:49', NULL, NULL, NULL);
INSERT INTO `t_role` (`role_id`, `role_name`, `role_code`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (35, '总经理', NULL, 0, NULL, '2024-01-20 13:43:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:43:49', NULL, NULL, NULL);
INSERT INTO `t_role` (`role_id`, `role_name`, `role_code`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (36, '董事长', NULL, 0, NULL, '2024-01-20 13:43:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:43:49', NULL, NULL, NULL);
INSERT INTO `t_role` (`role_id`, `role_name`, `role_code`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (37, '财务', NULL, 0, NULL, '2024-01-20 13:43:49', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:43:49', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_scope`;
CREATE TABLE `t_role_data_scope` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_scope_type` int NOT NULL COMMENT '数据范围id',
  `view_type` int NOT NULL COMMENT '数据范围类型',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色的数据范围';

-- ----------------------------
-- Records of t_role_data_scope
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_role_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_role_employee`;
CREATE TABLE `t_role_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色id',
  `employee_id` bigint NOT NULL COMMENT '员工id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_employee` (`role_id`,`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色员工功能表';

-- ----------------------------
-- Records of t_role_employee
-- ----------------------------
BEGIN;
INSERT INTO `t_role_employee` (`id`, `role_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (325, 36, 63, 0, NULL, '2024-01-20 13:44:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:25', NULL, NULL, NULL);
INSERT INTO `t_role_employee` (`id`, `role_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (329, 34, 72, 0, NULL, '2024-01-20 13:44:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:25', NULL, NULL, NULL);
INSERT INTO `t_role_employee` (`id`, `role_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (330, 36, 72, 0, NULL, '2024-01-20 13:44:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:25', NULL, NULL, NULL);
INSERT INTO `t_role_employee` (`id`, `role_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (333, 1, 44, 0, NULL, '2024-01-20 13:44:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:25', NULL, NULL, NULL);
INSERT INTO `t_role_employee` (`id`, `role_id`, `employee_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (334, 1, 47, 0, NULL, '2024-01-20 13:44:25', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:25', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `role_menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_menu_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色-菜单\n';

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (50, 1, 138, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (51, 1, 132, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (52, 1, 142, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (53, 1, 149, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (54, 1, 150, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (55, 1, 185, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (56, 1, 186, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (57, 1, 187, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (58, 1, 188, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (59, 1, 145, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (60, 1, 196, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (61, 1, 144, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (62, 1, 181, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (63, 1, 183, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (64, 1, 184, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (65, 1, 165, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (66, 1, 47, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (67, 1, 48, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (68, 1, 137, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (69, 1, 166, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (70, 1, 194, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (71, 1, 78, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (72, 1, 173, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (73, 1, 174, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (74, 1, 175, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
INSERT INTO `t_role_menu` (`role_menu_id`, `role_id`, `menu_id`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (75, 1, 176, 0, NULL, '2024-01-20 13:44:40', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:44:40', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `t_serial_number`;
CREATE TABLE `t_serial_number` (
  `serial_number_id` int NOT NULL,
  `business_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务名称',
  `format` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '格式[yyyy]表示年,[mm]标识月,[dd]表示日,[nnn]表示三位数字',
  `rule_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则格式。none没有周期, year 年周期, month月周期, day日周期',
  `init_number` int unsigned NOT NULL COMMENT '初始值',
  `step_random_range` int unsigned NOT NULL COMMENT '步长随机数',
  `last_number` bigint DEFAULT NULL COMMENT '上次产生的单号, 默认为空',
  `last_time` datetime DEFAULT NULL COMMENT '上次产生的单号时间',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`serial_number_id`) USING BTREE,
  UNIQUE KEY `key_name` (`business_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单号生成器定义表';

-- ----------------------------
-- Records of t_serial_number
-- ----------------------------
BEGIN;
INSERT INTO `t_serial_number` (`serial_number_id`, `business_name`, `format`, `rule_type`, `init_number`, `step_random_range`, `last_number`, `last_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '订单编号', 'DK[yyyy][mm][dd]NO[nnnnn]', 'day', 1000, 10, 1, '2023-12-04 09:16:42', 0, NULL, '2024-01-20 13:45:01', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:45:01', NULL, NULL, NULL);
INSERT INTO `t_serial_number` (`serial_number_id`, `business_name`, `format`, `rule_type`, `init_number`, `step_random_range`, `last_number`, `last_time`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, '合同编号', 'HT[yyyy][mm][dd][nnnnn]-CX', 'none', 1, 1, 8, '2023-12-04 09:54:53', 0, NULL, '2024-01-20 13:45:01', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:45:01', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_serial_number_record
-- ----------------------------
DROP TABLE IF EXISTS `t_serial_number_record`;
CREATE TABLE `t_serial_number_record` (
  `serial_number_id` int NOT NULL COMMENT '单号id',
  `record_date` date NOT NULL COMMENT '记录日期',
  `last_number` bigint NOT NULL DEFAULT '0' COMMENT '最后更新值',
  `last_time` datetime NOT NULL COMMENT '最后更新时间',
  `count` bigint NOT NULL DEFAULT '0' COMMENT '更新次数',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  KEY `uk_generator` (`serial_number_id`,`record_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='serial_number记录表';

-- ----------------------------
-- Records of t_serial_number_record
-- ----------------------------
BEGIN;
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '2022-03-02', 8581, '2022-03-03 14:37:11', 500, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '2022-03-03', 7053, '2022-03-03 14:38:48', 1500, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '2022-06-24', 1082, '2022-06-24 15:16:13', 15, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '2023-12-01', 1008, '2023-12-01 21:16:30', 1, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, '2023-12-01', 2, '2023-12-01 21:16:36', 1, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (1, '2023-12-04', 1007, '2023-12-04 09:15:41', 3, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
INSERT INTO `t_serial_number_record` (`serial_number_id`, `record_date`, `last_number`, `last_time`, `count`, `sort_value`, `remark`, `update_time`, `update_by`, `update_by_name`, `delete_flag`, `delete_time`, `delete_by`, `delete_by_name`, `create_time`, `create_by`, `create_by_name`, `dept_id`) VALUES (2, '2023-12-04', 8, '2023-12-04 09:54:38', 6, 0, NULL, '2024-01-20 13:46:04', NULL, NULL, 0, NULL, NULL, NULL, '2024-01-20 13:46:04', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_table_column
-- ----------------------------
DROP TABLE IF EXISTS `t_table_column`;
CREATE TABLE `t_table_column` (
  `table_column_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_type` int NOT NULL COMMENT '用户类型',
  `table_id` int NOT NULL COMMENT '表格id',
  `columns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '具体的表格列，存入的json',
  `sort_value` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人名称',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_by` bigint DEFAULT NULL COMMENT '删除人ID',
  `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '删除人名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`table_column_id`) USING BTREE,
  UNIQUE KEY `uni_employee_table` (`user_id`,`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='表格的自定义列存储';

-- ----------------------------
-- Records of t_table_column
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
