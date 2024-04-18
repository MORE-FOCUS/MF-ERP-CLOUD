/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : MF_ERP_CLOUD

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 19/04/2024 00:42:57
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_abase
-- ----------------------------
DROP TABLE IF EXISTS `t_abase`;
CREATE TABLE `t_abase`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='分类表，主要用于商品分类';

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account`
(
    `id`              bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '银行信息ID',
    `bank_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户银行',
    `account_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户名称',
    `account_number`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
    `is_business`     bit(1)                                                        NOT NULL COMMENT '是否对公',
    `enterprise_id`   bigint                                                        NOT NULL COMMENT '企业ID',
    `disabled`        bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '禁用状态',
    `is_default`      bit(1)                                                                 DEFAULT NULL COMMENT '是否默认',
    `sort_value`      int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`     datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`     datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `balance`         decimal(10, 2)                                                         DEFAULT NULL COMMENT '当前剩余金额',
    `initial_balance` decimal(10, 2)                                                         DEFAULT NULL COMMENT '期初余额',
    `store_id`        bigint                                                                 DEFAULT NULL COMMENT '门店ID',
    `is_deleted`      bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE,
    KEY               `idx_enterprise_id` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='账户信息';

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `state`          bit(1)                                                        DEFAULT NULL COMMENT '0-禁用 1-启用',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='品牌';

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`
(
    `category_id`    bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `is_deleted`     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除',
    `delete_time`    datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `category_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
    `category_type`  tinyint                                                                DEFAULT NULL COMMENT '类别分类',
    `is_disabled`    bit(1)                                                                 DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
    `level`          tinyint                                                                DEFAULT NULL COMMENT '层级',
    `leaf`           bit(1)                                                                 DEFAULT b'0' COMMENT '是否叶子节点',
    `path`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
    `pid`            bigint                                                        NOT NULL COMMENT '父级id',
    `state`          tinyint                                                       NOT NULL DEFAULT '1' COMMENT '状态 1-上架 2-下架',
    PRIMARY KEY (`category_id`) USING BTREE,
    KEY              `idx_parent_id` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='分类表，主要用于商品分类';

-- ----------------------------
-- Table structure for t_change_log
-- ----------------------------
DROP TABLE IF EXISTS `t_change_log`;
CREATE TABLE `t_change_log`
(
    `change_log_id`  bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '更新日志id',
    `version`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本',
    `type`           int                                                           NOT NULL COMMENT '更新类型:[1:特大版本功能更新;2:功能更新;3:bug修复]',
    `publish_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布人',
    `public_date`    date                                                          NOT NULL COMMENT '发布日期',
    `content`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新内容',
    `link`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '跳转链接',
    `sort_value`     int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`change_log_id`) USING BTREE,
    UNIQUE KEY `version_unique` (`version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统更新日志';

-- ----------------------------
-- Table structure for t_code_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `t_code_generator_config`;
CREATE TABLE `t_code_generator_config`
(
    `table_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
    `basic`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '基础命名信息',
    `fields`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '字段列表',
    `insert_and_update` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '新建、修改',
    `delete_info`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '删除',
    `query_fields`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '查询',
    `table_fields`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '列表',
    `detail`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '详情',
    `sort_value`        int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`       datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`         bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`       datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`         bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`       datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`         bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`           bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`        bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`table_name`) USING BTREE,
    UNIQUE KEY `table_unique` (`table_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成器的每个表的配置';

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config`
(
    `config_id`      bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `config_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数名字',
    `config_key`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数key',
    `config_value`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `sort_value`     int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统配置';

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名称',
    `category_id`    bigint                                                        DEFAULT NULL COMMENT '分类ID',
    `code`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '编码',
    `is_public`      bit(1)                                                        DEFAULT NULL COMMENT '是否公开 公开之后其他门店也可以看到',
    `contacts`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系人',
    `address`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系地址',
    `phone`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系电话',
    `work_telephone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '单位电话',
    `email`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '邮箱',
    `wechat`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '微信号',
    `postal`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '邮编',
    `qq`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'QQ',
    `tax`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '传真',
    `state`          bit(1)                                                        DEFAULT NULL COMMENT '0-禁用 1-启用',
    `origin_debt`    decimal(10, 2)                                                DEFAULT NULL COMMENT '初始欠款',
    `debt`           decimal(10, 2)                                                DEFAULT NULL COMMENT '欠款',
    `employee_id`    bigint                                                        DEFAULT NULL COMMENT '关联业务员ID',
    `employee_name`  varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '关联业务员名称',
    `level_id`       int                                                           DEFAULT NULL COMMENT '客户等级ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ERP客户';

-- ----------------------------
-- Table structure for t_daily_receipt_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_daily_receipt_payment`;
CREATE TABLE `t_daily_receipt_payment`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `category_id`    bigint                                                        DEFAULT NULL COMMENT '收支项目ID',
    `business_time`  date                                                          DEFAULT NULL COMMENT '业务日期',
    `category_name`  varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '收支项目名称',
    `bill_no`        varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '单据号',
    `amount`         decimal(10, 2)                                                DEFAULT NULL COMMENT '应收/应付金额',
    `amount_actual`  decimal(10, 2)                                                DEFAULT NULL COMMENT '实收/实付金额',
    `bank_id`        bigint                                                        DEFAULT NULL COMMENT '账户ID',
    `store_id`       bigint                                                        DEFAULT NULL COMMENT '门店ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='日常收支';

-- ----------------------------
-- Table structure for t_daily_receipt_payment_category
-- ----------------------------
DROP TABLE IF EXISTS `t_daily_receipt_payment_category`;
CREATE TABLE `t_daily_receipt_payment_category`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '名称',
    `type`           tinyint                                                       DEFAULT NULL COMMENT '类型 1-支出 2-收入',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='日常收支';

-- ----------------------------
-- Table structure for t_data_tracer
-- ----------------------------
DROP TABLE IF EXISTS `t_data_tracer`;
CREATE TABLE `t_data_tracer`
(
    `data_tracer_id` bigint                                                       NOT NULL AUTO_INCREMENT,
    `data_id`        bigint                                                       NOT NULL COMMENT '各种单据的id',
    `type`           int                                                          NOT NULL COMMENT '单据类型',
    `content`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '操作内容',
    `diff_old`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '差异：旧的数据',
    `diff_new`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '差异：新的数据',
    `extra_data`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '额外信息',
    `user_id`        bigint                                                       NOT NULL COMMENT '用户id',
    `user_type`      int                                                          NOT NULL COMMENT '用户类型：1 后管用户 ',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
    `ip`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT 'ip',
    `ip_region`      varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci        DEFAULT NULL COMMENT 'ip地区',
    `user_agent`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci        DEFAULT NULL COMMENT '用户ua',
    `sort_value`     int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`data_tracer_id`) USING BTREE,
    KEY              `order_id_order_type` (`data_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='各种单据操作记录';

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`
(
    `id`             bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
    `pid`            bigint                                                       NOT NULL DEFAULT '0' COMMENT '部门的父级id',
    `name`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
    `manager_id`     bigint                                                                DEFAULT NULL COMMENT '部门负责人id',
    `manager_name`   varchar(64) COLLATE utf8mb4_unicode_ci                                DEFAULT NULL COMMENT '部门负责人名称',
    `path`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
    `sort_value`     int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `is_deleted`     bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE,
    KEY              `parent_id` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='组织架构';

-- ----------------------------
-- Table structure for t_dict_key
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_key`;
CREATE TABLE `t_dict_key`
(
    `dict_key_id`    bigint                                                       NOT NULL AUTO_INCREMENT,
    `key_code`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
    `key_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
    `sort_value`     int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`dict_key_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字段key';

-- ----------------------------
-- Table structure for t_dict_value
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_value`;
CREATE TABLE `t_dict_value`
(
    `dict_value_id`  bigint                                                       NOT NULL AUTO_INCREMENT,
    `dict_key_id`    bigint                                                       NOT NULL,
    `value_code`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
    `value_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
    `sort_value`     int                                                          NOT NULL DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`dict_value_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典的值';

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`
(
    `employee_id`        bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `login_name`         varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录帐号',
    `login_pwd`          varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
    `actual_name`        varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '员工名称',
    `gender`             tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
    `phone`              varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci          DEFAULT NULL COMMENT '手机号码',
    `dept_id`            bigint                                                       NOT NULL COMMENT '部门id',
    `is_disabled`        bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否被禁用 0否1是',
    `administrator_flag` tinyint                                                      NOT NULL DEFAULT '0' COMMENT '是否为超级管理员: 0 不是，1是',
    `sort_value`         int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`             varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`        datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`          bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`        tinyint                                                      NOT NULL DEFAULT '0' COMMENT '是否删除',
    `delete_time`        datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`          bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`        datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`          bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `is_deleted`         bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='员工表';

-- ----------------------------
-- Table structure for t_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise`;
CREATE TABLE `t_enterprise`
(
    `id`                         bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '企业ID',
    `name`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名称',
    `logo`                       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '企业logo',
    `type`                       int                                                           NOT NULL DEFAULT '1' COMMENT '类型（1:有限公司;2:合伙公司）',
    `unified_social_credit_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统一社会信用代码',
    `contact`                    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
    `contact_phone`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人电话',
    `email`                      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '邮箱',
    `province`                   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '省份',
    `province_name`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '省份名称',
    `city`                       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '市',
    `city_name`                  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '城市名称',
    `district`                   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '区县',
    `district_name`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '区县名称',
    `address`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '详细地址',
    `business_license`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '营业执照',
    `is_disabled`                bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '禁用状态',
    `sort_value`                 int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`                     varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`                datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`                  bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`                datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`                  bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`                datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`                  bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`                    bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`                 bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='企业信息';

-- ----------------------------
-- Table structure for t_erp_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_bill`;
CREATE TABLE `t_erp_bill`
(
    `id`                  bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`          int                                                           DEFAULT '0' COMMENT '排序',
    `remark`              varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`           bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`         datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `is_deleted`          bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `delete_by`           bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`           bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`             bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `bill_type`           tinyint                                                       DEFAULT NULL COMMENT '单据类型\n1：采购\n2：领用\n3：退货\n4：退库\n5：盘点\n6：调拨',
    `bill_no`             varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '单据号',
    `bill_date`           date                                                          DEFAULT NULL COMMENT '单据日期',
    `bill_status`         tinyint                                                       DEFAULT NULL COMMENT '单据状态\n1：待审核\n2：待验收\n3：已完成\n99：已取消',
    `applicant_id`        bigint                                                        DEFAULT NULL COMMENT '申请人ID',
    `applicant_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '申请人名称',
    `applicant_dept_id`   bigint                                                        DEFAULT NULL COMMENT '申请部门ID',
    `applicant_dept_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '申请部门名称',
    `related_bill_id`     bigint                                                        DEFAULT NULL COMMENT '关联单据ID',
    `total_goods_name`    varchar(255) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '单据商品名称，逗号拼接',
    `total_quantity`      tinyint                                                       DEFAULT '0' COMMENT '商品总数量',
    `total_amount`        decimal(10, 2)                                                DEFAULT '0.00' COMMENT '商品总价格',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='采购单据';

-- ----------------------------
-- Table structure for t_erp_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_bill_detail`;
CREATE TABLE `t_erp_bill_detail`
(
    `id`                   bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`           int                                                           DEFAULT '0' COMMENT '排序',
    `remark`               varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`          datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`            bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`          datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `is_deleted`           bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `delete_by`            bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`          datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`            bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`              bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `bill_id`              bigint                                                        DEFAULT NULL COMMENT '单据ID',
    `sku_id`               bigint                                                        DEFAULT NULL COMMENT '商品ID',
    `quantity`             decimal(10, 2)                                                DEFAULT '0.00' COMMENT '申请数量',
    `price`                decimal(10, 2)                                                DEFAULT '0.00' COMMENT '入库单价',
    `is_stored`            bit(1)                                                        DEFAULT b'0' COMMENT '是否入库',
    `stored_quantity`      decimal(10, 2)                                                DEFAULT '0.00' COMMENT '入库数量',
    `stored_time`          datetime                                                      DEFAULT NULL COMMENT '入库时间',
    `stored_employee_id`   bigint                                                        DEFAULT NULL COMMENT '入库人ID',
    `stored_employee_name` varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '入库人名称',
    `amount`               decimal(10, 2)                                                DEFAULT '0.00' COMMENT '总金额=入库数量*单价',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单据明细表';

-- ----------------------------
-- Table structure for t_erp_bill_detail_file
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_bill_detail_file`;
CREATE TABLE `t_erp_bill_detail_file`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `bill_id`        bigint                                                        DEFAULT NULL COMMENT '单据ID',
    `bill_detail_id` bigint                                                        DEFAULT NULL COMMENT '单据名称ID',
    `file_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件路径',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_bill_detail_id` (`bill_detail_id`) USING BTREE COMMENT '单据名称ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单据明细文件';

-- ----------------------------
-- Table structure for t_erp_bill_file
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_bill_file`;
CREATE TABLE `t_erp_bill_file`
(
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `bill_id`        int                                                           DEFAULT NULL COMMENT '单据ID',
    `file_url`       varchar(255) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '文件路径',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_bill_id` (`bill_id`) USING BTREE COMMENT '单据ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单据文件';

-- ----------------------------
-- Table structure for t_erp_customer_address
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer_address`;
CREATE TABLE `t_erp_customer_address`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `address`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系地址',
    `phone`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系电话',
    `contacts`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系人',
    `customer_id`    bigint                                                        DEFAULT NULL COMMENT '客户ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户地址\n';

-- ----------------------------
-- Table structure for t_erp_customer_category
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer_category`;
CREATE TABLE `t_erp_customer_category`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '名称',
    `is_default`     bit(1)                                                        DEFAULT b'0' COMMENT '是否默认',
    `pid`            bigint                                                        DEFAULT NULL COMMENT '父节点ID',
    `disabled`       bit(1)                                                        DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
    `level`          tinyint                                                       DEFAULT NULL COMMENT '层级',
    `leaf`           bit(1)                                                        DEFAULT b'0' COMMENT '是否叶子节点',
    `path`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户类别';

-- ----------------------------
-- Table structure for t_erp_customer_level
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_customer_level`;
CREATE TABLE `t_erp_customer_level`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `code`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '编码',
    `name`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '名称',
    `discount`       tinyint                                                       DEFAULT NULL COMMENT '折扣率 最大100',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='客户等级';

-- ----------------------------
-- Table structure for t_erp_initial_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_initial_stock`;
CREATE TABLE `t_erp_initial_stock`
(
    `id`                  bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`          int                                                           DEFAULT '0' COMMENT '排序',
    `remark`              varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`           bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`         tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`         datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`           bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`           bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`             bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `spu_id`              bigint                                                        DEFAULT NULL COMMENT 'spuid',
    `spu_no`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'spu编号',
    `quantity`            decimal(10, 2)                                                DEFAULT NULL COMMENT '数量',
    `price`               decimal(10, 2)                                                DEFAULT NULL COMMENT '单价',
    `sku_id`              bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `sku_no`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'skuno',
    `unit_id`             bigint                                                        DEFAULT NULL COMMENT '单位ID',
    `sku_stock_id`        bigint                                                        DEFAULT NULL COMMENT '库存ID',
    `sku_stock_detail_id` bigint                                                        DEFAULT NULL COMMENT '库存明细ID',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_spu_id` (`spu_id`) USING BTREE COMMENT 'spuid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='期初库存';

-- ----------------------------
-- Table structure for t_erp_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku`;
CREATE TABLE `t_erp_sku`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `status`         tinyint unsigned NOT NULL COMMENT '状态0-未上架 1-已上架 2-已下架 3-售罄',
    `sku_no`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '编码',
    `sku_name`       varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku';

-- ----------------------------
-- Table structure for t_erp_sku_attrs
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_attrs`;
CREATE TABLE `t_erp_sku_attrs`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `attrs`          json                                                          DEFAULT NULL COMMENT 'sku属性',
    `sku_no`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'sku编码',
    `sku_id`         bigint                                                        DEFAULT NULL COMMENT 'sku_id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SPU属性关系';

-- ----------------------------
-- Table structure for t_erp_sku_bar_code
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_bar_code`;
CREATE TABLE `t_erp_sku_bar_code`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `sku_id`         bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `sku_no`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '编码',
    `unit_id`        bigint                                                        DEFAULT NULL COMMENT '单位ID',
    `unit_name`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '单位名称',
    `bar_code`       varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '条形码',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku 条形码';

-- ----------------------------
-- Table structure for t_erp_sku_file
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_file`;
CREATE TABLE `t_erp_sku_file`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `sku_id`         bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `sku_no`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'sku编号',
    `file_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件路径',
    `is_main`        bit(1)                                                        DEFAULT b'0' COMMENT '是否主图',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_sku_id` (`sku_id`) USING BTREE COMMENT 'skuid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku文件';

-- ----------------------------
-- Table structure for t_erp_sku_init_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_init_stock`;
CREATE TABLE `t_erp_sku_init_stock`
(
    `id`              bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`      int                                                           DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`     tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`     datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `spu_id`          bigint                                                        DEFAULT NULL COMMENT 'spuid',
    `spu_no`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'spu_no',
    `sku_id`          bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `sku_no`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'sku_no',
    `price`           decimal(10, 2)                                                DEFAULT NULL COMMENT '初始库存单价',
    `stock_id`        bigint                                                        DEFAULT NULL COMMENT '库存ID',
    `stock_detail_id` bigint                                                        DEFAULT NULL COMMENT 'sku库存明细ID',
    `quantity`        decimal(10, 2)                                                DEFAULT NULL COMMENT '初始库存',
    `warehouse_id`    bigint                                                        DEFAULT NULL COMMENT '仓库ID',
    `warehouse_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '仓库名称',
    `store_id`        bigint                                                        DEFAULT NULL COMMENT '门店ID',
    `store_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '门店名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='初始库存';

-- ----------------------------
-- Table structure for t_erp_sku_price
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_price`;
CREATE TABLE `t_erp_sku_price`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `sku_id`         bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `sku_no`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '编码',
    `unit_id`        bigint                                                        DEFAULT NULL COMMENT '单位ID',
    `unit_name`      varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '单位名称',
    `price`          decimal(10, 2)                                                DEFAULT NULL COMMENT '参考进价',
    `price_type`     tinyint                                                       DEFAULT NULL COMMENT '1-参考进货价 2-批发价 3-零售价 4-最低零售价',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='sku价格';

-- ----------------------------
-- Table structure for t_erp_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_stock`;
CREATE TABLE `t_erp_sku_stock`
(
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `spu_id`         int                                                           DEFAULT NULL COMMENT 'spuid',
    `spu_no`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'spu_no',
    `sku_id`         int                                                           DEFAULT NULL COMMENT 'skuid',
    `sku_no`         varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT 'sku_no',
    `sku_name`       varchar(256) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '商品名称',
    `quantity`       decimal(10, 2)                                                DEFAULT NULL COMMENT '库存数=库存明细库存数之和',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存';

-- ----------------------------
-- Table structure for t_erp_sku_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_stock_detail`;
CREATE TABLE `t_erp_sku_stock_detail`
(
    `id`              int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`      int                                                           DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`     tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`     datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `spu_id`          int                                                           DEFAULT NULL COMMENT 'spuid',
    `spu_no`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'spu_no',
    `sku_id`          int                                                           DEFAULT NULL COMMENT 'skuid',
    `sku_no`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'sku_no',
    `sku_name`        varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
    `quantity`        decimal(10, 2)                                                DEFAULT NULL COMMENT '库存数',
    `price`           decimal(10, 2)                                                DEFAULT NULL COMMENT '进货单价',
    `batch_id`        int                                                           DEFAULT NULL COMMENT '入库批次ID',
    `stock_id`        int                                                           DEFAULT NULL COMMENT 'sku库存ID',
    `origin_quantity` decimal(10, 2)                                                DEFAULT NULL COMMENT '初始库存',
    `origin_price`    decimal(10, 2)                                                DEFAULT NULL COMMENT '初始单价',
    `warehouse_id`    int                                                           DEFAULT NULL COMMENT '仓库ID',
    `warehouse_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '仓库名称',
    `store_id`        int                                                           DEFAULT NULL COMMENT '门店ID',
    `store_name`      varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '门店名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存明细';

-- ----------------------------
-- Table structure for t_erp_sku_stock_detail_change_record
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_stock_detail_change_record`;
CREATE TABLE `t_erp_sku_stock_detail_change_record`
(
    `id`                  int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`          int                                                           DEFAULT '0' COMMENT '排序',
    `remark`              varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`           bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`         tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`         datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`           bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`           bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`             bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `sku_id`              int                                                           DEFAULT NULL COMMENT 'skuid',
    `sku_no`              varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT 'sku编码',
    `sku_stock_detail_id` int                                                           DEFAULT NULL COMMENT 'sku库存明细ID',
    `change_quantity`     decimal(10, 2)                                                DEFAULT NULL COMMENT '变动数量',
    `change_type`         tinyint                                                       DEFAULT NULL COMMENT '变动类型',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存明细变化日志';

-- ----------------------------
-- Table structure for t_erp_sku_warn_list
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_sku_warn_list`;
CREATE TABLE `t_erp_sku_warn_list`
(
    `id`                int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`        int                                                           DEFAULT '0' COMMENT '排序',
    `remark`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`       datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`         bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`       tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`       datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`         bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`       datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`         bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`           bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `images`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '多个逗号拼接',
    `status`            tinyint unsigned NOT NULL COMMENT '状态0-未上架 1-已上架 2-已下架 3-售罄',
    `sku_no`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '编码',
    `sku_name`          varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
    `sku_id`            int                                                           DEFAULT NULL COMMENT 'skuid',
    `max_quantity_warn` bit(1)                                                        DEFAULT b'0' COMMENT '最大库存预警',
    `min_quantity_warn` bit(1)                                                        DEFAULT b'0' COMMENT '最小库存预警',
    `shelf_life_warn`   bit(1)                                                        DEFAULT b'0' COMMENT '保质期预警',
    `warehouse_id`      int                                                           DEFAULT NULL COMMENT '仓库ID',
    `warehouse_name`    varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '仓库名称',
    `store_id`          int                                                           DEFAULT NULL COMMENT '门店ID',
    `store_name`        varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '门店名称',
    `sku_detail_id`     int                                                           DEFAULT NULL COMMENT 'sku明细ID',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uni_code` (`sku_no`) USING BTREE COMMENT 'SKU编码唯一约束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存预警列表';

-- ----------------------------
-- Table structure for t_erp_specs
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_specs`;
CREATE TABLE `t_erp_specs`
(
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `state`          bit(1)                                                        DEFAULT b'1' COMMENT '0-禁用 1-启用',
    `category_id`    int                                                           DEFAULT NULL COMMENT '分类ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='规格';

-- ----------------------------
-- Table structure for t_erp_specs_category
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_specs_category`;
CREATE TABLE `t_erp_specs_category`
(
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `pid`            int                                                           DEFAULT NULL COMMENT '父节点ID',
    `is_default`     bit(1)                                                        DEFAULT b'0' COMMENT '是否默认',
    `disabled`       bit(1)                                                        DEFAULT b'0' COMMENT '是否禁用 true-禁用 false-启用',
    `level`          tinyint                                                       DEFAULT NULL COMMENT '层级',
    `leaf`           bit(1)                                                        DEFAULT b'0' COMMENT '是否叶子节点',
    `path`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='规格类别';

-- ----------------------------
-- Table structure for t_erp_spu
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu`;
CREATE TABLE `t_erp_spu`
(
    `id`                int                                                          NOT NULL AUTO_INCREMENT COMMENT 'id',
    `status`            tinyint                                                               DEFAULT '0' COMMENT '商品状态 0-未上架 1-已上架 2-已下架\n不同行业，商品状态不同\n其他\n1:预约中,2:售卖中,3:售罄\n',
    `category_id`       int                                                          NOT NULL COMMENT '商品类目',
    `spu_no`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT 'SPU编码',
    `name`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
    `production_place`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '产地',
    `price`             decimal(10, 2) unsigned NOT NULL COMMENT '价格',
    `specs`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '规格',
    `sort_value`        int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`         bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`       tinyint                                                      NOT NULL DEFAULT '0' COMMENT '是否删除',
    `delete_time`       datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`         bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`         bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`           bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `unit_id`           int                                                                   DEFAULT NULL COMMENT '单位ID',
    `brand_id`          int                                                                   DEFAULT NULL COMMENT '品牌ID',
    `enable_shelf_life` bit(1)                                                                DEFAULT b'0' COMMENT '是否开启保质期批次',
    `enable_attr`       bit(1)                                                                DEFAULT b'0' COMMENT '是否开启辅助属性',
    `enable_multi_unit` bit(1)                                                                DEFAULT b'0' COMMENT '是否开启多单位',
    `disabled`          bit(1)                                                                DEFAULT b'0' COMMENT '0-启用 1-禁用',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品';

-- ----------------------------
-- Table structure for t_erp_spu_attrs
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_attrs`;
CREATE TABLE `t_erp_spu_attrs`
(
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `attrs`          json                                                          DEFAULT NULL COMMENT 'spu属性',
    `spu_no`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spu编码',
    `spu_id`         int                                                           DEFAULT NULL COMMENT 'spu_id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='SPU属性关系';

-- ----------------------------
-- Table structure for t_erp_spu_file
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_file`;
CREATE TABLE `t_erp_spu_file`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `spu_id`         bigint                                                        DEFAULT NULL COMMENT 'spuid',
    `spu_no`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT 'spu编号',
    `file_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件路径',
    `is_main`        bit(1)                                                        DEFAULT b'0' COMMENT '是否主图',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_spu_id` (`spu_id`) USING BTREE COMMENT 'spuid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='spu文件';

-- ----------------------------
-- Table structure for t_erp_spu_package
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_package`;
CREATE TABLE `t_erp_spu_package`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `code`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '编码',
    `price`          decimal(10, 2)                                                DEFAULT NULL COMMENT '套餐价格',
    `state`          bit(1)                                                        DEFAULT NULL COMMENT '0-禁用 1-启用',
    `goods_name`     varchar(255) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '商品名称，多个逗号拼接',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品套餐\n';

-- ----------------------------
-- Table structure for t_erp_spu_package_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_package_detail`;
CREATE TABLE `t_erp_spu_package_detail`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `sku_id`         bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `spu_id`         bigint                                                        DEFAULT NULL COMMENT 'spuid',
    `quantity`       decimal(10, 2)                                                DEFAULT NULL COMMENT '数量',
    `price`          decimal(10, 2)                                                DEFAULT NULL COMMENT '单价',
    `amount`         decimal(10, 2)                                                DEFAULT NULL COMMENT '总价',
    `package_id`     bigint                                                        DEFAULT NULL COMMENT '套餐ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品套餐明细';

-- ----------------------------
-- Table structure for t_erp_spu_template
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_template`;
CREATE TABLE `t_erp_spu_template`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `code`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '编码',
    `enabled`        bit(1)                                                        DEFAULT NULL COMMENT '0-禁用 1-启用',
    `goods_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称，多个逗号拼接',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品模板';

-- ----------------------------
-- Table structure for t_erp_spu_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_erp_spu_template_detail`;
CREATE TABLE `t_erp_spu_template_detail`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `sku_id`         bigint                                                        DEFAULT NULL COMMENT 'skuid',
    `spu_id`         bigint                                                        DEFAULT NULL COMMENT 'spuid',
    `quantity`       decimal(10, 2)                                                DEFAULT NULL COMMENT '数量',
    `template_id`    bigint                                                        DEFAULT NULL COMMENT '模板ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品模板明细';

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`
(
    `feedback_id`         bigint   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `feedback_content`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '反馈内容',
    `feedback_attachment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反馈图片',
    `user_type`           int      NOT NULL COMMENT '创建人用户类型',
    `sort_value`          int                                                           DEFAULT '0' COMMENT '排序',
    `remark`              varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`           bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`         datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`           bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`           bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`             bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`          bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`feedback_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='意见反馈';

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`
(
    `file_id`           bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `folder_type`       tinyint unsigned NOT NULL COMMENT '文件夹类型',
    `file_name`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '文件名称',
    `file_size`         int                                                                    DEFAULT NULL COMMENT '文件大小',
    `file_key`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件key，用于文件下载',
    `file_type`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '文件类型',
    `creator_user_type` int                                                                    DEFAULT NULL COMMENT '创建人用户类型',
    `sort_value`        int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`       datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`         bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`       tinyint                                                       NOT NULL DEFAULT '0' COMMENT '是否删除',
    `delete_time`       datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`         bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`       datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`         bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`           bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    PRIMARY KEY (`file_id`) USING BTREE,
    UNIQUE KEY `uk_file_key` (`file_key`) USING BTREE,
    KEY                 `module_id_module_type` (`folder_type`) USING BTREE,
    KEY                 `module_type` (`folder_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='文件';

-- ----------------------------
-- Table structure for t_heart_beat_record
-- ----------------------------
DROP TABLE IF EXISTS `t_heart_beat_record`;
CREATE TABLE `t_heart_beat_record`
(
    `heart_beat_record_id` int                                                           NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `project_path`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目名称',
    `server_ip`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务器ip',
    `process_no`           int                                                           NOT NULL COMMENT '进程号',
    `process_start_time`   datetime                                                      NOT NULL COMMENT '进程开启时间',
    `heart_beat_time`      datetime                                                      NOT NULL COMMENT '心跳时间',
    `sort_value`           int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`               varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`          datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`            bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`          datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`            bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`          datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`            bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`              bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`           bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`heart_beat_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='公用服务 - 服务心跳';

-- ----------------------------
-- Table structure for t_help_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc`;
CREATE TABLE `t_help_doc`
(
    `help_doc_id`         bigint                                                        NOT NULL AUTO_INCREMENT,
    `help_doc_catalog_id` bigint                                                        NOT NULL COMMENT '类型1公告 2动态',
    `title`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `content_text`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文本内容',
    `content_html`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'html内容',
    `attachment`          varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '附件',
    `sort_value`          int                                                           NOT NULL DEFAULT '0' COMMENT '排序',
    `page_view_count`     int                                                           NOT NULL DEFAULT '0' COMMENT '页面浏览量，传说中的pv',
    `user_view_count`     int                                                           NOT NULL DEFAULT '0' COMMENT '用户浏览量，传说中的uv',
    `author`              varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '作者',
    `remark`              varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`         datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`           bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`         datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`           bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`         datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`           bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`             bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`          bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`help_doc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档';

-- ----------------------------
-- Table structure for t_help_doc_catalog
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc_catalog`;
CREATE TABLE `t_help_doc_catalog`
(
    `help_doc_catalog_id` bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '帮助文档目录',
    `name`                varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
    `sort_value`          int                                                            NOT NULL DEFAULT '0' COMMENT '排序字段',
    `pid`                 bigint                                                         NOT NULL COMMENT '父级id',
    `remark`              varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '备注',
    `update_time`         datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`           bigint                                                                  DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '更新人名称',
    `delete_time`         datetime                                                                DEFAULT NULL COMMENT '删除时间',
    `delete_by`           bigint                                                                  DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '删除人名称',
    `create_time`         datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`           bigint                                                                  DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '创建人名称',
    `dept_id`             bigint                                                                  DEFAULT NULL COMMENT '部门ID',
    `is_deleted`          bit(1)                                                         NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`help_doc_catalog_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档-目录';

-- ----------------------------
-- Table structure for t_help_doc_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc_relation`;
CREATE TABLE `t_help_doc_relation`
(
    `relation_id`    bigint   NOT NULL COMMENT '关联id',
    `relation_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联名称',
    `help_doc_id`    bigint   NOT NULL COMMENT '文档id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`relation_id`, `help_doc_id`) USING BTREE,
    UNIQUE KEY `uni_menu_help_doc` (`relation_id`,`help_doc_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档-关联表';

-- ----------------------------
-- Table structure for t_help_doc_view_record
-- ----------------------------
DROP TABLE IF EXISTS `t_help_doc_view_record`;
CREATE TABLE `t_help_doc_view_record`
(
    `help_doc_id`      bigint   NOT NULL COMMENT '通知公告id',
    `user_id`          bigint   NOT NULL COMMENT '用户id',
    `user_name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '用户名称',
    `page_view_count`  int                                                            DEFAULT '0' COMMENT '查看次数',
    `first_ip`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '首次ip',
    `first_user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首次用户设备等标识',
    `last_ip`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '最后一次ip',
    `last_user_agent`  varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后一次用户设备等标识',
    `sort_value`       int                                                            DEFAULT '0' COMMENT '排序',
    `remark`           varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '备注',
    `update_time`      datetime NOT NULL                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`        bigint                                                         DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '更新人名称',
    `delete_time`      datetime                                                       DEFAULT NULL COMMENT '删除时间',
    `delete_by`        bigint                                                         DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '删除人名称',
    `create_time`      datetime NOT NULL                                              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`        bigint                                                         DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '创建人名称',
    `dept_id`          bigint                                                         DEFAULT NULL COMMENT '部门ID',
    `is_deleted`       bit(1)   NOT NULL                                              DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`help_doc_id`, `user_id`) USING BTREE,
    UNIQUE KEY `uk_notice_employee` (`help_doc_id`,`user_id`) USING BTREE COMMENT '资讯员工'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='帮助文档-查看记录';

-- ----------------------------
-- Table structure for t_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_invoice`;
CREATE TABLE `t_invoice`
(
    `invoice_id`                     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '发票信息ID',
    `invoice_heads`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开票抬头',
    `taxpayer_identification_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '纳税人识别号',
    `account_number`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行账户',
    `bank_name`                      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户行',
    `enterprise_id`                  bigint                                                        NOT NULL COMMENT '企业ID',
    `disabled_flag`                  tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态',
    `sort_value`                     int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`                         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`                    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`                      bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`                    datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`                      bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`                    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`                      bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`                        bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`                     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`invoice_id`) USING BTREE,
    KEY                              `idx_enterprise_id` (`enterprise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='发票信息\n';

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`
(
    `job_id`          bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin          DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  tinyint                                                         DEFAULT '0' COMMENT '计划执行错误策略（0-默认 1立即执行 2执行一次 3放弃执行）',
    `concurrent`      bit(1)                                                          DEFAULT b'1' COMMENT '是否并发执行（1-允许 0-禁止）',
    `status`          bit(1)                                                          DEFAULT b'1' COMMENT '状态（1-正常 0-暂停）',
    `code`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin           DEFAULT NULL COMMENT '任务唯一key',
    `sort_value`      int                                                             DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '备注',
    `update_time`     datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                          DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '更新人名称',
    `delete_time`     datetime                                                        DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                          DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                          DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                          DEFAULT NULL COMMENT '部门ID',
    `is_deleted`      bit(1)                                                 NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度表';

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log`
(
    `job_log_id`     bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_id`         bigint                                                          DEFAULT NULL COMMENT '任务ID',
    `job_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin          DEFAULT NULL COMMENT '日志信息',
    `status`         bit(1)                                                          DEFAULT b'1' COMMENT '执行状态（1正常 0-失败）',
    `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin         DEFAULT '' COMMENT '异常信息',
    `sort_value`     int                                                             DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                          DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                        DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                          DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                          DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                          DEFAULT NULL COMMENT '部门ID',
    `start_time`     datetime                                                        DEFAULT NULL COMMENT '开始执行时间',
    `end_time`       datetime                                                        DEFAULT NULL COMMENT '执行结束时间',
    `is_deleted`     bit(1)                                                 NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定时任务调度日志表';

-- ----------------------------
-- Table structure for t_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `t_login_fail`;
CREATE TABLE `t_login_fail`
(
    `login_fail_id`         bigint   NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `user_id`               bigint   NOT NULL COMMENT '用户id',
    `user_type`             int      NOT NULL COMMENT '用户类型',
    `login_name`            varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录名',
    `login_fail_count`      int                                                            DEFAULT NULL COMMENT '连续登录失败次数',
    `lock_flag`             tinyint                                                        DEFAULT '0' COMMENT '锁定状态:1锁定，0未锁定',
    `login_lock_begin_time` datetime                                                       DEFAULT NULL COMMENT '连续登录失败锁定开始时间',
    `sort_value`            int                                                            DEFAULT '0' COMMENT '排序',
    `remark`                varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '备注',
    `update_time`           datetime NOT NULL                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`             bigint                                                         DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`           datetime                                                       DEFAULT NULL COMMENT '删除时间',
    `delete_by`             bigint                                                         DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '删除人名称',
    `create_time`           datetime NOT NULL                                              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`             bigint                                                         DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '创建人名称',
    `dept_id`               bigint                                                         DEFAULT NULL COMMENT '部门ID',
    `is_deleted`            bit(1)   NOT NULL                                              DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`login_fail_id`) USING BTREE,
    UNIQUE KEY `uid_and_utype` (`user_id`,`user_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='登录失败次数记录表';

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`
(
    `login_log_id`    bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`         int                                                            NOT NULL COMMENT '用户id',
    `user_type`       int                                                            NOT NULL COMMENT '用户类型',
    `user_name`       varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
    `login_ip`        varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '用户ip',
    `login_ip_region` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '用户ip地区',
    `user_agent`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'user-agent信息',
    `login_result`    int                                                            NOT NULL COMMENT '登录结果：0成功 1失败 2 退出',
    `sort_value`      int                                                                     DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '备注',
    `update_time`     datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                                  DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '更新人名称',
    `delete_time`     datetime                                                                DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                                  DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                                  DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                                  DEFAULT NULL COMMENT '部门ID',
    `is_deleted`      bit(1)                                                         NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`login_log_id`) USING BTREE,
    KEY               `customer_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户登录日志';

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`
(
    `menu_id`         bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `menu_type`       int                                                           NOT NULL COMMENT '类型',
    `pid`             bigint                                                        NOT NULL COMMENT '父菜单ID',
    `sort_value`      int                                                                    DEFAULT NULL COMMENT '显示顺序',
    `path`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '路由地址',
    `component`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '组件路径',
    `perms_type`      int                                                                    DEFAULT NULL COMMENT '权限类型',
    `api_perms`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '后端权限字符串',
    `web_perms`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '前端权限字符串',
    `icon`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '菜单图标',
    `context_menu_id` bigint                                                                 DEFAULT NULL COMMENT '功能点关联菜单ID',
    `is_frame`        bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否为外链',
    `frame_url`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '外链地址',
    `is_cached`       bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否缓存',
    `is_visible`      bit(1)                                                        NOT NULL DEFAULT b'1' COMMENT '显示状态',
    `is_disabled`     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '禁用状态 1-禁用 0-启用',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`     datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`     datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`      bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`
(
    `notice_id`              bigint                                                        NOT NULL AUTO_INCREMENT,
    `notice_type_id`         bigint                                                        NOT NULL COMMENT '类型1公告 2动态',
    `title`                  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `all_visible_flag`       tinyint(1) NOT NULL COMMENT '是否全部可见',
    `scheduled_publish_flag` tinyint(1) NOT NULL COMMENT '是否定时发布',
    `publish_time`           datetime                                                      NOT NULL COMMENT '发布时间',
    `content_text`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文本内容',
    `content_html`           text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'html内容',
    `attachment`             varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '附件',
    `page_view_count`        int                                                           NOT NULL DEFAULT '0' COMMENT '页面浏览量，传说中的pv',
    `user_view_count`        int                                                           NOT NULL DEFAULT '0' COMMENT '用户浏览量，传说中的uv',
    `source`                 varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '来源',
    `author`                 varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '作者',
    `document_number`        varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '文号，如：1024创新实验室发〔2022〕字第36号',
    `sort_value`             int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`                 varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`            datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`              bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`            datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `is_deleted`             bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `delete_by`              bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`            datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`              bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`                bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知';

-- ----------------------------
-- Table structure for t_notice_type
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_type`;
CREATE TABLE `t_notice_type`
(
    `notice_type_id`   bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '通知类型',
    `notice_type_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
    `sort_value`       int                                                                     DEFAULT '0' COMMENT '排序',
    `remark`           varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '备注',
    `update_time`      datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`        bigint                                                                  DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '更新人名称',
    `delete_time`      datetime                                                                DEFAULT NULL COMMENT '删除时间',
    `delete_by`        bigint                                                                  DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '删除人名称',
    `create_time`      datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`        bigint                                                                  DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci            DEFAULT NULL COMMENT '创建人名称',
    `dept_id`          bigint                                                                  DEFAULT NULL COMMENT '部门ID',
    `is_deleted`       bit(1)                                                         NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`notice_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知类型';

-- ----------------------------
-- Table structure for t_notice_view_record
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_view_record`;
CREATE TABLE `t_notice_view_record`
(
    `notice_id`        bigint   NOT NULL COMMENT '通知公告id',
    `employee_id`      bigint   NOT NULL COMMENT '员工id',
    `page_view_count`  int                                                            DEFAULT '0' COMMENT '查看次数',
    `first_ip`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '首次ip',
    `first_user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '首次用户设备等标识',
    `last_ip`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '最后一次ip',
    `last_user_agent`  varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后一次用户设备等标识',
    `sort_value`       int                                                            DEFAULT '0' COMMENT '排序',
    `remark`           varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '备注',
    `update_time`      datetime NOT NULL                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`        bigint                                                         DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`      datetime                                                       DEFAULT NULL COMMENT '删除时间',
    `delete_by`        bigint                                                         DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '删除人名称',
    `create_time`      datetime NOT NULL                                              DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`        bigint                                                         DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   DEFAULT NULL COMMENT '创建人名称',
    `dept_id`          bigint                                                         DEFAULT NULL COMMENT '部门ID',
    `is_deleted`       bit(1)   NOT NULL                                              DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`notice_id`, `employee_id`) USING BTREE,
    UNIQUE KEY `uk_notice_employee` (`notice_id`,`employee_id`) USING BTREE COMMENT '资讯员工'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知查看记录';

-- ----------------------------
-- Table structure for t_notice_visible_range
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_visible_range`;
CREATE TABLE `t_notice_visible_range`
(
    `notice_id`      bigint   NOT NULL COMMENT '资讯id',
    `data_type`      tinyint  NOT NULL COMMENT '数据类型1员工 2部门',
    `data_id`        bigint   NOT NULL COMMENT '员工or部门id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    UNIQUE KEY `uk_notice_data` (`notice_id`,`data_type`,`data_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知可见范围';

-- ----------------------------
-- Table structure for t_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_log`;
CREATE TABLE `t_operate_log`
(
    `operate_log_id`    bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `operate_user_id`   bigint                                                       NOT NULL COMMENT '用户id',
    `operate_user_type` int                                                          NOT NULL COMMENT '用户类型',
    `operate_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名称',
    `module`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '操作模块',
    `content`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '操作内容',
    `url`               varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '请求路径',
    `method`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '请求方法',
    `param`             text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
    `ip`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         DEFAULT NULL COMMENT '请求ip',
    `ip_region`         varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci        DEFAULT NULL COMMENT '请求ip地区',
    `user_agent`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求user-agent',
    `success_flag`      tinyint                                                               DEFAULT NULL COMMENT '请求结果 0失败 1成功',
    `fail_reason`       longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '失败原因',
    `sort_value`        int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`         bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`       datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`         bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`         bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`           bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `is_deleted`        bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`operate_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='操作记录';

-- ----------------------------
-- Table structure for t_package
-- ----------------------------
DROP TABLE IF EXISTS `t_package`;
CREATE TABLE `t_package`
(
    `id`             int      NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '套餐名称',
    `price`          decimal(10, 2)                                                DEFAULT NULL COMMENT '单价',
    `emp_num`        int                                                           DEFAULT NULL COMMENT '员工数',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统套餐';

-- ----------------------------
-- Table structure for t_reload_item
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_item`;
CREATE TABLE `t_reload_item`
(
    `tag`            varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '项名称',
    `args`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '参数 可选',
    `identification` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '运行标识',
    `sort_value`     int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `delete_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '删除时间',
    PRIMARY KEY (`tag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='reload项目';

-- ----------------------------
-- Table structure for t_reload_result
-- ----------------------------
DROP TABLE IF EXISTS `t_reload_result`;
CREATE TABLE `t_reload_result`
(
    `tag`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `identification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '运行标识',
    `args`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `result`         tinyint unsigned NOT NULL COMMENT '是否成功 ',
    `exception`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `sort_value`     int                                                                    DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                 DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                               DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                 DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                 DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                 DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                        NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='reload结果';

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`
(
    `role_id`        bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_name`      varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
    `role_code`      varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci         DEFAULT NULL COMMENT '角色编码',
    `sort_value`     int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`role_id`) USING BTREE,
    UNIQUE KEY `role_code_uni` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Table structure for t_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_scope`;
CREATE TABLE `t_role_data_scope`
(
    `id`              bigint   NOT NULL AUTO_INCREMENT,
    `data_scope_type` int      NOT NULL COMMENT '数据范围id',
    `view_type`       int      NOT NULL COMMENT '数据范围类型',
    `role_id`         bigint   NOT NULL COMMENT '角色id',
    `sort_value`      int                                                           DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`     datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`      bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色的数据范围';

-- ----------------------------
-- Table structure for t_role_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_role_employee`;
CREATE TABLE `t_role_employee`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT,
    `role_id`        bigint   NOT NULL COMMENT '角色id',
    `employee_id`    bigint   NOT NULL COMMENT '员工id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `uk_role_employee` (`role_id`,`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色员工功能表';

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`
(
    `role_menu_id`   bigint   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `role_id`        bigint   NOT NULL COMMENT '角色id',
    `menu_id`        bigint   NOT NULL COMMENT '菜单id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`role_menu_id`) USING BTREE,
    KEY              `idx_role_id` (`role_id`) USING BTREE,
    KEY              `idx_menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色-菜单\n';

-- ----------------------------
-- Table structure for t_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `t_serial_number`;
CREATE TABLE `t_serial_number`
(
    `serial_number_id`  int                                                          NOT NULL,
    `business_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务名称',
    `format`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '格式[yyyy]表示年,[mm]标识月,[dd]表示日,[nnn]表示三位数字',
    `rule_type`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则格式。none没有周期, year 年周期, month月周期, day日周期',
    `init_number`       int unsigned NOT NULL COMMENT '初始值',
    `step_random_range` int unsigned NOT NULL COMMENT '步长随机数',
    `last_number`       bigint                                                                DEFAULT NULL COMMENT '上次产生的单号, 默认为空',
    `last_time`         datetime                                                              DEFAULT NULL COMMENT '上次产生的单号时间',
    `sort_value`        int                                                                   DEFAULT '0' COMMENT '排序',
    `remark`            varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '备注',
    `update_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`         bigint                                                                DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人名称',
    `delete_time`       datetime                                                              DEFAULT NULL COMMENT '删除时间',
    `delete_by`         bigint                                                                DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '删除人名称',
    `create_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`         bigint                                                                DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人名称',
    `dept_id`           bigint                                                                DEFAULT NULL COMMENT '部门ID',
    `is_deleted`        bit(1)                                                       NOT NULL DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`serial_number_id`) USING BTREE,
    UNIQUE KEY `key_name` (`business_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单号生成器定义表';

-- ----------------------------
-- Table structure for t_serial_number_record
-- ----------------------------
DROP TABLE IF EXISTS `t_serial_number_record`;
CREATE TABLE `t_serial_number_record`
(
    `serial_number_id` int      NOT NULL COMMENT '单号id',
    `record_date`      date     NOT NULL COMMENT '记录日期',
    `last_number`      bigint   NOT NULL                                             DEFAULT '0' COMMENT '最后更新值',
    `last_time`        datetime NOT NULL COMMENT '最后更新时间',
    `count`            bigint   NOT NULL                                             DEFAULT '0' COMMENT '更新次数',
    `sort_value`       int                                                           DEFAULT '0' COMMENT '排序',
    `remark`           varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`      datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`        bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`      datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`        bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`      datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`        bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`          bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`       bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    KEY                `uk_generator` (`serial_number_id`,`record_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='serial_number记录表';

-- ----------------------------
-- Table structure for t_spu_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_spu_unit`;
CREATE TABLE `t_spu_unit`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `unit_id`        bigint                                                        DEFAULT NULL COMMENT '单位ID',
    `unit_name`      varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '单位名称',
    `is_basic_unit`  bit(1)                                                        DEFAULT b'0' COMMENT '是否基础单位 1-是',
    `quantity`       int                                                           DEFAULT NULL COMMENT '换算数量',
    `spu_id`         bigint                                                        DEFAULT NULL COMMENT 'spuid',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品单位';

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(128) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '名称',
    `is_default`     bit(1)                                                        DEFAULT NULL COMMENT '是否默认',
    `code`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '供应商编码',
    `category_id`    bigint                                                        DEFAULT NULL COMMENT '类别id',
    `contacts`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系人',
    `address`        varchar(128) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '联系地址',
    `phone`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系电话',
    `work_telephone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '单位电话',
    `email`          varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '邮箱',
    `wechat`         varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '微信号',
    `postal`         varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '邮编',
    `qq`             varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT 'QQ',
    `tax`            varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '传真',
    `is_disabled`    bit(1)                                                        DEFAULT NULL COMMENT '禁用状态 1-禁用 0-启用',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `origin_debt`    decimal(10, 2)                                                DEFAULT NULL COMMENT '初始欠款',
    `debt`           decimal(10, 2)                                                DEFAULT NULL COMMENT '欠款',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ERP供应商';

-- ----------------------------
-- Table structure for t_supplier_category
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier_category`;
CREATE TABLE `t_supplier_category`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 true-删除 false-未删除',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '名称',
    `pid`            bigint                                                        DEFAULT NULL COMMENT '父节点ID',
    `level`          tinyint                                                       DEFAULT NULL COMMENT '层级',
    `leaf`           bit(1)                                                        DEFAULT b'0' COMMENT '是否叶子节点',
    `path`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '完整父级路径（英文逗号拼接）\n根节点ID,一级ID,二级ID',
    `is_default`     bit(1)                                                        DEFAULT b'0' COMMENT '是否默认 true-默认',
    `is_disabled`    bit(1)                                                        DEFAULT b'0' COMMENT '禁用状态 1-禁用 0-启用',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ERP供应商类别';

-- ----------------------------
-- Table structure for t_table_column
-- ----------------------------
DROP TABLE IF EXISTS `t_table_column`;
CREATE TABLE `t_table_column`
(
    `table_column_id` bigint   NOT NULL AUTO_INCREMENT,
    `user_id`         bigint   NOT NULL COMMENT '用户id',
    `user_type`       int      NOT NULL COMMENT '用户类型',
    `table_id`        int      NOT NULL COMMENT '表格id',
    `columns`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '具体的表格列，存入的json',
    `sort_value`      int                                                           DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`     datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`      bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`table_column_id`) USING BTREE,
    UNIQUE KEY `uni_employee_table` (`user_id`,`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='表格的自定义列存储';

-- ----------------------------
-- Table structure for t_tenant
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant`;
CREATE TABLE `t_tenant`
(
    `id`              bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `name`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `code`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '代码',
    `sort_value`      int                                                           DEFAULT '0' COMMENT '排序',
    `remark`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`       bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_flag`     tinyint  NOT NULL                                             DEFAULT '0' COMMENT '是否删除',
    `delete_time`     datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`       bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`     datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`       bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`         bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `industry_id`     bigint                                                        DEFAULT NULL COMMENT '行业ID',
    `contact`         varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '联系人',
    `tel`             varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '联系电话',
    `email`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '邮箱',
    `address`         varchar(255) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '公司地址',
    `web_site`        varchar(255) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '公司网址',
    `expiration_date` date                                                          DEFAULT NULL COMMENT '到期时间',
    `type`            tinyint                                                       DEFAULT NULL COMMENT '类型 1-试用 2-付费',
    `package_id`      bigint                                                        DEFAULT NULL COMMENT '当前套餐ID',
    `is_deleted`      bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='租户';

-- ----------------------------
-- Table structure for t_tenant_industry
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant_industry`;
CREATE TABLE `t_tenant_industry`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '名称',
    `icon`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '图标',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    `is_disabled`    bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '禁用状态 true-禁用 false-启用',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='租户所属行业';

-- ----------------------------
-- Table structure for t_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '名称',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='单位';

-- ----------------------------
-- Table structure for t_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `t_warehouse`;
CREATE TABLE `t_warehouse`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `code`           varchar(32) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '编号',
    `name`           varchar(64) COLLATE utf8mb4_general_ci                        DEFAULT NULL COMMENT '仓库名称',
    `category_id`    bigint                                                        DEFAULT NULL COMMENT '仓库类目ID',
    `is_default`     bit(1)                                                        DEFAULT b'0' COMMENT '默认仓库 1-是',
    `contact`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系人',
    `tel`            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '联系电话',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='仓库';

-- ----------------------------
-- Table structure for t_warehouse_category
-- ----------------------------
DROP TABLE IF EXISTS `t_warehouse_category`;
CREATE TABLE `t_warehouse_category`
(
    `id`             bigint   NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `sort_value`     int                                                           DEFAULT '0' COMMENT '排序',
    `remark`         varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
    `update_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `update_by`      bigint                                                        DEFAULT NULL COMMENT '更新人ID',
    `update_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '更新人名称',
    `delete_time`    datetime                                                      DEFAULT NULL COMMENT '删除时间',
    `delete_by`      bigint                                                        DEFAULT NULL COMMENT '删除人ID',
    `delete_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '删除人名称',
    `create_time`    datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`      bigint                                                        DEFAULT NULL COMMENT '创建人ID',
    `create_by_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '创建人名称',
    `dept_id`        bigint                                                        DEFAULT NULL COMMENT '部门ID',
    `name`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '仓库名称',
    `is_deleted`     bit(1)   NOT NULL                                             DEFAULT b'0' COMMENT '是否删除 1-删除 0-未删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='仓库类目';

SET
FOREIGN_KEY_CHECKS = 1;
