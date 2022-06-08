/*
 Navicat Premium Data Transfer

 Source Server         : master
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 192.168.164.128:3306
 Source Schema         : sa_ddcat

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 08/06/2022 17:31:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门编号',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `flag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'logo',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, -1, 'DD-CAT', '000000', 0, 'admin', '15888888888', 'admin@qq.com', NULL, '2020-12-01 11:33:00', NULL, '2022-06-08 17:17:02', b'0', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '深圳总公司', '100100', 1, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:17:12', b'0', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '长沙分公司', '100200', 2, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:17:19', b'0', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '研发部门', '100101', 1, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:17:27', b'0', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '市场部门', '100102', 2, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:17:37', b'0', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '测试部门', '100103', 3, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:17:41', b'0', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '财务部门', '100104', 4, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:17:46', b'0', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '运维部门', '100105', 5, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:18:02', b'0', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '市场部门', '100201', 1, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:18:08', b'0', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '财务部门', '100202', 2, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2022-06-08 17:18:13', b'0', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `flag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_del_flag`(`flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'dict_type', '字典类型', NULL, '2019-05-16 14:16:20', NULL, '2021-05-24 01:44:55', '系统类不能修改', b'0');
INSERT INTO `sys_dict` VALUES (2, 'log_type', '日志类型', NULL, '2020-03-13 14:21:01', NULL, '2021-05-24 01:44:56', '0-正常 1 异常', b'0');
INSERT INTO `sys_dict` VALUES (3, 'sys_normal_disable', '通用状态', NULL, '2020-12-07 16:05:57', NULL, '2021-05-24 01:44:56', NULL, b'0');
INSERT INTO `sys_dict` VALUES (4, 'sys_show_hide', '显示状态', NULL, '2020-12-07 17:27:03', NULL, '2021-05-24 01:44:59', NULL, b'0');
INSERT INTO `sys_dict` VALUES (5, 'sys_user_sex', '性别', 1, '2021-11-17 14:38:24', NULL, '2022-06-07 14:03:14', NULL, b'0');
INSERT INTO `sys_dict` VALUES (6, 'test1', '测试', 1, '2022-06-07 14:04:30', NULL, '2022-06-07 14:04:34', NULL, b'0');
INSERT INTO `sys_dict` VALUES (7, 'test', '测试1', 1, '2022-06-07 14:05:04', NULL, '2022-06-07 06:06:21', NULL, b'1');

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序（升序）',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `flag` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, 'dict_type', '系统类', '1', 0, b'0', '不能修改删除', NULL, '2019-05-16 14:20:40', NULL, '2022-06-06 09:10:31', b'0');
INSERT INTO `sys_dict_item` VALUES (2, 'dict_type', '业务类', '0', 1, b'0', '可以修改', NULL, '2019-05-16 14:20:59', NULL, '2022-06-06 09:10:31', b'0');
INSERT INTO `sys_dict_item` VALUES (3, 'sys_normal_disable', '正常', '0', 0, b'0', 'ddd', NULL, '2020-12-07 16:04:41', NULL, '2022-06-07 15:52:37', b'0');
INSERT INTO `sys_dict_item` VALUES (4, 'sys_normal_disable', '停用', '1', 1, b'0', NULL, NULL, '2020-12-07 16:05:23', NULL, '2022-06-07 07:22:09', b'0');
INSERT INTO `sys_dict_item` VALUES (5, 'sys_show_hide', '显示', '0', 0, b'0', NULL, NULL, '2020-12-07 17:27:35', NULL, '2022-06-06 09:10:31', b'0');
INSERT INTO `sys_dict_item` VALUES (6, 'sys_show_hide', '隐藏', '1', 0, b'0', NULL, NULL, '2020-12-07 17:28:02', NULL, '2022-06-06 09:10:31', b'0');
INSERT INTO `sys_dict_item` VALUES (7, 'sys_user_sex', '男', '0', 0, b'0', NULL, NULL, '2020-12-07 17:28:02', NULL, '2022-06-07 07:22:12', b'0');
INSERT INTO `sys_dict_item` VALUES (8, 'sys_user_sex', '女', '1', 1, b'0', NULL, NULL, '2020-12-07 17:28:02', NULL, '2022-06-07 07:22:14', b'0');
INSERT INTO `sys_dict_item` VALUES (9, 'test1', 'c1', '0', 2, NULL, 'dfd', 1, '2022-06-07 14:17:18', NULL, '2022-06-07 08:02:05', b'1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `localhost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 812 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'GET', NULL, NULL, '2021-12-22 02:23:38', '/auth/login', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (2, 'GET', NULL, NULL, '2021-12-22 02:23:38', '/favicon.ico', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (3, 'GET', NULL, NULL, '2021-12-22 02:25:08', '/auth/login', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (4, 'POST', '{\"key\":\"admin\",\"password\":\"123456\"}', NULL, '2022-04-20 07:01:13', '/auth/login', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (5, 'GET', NULL, NULL, '2022-04-20 07:01:13', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (6, 'GET', NULL, NULL, '2022-04-20 07:01:13', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (7, 'GET', NULL, NULL, '2022-04-20 07:01:57', '/menu/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (8, 'GET', NULL, NULL, '2022-04-20 07:01:57', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (9, 'GET', NULL, NULL, '2022-04-20 07:01:57', '/dict/item/type/sys_show_hide', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (10, 'POST', '{}', NULL, '2022-04-20 07:01:58', '/dept/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (11, 'GET', NULL, NULL, '2022-04-20 07:01:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (12, 'GET', NULL, NULL, '2022-04-20 07:02:01', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (13, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-04-20 07:02:01', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (14, 'GET', NULL, NULL, '2022-04-20 07:19:51', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (15, 'GET', NULL, NULL, '2022-04-20 07:19:51', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (16, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-04-20 07:19:51', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (17, 'GET', NULL, NULL, '2022-04-20 07:19:51', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (18, 'GET', NULL, NULL, '2022-04-20 07:20:03', '/menu/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (19, 'GET', NULL, NULL, '2022-04-20 07:20:04', '/dict/item/type/sys_show_hide', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (20, 'GET', NULL, NULL, '2022-04-20 07:20:04', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (21, 'GET', NULL, NULL, '2022-04-20 07:20:06', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (22, 'GET', NULL, NULL, '2022-04-20 07:20:06', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (23, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-04-20 07:20:06', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (24, 'GET', NULL, NULL, '2022-04-20 07:20:06', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (25, 'POST', '{\"key\":\"admin\",\"password\":\"123456\"}', NULL, '2022-05-11 02:26:06', '/auth/login', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (26, 'GET', NULL, NULL, '2022-05-11 02:26:06', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (27, 'DELETE', NULL, NULL, '2022-05-11 02:26:06', '/auth/logout', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (28, 'POST', '{\"key\":\"admin\",\"password\":\"123456\"}', NULL, '2022-05-11 02:51:54', '/auth/login', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (29, 'GET', NULL, NULL, '2022-05-11 02:51:54', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (30, 'GET', NULL, NULL, '2022-05-11 02:51:55', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (31, 'GET', NULL, NULL, '2022-05-11 03:01:47', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (32, 'GET', NULL, NULL, '2022-05-11 03:01:47', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (33, 'GET', NULL, NULL, '2022-05-11 03:01:58', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (34, 'GET', NULL, NULL, '2022-05-11 03:01:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (35, 'GET', NULL, NULL, '2022-05-11 03:01:58', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (36, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-05-11 03:01:58', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (37, 'GET', NULL, NULL, '2022-05-11 03:02:08', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (38, 'GET', NULL, NULL, '2022-05-11 03:02:08', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (39, 'GET', NULL, NULL, '2022-05-11 03:02:09', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (40, 'GET', NULL, NULL, '2022-05-11 03:02:09', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (41, 'GET', NULL, NULL, '2022-05-11 03:02:09', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (42, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-05-11 03:02:09', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (43, 'GET', NULL, NULL, '2022-05-11 03:03:12', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (44, 'GET', NULL, NULL, '2022-05-11 03:03:12', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (45, 'GET', NULL, NULL, '2022-05-11 03:03:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (46, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-05-11 03:03:13', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (47, 'GET', NULL, NULL, '2022-05-11 03:03:13', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (48, 'GET', NULL, NULL, '2022-05-11 03:03:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (49, 'GET', NULL, NULL, '2022-05-11 03:18:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (50, 'GET', NULL, NULL, '2022-05-11 03:18:31', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (51, 'GET', NULL, NULL, '2022-05-11 03:20:49', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (52, 'GET', NULL, NULL, '2022-05-11 03:20:49', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (53, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-05-11 03:20:50', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (54, 'GET', NULL, NULL, '2022-05-11 03:20:50', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (55, 'GET', NULL, NULL, '2022-05-11 03:20:50', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (56, 'GET', NULL, NULL, '2022-05-11 03:20:50', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (57, 'GET', NULL, NULL, '2022-05-11 03:20:52', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (58, 'GET', NULL, NULL, '2022-05-11 03:20:52', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (59, 'GET', NULL, NULL, '2022-05-11 03:21:32', '/menu/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (60, 'GET', NULL, NULL, '2022-05-11 03:21:32', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (61, 'GET', NULL, NULL, '2022-05-11 03:21:32', '/dict/item/type/sys_show_hide', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (62, 'GET', NULL, NULL, '2022-05-11 03:21:35', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (63, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-05-11 03:21:35', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (64, 'POST', NULL, NULL, '2022-05-11 03:21:38', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (65, 'GET', NULL, NULL, '2022-05-11 03:21:38', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (66, 'GET', NULL, NULL, '2022-05-11 03:21:38', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (67, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-05-11 03:21:39', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (68, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-05-11 03:21:44', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (69, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-05-11 03:23:02', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (70, 'GET', NULL, NULL, '2022-05-20 11:35:57', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (71, 'GET', NULL, NULL, '2022-05-20 11:35:57', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (72, 'GET', NULL, NULL, '2022-05-20 11:35:57', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (73, 'POST', NULL, NULL, '2022-05-20 11:35:58', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (74, 'GET', NULL, NULL, '2022-05-20 11:35:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (75, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-05-20 11:35:58', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (76, 'POST', '{\"key\":\"admin\",\"password\":\"123456\"}', NULL, '2022-06-06 06:42:38', '/auth/login', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (77, 'GET', NULL, NULL, '2022-06-06 06:42:39', '/user/info', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (78, 'GET', NULL, NULL, '2022-06-06 06:42:39', '/menu', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (79, 'GET', NULL, NULL, '2022-06-06 06:42:45', '/dept/tree', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (80, 'GET', NULL, NULL, '2022-06-06 06:42:45', '/dict/item/type/sys_user_sex', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (81, 'GET', NULL, NULL, '2022-06-06 06:42:45', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (82, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 06:42:46', '/user/page', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (83, 'GET', NULL, NULL, '2022-06-06 06:42:47', '/dict/item/type/sys_show_hide', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (84, 'GET', NULL, NULL, '2022-06-06 06:42:47', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (85, 'GET', NULL, NULL, '2022-06-06 06:42:47', '/menu/tree', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (86, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 06:42:48', '/role/page', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (87, 'GET', NULL, NULL, '2022-06-06 06:42:49', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (88, 'GET', NULL, NULL, '2022-06-06 06:42:51', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (89, 'POST', '{}', NULL, '2022-06-06 06:42:51', '/dept/page', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (90, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 06:42:53', '/user/page', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (91, 'GET', NULL, NULL, '2022-06-06 06:42:54', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (92, 'GET', NULL, NULL, '2022-06-06 06:42:54', '/dict/item/type/sys_user_sex', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (93, 'GET', NULL, NULL, '2022-06-06 06:42:54', '/dept/tree', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (94, 'GET', NULL, NULL, '2022-06-06 06:52:58', '/dict/item/type/sys_show_hide', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (95, 'GET', NULL, NULL, '2022-06-06 06:52:58', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (96, 'GET', NULL, NULL, '2022-06-06 06:52:58', '/menu/tree', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (97, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 06:53:00', '/user/page', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (98, 'GET', NULL, NULL, '2022-06-06 06:53:00', '/dict/item/type/sys_user_sex', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (99, 'GET', NULL, NULL, '2022-06-06 06:53:00', '/dict/item/type/sys_normal_disable', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (100, 'GET', NULL, NULL, '2022-06-06 06:53:01', '/dept/tree', '172.17.0.5:8081');
INSERT INTO `sys_log` VALUES (101, 'GET', NULL, NULL, '2022-06-06 06:56:02', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (102, 'GET', NULL, NULL, '2022-06-06 06:56:02', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (103, 'GET', NULL, NULL, '2022-06-06 06:56:11', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (104, 'GET', NULL, NULL, '2022-06-06 06:56:11', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (105, 'GET', NULL, NULL, '2022-06-06 06:56:11', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (106, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 06:56:11', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (107, 'GET', NULL, NULL, '2022-06-06 06:57:08', '/menu/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (108, 'GET', NULL, NULL, '2022-06-06 06:57:08', '/dict/item/type/sys_show_hide', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (109, 'GET', NULL, NULL, '2022-06-06 06:57:08', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (110, 'GET', NULL, NULL, '2022-06-06 06:57:11', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (111, 'GET', NULL, NULL, '2022-06-06 06:57:11', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (112, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 06:57:11', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (113, 'GET', NULL, NULL, '2022-06-06 06:57:11', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (114, 'GET', NULL, NULL, '2022-06-06 06:57:15', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (115, 'GET', NULL, NULL, '2022-06-06 06:57:16', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (116, 'GET', NULL, NULL, '2022-06-06 06:57:34', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (117, 'GET', NULL, NULL, '2022-06-06 06:57:34', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (118, 'GET', NULL, NULL, '2022-06-06 07:03:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (119, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:03:13', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (120, 'GET', NULL, NULL, '2022-06-06 07:03:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (121, 'GET', NULL, NULL, '2022-06-06 07:03:13', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (122, 'GET', NULL, NULL, '2022-06-06 07:03:15', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (123, 'GET', NULL, NULL, '2022-06-06 07:03:15', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (124, 'GET', NULL, NULL, '2022-06-06 07:03:15', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (125, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:03:15', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (126, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:03:23', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (127, 'GET', NULL, NULL, '2022-06-06 07:03:23', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (128, 'GET', NULL, NULL, '2022-06-06 07:03:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (129, 'GET', NULL, NULL, '2022-06-06 07:03:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (130, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:03:44', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (131, 'GET', NULL, NULL, '2022-06-06 07:03:46', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (132, 'GET', NULL, NULL, '2022-06-06 07:03:46', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (133, 'GET', NULL, NULL, '2022-06-06 07:03:46', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (134, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:03:47', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (135, 'GET', NULL, NULL, '2022-06-06 07:03:47', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (136, 'GET', NULL, NULL, '2022-06-06 07:03:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (137, 'GET', NULL, NULL, '2022-06-06 07:03:47', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (138, 'GET', NULL, NULL, '2022-06-06 07:03:49', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (139, 'GET', NULL, NULL, '2022-06-06 07:03:49', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (140, 'GET', NULL, NULL, '2022-06-06 07:04:34', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (141, 'GET', NULL, NULL, '2022-06-06 07:04:34', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (142, 'GET', NULL, NULL, '2022-06-06 07:04:34', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (143, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:04:34', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (144, 'GET', NULL, NULL, '2022-06-06 07:04:57', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (145, 'GET', NULL, NULL, '2022-06-06 07:04:57', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (146, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 07:04:58', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (147, 'GET', NULL, NULL, '2022-06-06 07:04:58', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (148, 'GET', NULL, NULL, '2022-06-06 07:04:58', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (149, 'GET', NULL, NULL, '2022-06-06 07:04:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (150, 'GET', NULL, NULL, '2022-06-06 07:05:01', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (151, 'GET', NULL, NULL, '2022-06-06 07:05:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (152, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 08:41:31', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (153, 'GET', NULL, NULL, '2022-06-06 08:41:32', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (154, 'GET', NULL, NULL, '2022-06-06 08:41:32', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (155, 'GET', NULL, NULL, '2022-06-06 08:41:32', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (156, 'GET', NULL, NULL, '2022-06-06 08:41:39', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (157, 'GET', NULL, NULL, '2022-06-06 08:41:39', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (158, 'GET', NULL, NULL, '2022-06-06 08:46:53', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (159, 'GET', NULL, NULL, '2022-06-06 08:46:53', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (160, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 08:48:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (161, 'GET', NULL, NULL, '2022-06-06 08:48:20', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (162, 'GET', NULL, NULL, '2022-06-06 08:48:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (163, 'GET', NULL, NULL, '2022-06-06 08:48:20', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (164, 'GET', NULL, NULL, '2022-06-06 08:48:21', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (165, 'GET', NULL, NULL, '2022-06-06 08:48:21', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (166, 'GET', NULL, NULL, '2022-06-06 08:49:52', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (167, 'GET', NULL, NULL, '2022-06-06 08:49:52', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (168, 'GET', NULL, NULL, '2022-06-06 08:49:52', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (169, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 08:49:52', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (170, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 08:51:35', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (171, 'GET', NULL, NULL, '2022-06-06 08:51:35', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (172, 'GET', NULL, NULL, '2022-06-06 08:51:35', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (173, 'GET', NULL, NULL, '2022-06-06 08:51:35', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (174, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 08:52:23', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (175, 'GET', NULL, NULL, '2022-06-06 08:52:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (176, 'GET', NULL, NULL, '2022-06-06 08:52:23', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (177, 'GET', NULL, NULL, '2022-06-06 08:52:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (178, 'GET', NULL, NULL, '2022-06-06 08:52:26', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (179, 'GET', NULL, NULL, '2022-06-06 08:52:26', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (180, 'GET', NULL, NULL, '2022-06-06 08:55:04', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (181, 'GET', NULL, NULL, '2022-06-06 08:55:04', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (182, 'GET', NULL, NULL, '2022-06-06 08:55:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (183, 'GET', NULL, NULL, '2022-06-06 08:55:45', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (184, 'GET', NULL, NULL, '2022-06-06 08:57:30', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (185, 'GET', NULL, NULL, '2022-06-06 08:57:30', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (186, 'GET', NULL, NULL, '2022-06-06 09:02:44', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (187, 'GET', NULL, NULL, '2022-06-06 09:02:44', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (188, 'GET', NULL, NULL, '2022-06-06 09:02:45', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (189, 'GET', NULL, NULL, '2022-06-06 09:02:45', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (190, 'GET', NULL, NULL, '2022-06-06 09:02:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (191, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:02:45', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (192, 'GET', NULL, NULL, '2022-06-06 09:03:02', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (193, 'GET', NULL, NULL, '2022-06-06 09:03:02', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (194, 'GET', NULL, NULL, '2022-06-06 09:03:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (195, 'GET', NULL, NULL, '2022-06-06 09:03:47', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (196, 'GET', NULL, NULL, '2022-06-06 09:04:29', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (197, 'GET', NULL, NULL, '2022-06-06 09:04:29', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (198, 'GET', NULL, NULL, '2022-06-06 09:04:32', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (199, 'GET', NULL, NULL, '2022-06-06 09:04:32', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (200, 'GET', NULL, NULL, '2022-06-06 09:06:29', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (201, 'GET', NULL, NULL, '2022-06-06 09:06:29', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (202, 'GET', NULL, NULL, '2022-06-06 09:06:30', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (203, 'GET', NULL, NULL, '2022-06-06 09:06:30', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (204, 'GET', NULL, NULL, '2022-06-06 09:06:30', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (205, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:06:30', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (206, 'GET', NULL, NULL, '2022-06-06 09:06:37', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (207, 'GET', NULL, NULL, '2022-06-06 09:06:37', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (208, 'GET', NULL, NULL, '2022-06-06 09:07:22', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (209, 'GET', NULL, NULL, '2022-06-06 09:07:22', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (210, 'GET', NULL, NULL, '2022-06-06 09:07:23', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (211, 'GET', NULL, NULL, '2022-06-06 09:07:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (212, 'GET', NULL, NULL, '2022-06-06 09:07:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (213, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:07:23', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (214, 'GET', NULL, NULL, '2022-06-06 09:07:25', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (215, 'GET', NULL, NULL, '2022-06-06 09:07:25', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (216, 'GET', NULL, NULL, '2022-06-06 09:08:00', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (217, 'GET', NULL, NULL, '2022-06-06 09:08:00', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (218, 'GET', NULL, NULL, '2022-06-06 09:09:08', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (219, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:09:08', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (220, 'GET', NULL, NULL, '2022-06-06 09:09:12', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (221, 'POST', NULL, NULL, '2022-06-06 09:09:12', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (222, 'GET', NULL, NULL, '2022-06-06 09:09:12', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (223, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:09:12', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (224, 'GET', NULL, NULL, '2022-06-06 09:09:34', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (225, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:09:34', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (226, 'GET', NULL, NULL, '2022-06-06 09:09:36', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (227, 'POST', NULL, NULL, '2022-06-06 09:09:40', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (228, 'GET', NULL, NULL, '2022-06-06 09:09:40', '/dict/4', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (229, 'GET', NULL, NULL, '2022-06-06 09:09:40', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (230, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_show_hide\"}', NULL, '2022-06-06 09:09:40', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (231, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:09:43', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (232, 'GET', NULL, NULL, '2022-06-06 09:09:43', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (233, 'GET', NULL, NULL, '2022-06-06 09:11:42', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (234, 'GET', NULL, NULL, '2022-06-06 09:11:43', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (235, 'GET', NULL, NULL, '2022-06-06 09:11:44', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (236, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:11:44', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (237, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:13:59', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (238, 'GET', NULL, NULL, '2022-06-06 09:14:02', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (239, 'GET', NULL, NULL, '2022-06-06 09:14:02', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (240, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:14:03', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (241, 'GET', NULL, NULL, '2022-06-06 09:14:03', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (242, 'GET', NULL, NULL, '2022-06-06 09:14:41', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (243, 'GET', NULL, NULL, '2022-06-06 09:14:41', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (244, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:14:42', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (245, 'GET', NULL, NULL, '2022-06-06 09:14:42', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (246, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:16:40', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (247, 'POST', '{\"current\":1,\"size\":10,\"status\":\"0\",\"params\":{}}', NULL, '2022-06-06 09:16:45', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (248, 'POST', '{\"current\":1,\"size\":10,\"status\":\"1\",\"params\":{}}', NULL, '2022-06-06 09:16:52', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (249, 'GET', NULL, NULL, '2022-06-06 09:17:04', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (250, 'GET', NULL, NULL, '2022-06-06 09:17:04', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (251, 'POST', NULL, NULL, '2022-06-06 09:17:04', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (252, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:17:04', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (253, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:17:06', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (254, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:17:13', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (255, 'GET', NULL, NULL, '2022-06-06 09:20:04', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (256, 'GET', NULL, NULL, '2022-06-06 09:20:04', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (257, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:20:04', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (258, 'GET', NULL, NULL, '2022-06-06 09:20:04', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (259, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:20:08', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (260, 'GET', NULL, NULL, '2022-06-06 09:20:08', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (261, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:20:38', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (262, 'GET', NULL, NULL, '2022-06-06 09:21:25', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (263, 'GET', NULL, NULL, '2022-06-06 09:21:26', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (264, 'POST', NULL, NULL, '2022-06-06 09:21:26', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (265, 'GET', NULL, NULL, '2022-06-06 09:21:26', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (266, 'GET', NULL, NULL, '2022-06-06 09:21:27', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (267, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:21:27', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (268, 'GET', NULL, NULL, '2022-06-06 09:24:12', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (269, 'GET', NULL, NULL, '2022-06-06 09:24:12', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (270, 'GET', NULL, NULL, '2022-06-06 09:24:13', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (271, 'POST', NULL, NULL, '2022-06-06 09:24:13', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (272, 'GET', NULL, NULL, '2022-06-06 09:24:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (273, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:24:13', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (274, 'GET', NULL, NULL, '2022-06-06 09:25:41', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (275, 'GET', NULL, NULL, '2022-06-06 09:25:42', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (276, 'POST', NULL, NULL, '2022-06-06 09:25:43', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (277, 'GET', NULL, NULL, '2022-06-06 09:25:43', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (278, 'GET', NULL, NULL, '2022-06-06 09:25:43', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (279, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:25:43', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (280, 'GET', NULL, NULL, '2022-06-06 09:26:03', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (281, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:26:03', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (282, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:26:17', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (283, 'GET', NULL, NULL, '2022-06-06 09:26:26', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (284, 'GET', NULL, NULL, '2022-06-06 09:26:27', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (285, 'POST', NULL, NULL, '2022-06-06 09:26:27', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (286, 'GET', NULL, NULL, '2022-06-06 09:26:27', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (287, 'GET', NULL, NULL, '2022-06-06 09:26:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (288, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:26:28', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (289, 'GET', NULL, NULL, '2022-06-06 09:31:43', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (290, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:31:43', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (291, 'GET', NULL, NULL, '2022-06-06 09:31:51', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (292, 'GET', NULL, NULL, '2022-06-06 09:31:51', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (293, 'GET', NULL, NULL, '2022-06-06 09:31:51', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (294, 'POST', NULL, NULL, '2022-06-06 09:31:51', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (295, 'GET', NULL, NULL, '2022-06-06 09:31:51', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (296, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:31:51', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (297, 'GET', NULL, NULL, '2022-06-06 09:33:19', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (298, 'GET', NULL, NULL, '2022-06-06 09:33:19', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (299, 'GET', NULL, NULL, '2022-06-06 09:33:20', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (300, 'GET', NULL, NULL, '2022-06-06 09:33:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (301, 'GET', NULL, NULL, '2022-06-06 09:33:20', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (302, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:33:20', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (303, 'GET', NULL, NULL, '2022-06-06 09:34:00', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (304, 'GET', NULL, NULL, '2022-06-06 09:34:23', '/dict/list', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (305, 'GET', NULL, NULL, '2022-06-06 09:34:24', '/favicon.ico', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (306, 'GET', NULL, NULL, '2022-06-06 09:34:29', '/dict/list', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (307, 'GET', NULL, NULL, '2022-06-06 09:35:27', '/dict/list', '0:0:0:0:0:0:0:1:8081');
INSERT INTO `sys_log` VALUES (308, 'GET', NULL, NULL, '2022-06-06 09:35:32', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (309, 'GET', NULL, NULL, '2022-06-06 09:35:32', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (310, 'GET', NULL, NULL, '2022-06-06 09:35:33', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (311, 'GET', NULL, NULL, '2022-06-06 09:35:33', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (312, 'GET', NULL, NULL, '2022-06-06 09:35:33', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (313, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"sys_user_sex\"}', NULL, '2022-06-06 09:35:33', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (314, 'GET', NULL, NULL, '2022-06-06 09:36:01', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (315, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-06 09:36:01', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (316, 'GET', NULL, NULL, '2022-06-07 02:20:12', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (317, 'GET', NULL, NULL, '2022-06-07 02:20:12', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (318, 'GET', NULL, NULL, '2022-06-07 02:20:26', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (319, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:26', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (320, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:39', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (321, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:40', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (322, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:41', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (323, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:41', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (324, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:41', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (325, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:20:42', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (326, 'POST', '{\"current\":1,\"size\":10,\"dictName\":\"字典\",\"params\":{}}', NULL, '2022-06-07 02:20:49', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (327, 'POST', '{\"current\":1,\"size\":10,\"dictName\":\"字典\",\"params\":{}}', NULL, '2022-06-07 02:20:55', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (328, 'POST', '{\"current\":1,\"size\":10,\"dictName\":\"字典\",\"params\":{},\"name\":\"字典类\"}', NULL, '2022-06-07 02:21:38', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (329, 'POST', '{\"current\":1,\"size\":10,\"dictName\":\"字典\",\"params\":{},\"name\":\"\"}', NULL, '2022-06-07 02:21:40', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (330, 'POST', '{\"current\":1,\"size\":10,\"dictName\":\"字典\",\"dictType\":\"dict_type\",\"params\":{},\"name\":\"\"}', NULL, '2022-06-07 02:21:49', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (331, 'POST', '{\"current\":1,\"size\":10,\"dictName\":\"字典\",\"dictType\":\"dict_type\",\"params\":{},\"name\":\"\"}', NULL, '2022-06-07 02:21:49', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (332, 'GET', NULL, NULL, '2022-06-07 02:22:24', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (333, 'GET', NULL, NULL, '2022-06-07 02:22:24', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (334, 'GET', NULL, NULL, '2022-06-07 02:22:25', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (335, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:22:25', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (336, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"dict_type\",\"params\":{}}', NULL, '2022-06-07 02:22:32', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (337, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"dict_type\",\"params\":{}}', NULL, '2022-06-07 02:22:33', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (338, 'GET', NULL, NULL, '2022-06-07 02:23:23', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (339, 'GET', NULL, NULL, '2022-06-07 02:23:23', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (340, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:23:24', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (341, 'GET', NULL, NULL, '2022-06-07 02:23:24', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (342, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"type\":\"dict_type\"}', NULL, '2022-06-07 02:23:54', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (343, 'GET', NULL, NULL, '2022-06-07 02:26:16', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (344, 'GET', NULL, NULL, '2022-06-07 02:26:16', '/dict/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (345, 'GET', NULL, NULL, '2022-06-07 02:26:16', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (346, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"dict_type\"}', NULL, '2022-06-07 02:26:17', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (347, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:26:21', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (348, 'GET', NULL, NULL, '2022-06-07 02:26:21', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (349, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:27:01', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (350, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:29:05', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (351, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:29:05', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (352, 'GET', NULL, NULL, '2022-06-07 02:29:42', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (353, 'GET', NULL, NULL, '2022-06-07 02:29:42', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (354, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:29:44', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (355, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:29:50', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (356, 'GET', NULL, NULL, '2022-06-07 02:30:20', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (357, 'GET', NULL, NULL, '2022-06-07 02:30:20', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (358, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:30:21', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (359, 'GET', NULL, NULL, '2022-06-07 02:32:35', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (360, 'GET', NULL, NULL, '2022-06-07 02:32:35', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (361, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 02:32:36', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (362, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"type\":\"dict_type\"}', NULL, '2022-06-07 06:02:50', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (363, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:02:52', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (364, 'GET', NULL, NULL, '2022-06-07 06:03:01', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (365, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-11-17T14:38:24\",\"updateTime\":\"2021-11-17T14:57:23\",\"name\":\"性别\",\"type\":\"sys_user_sex\",\"remark\":\"男女\"}', NULL, '2022-06-07 06:03:12', '/dict', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (366, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:03:13', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (367, 'GET', NULL, NULL, '2022-06-07 06:03:15', '/dict/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (368, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:04:16', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (369, 'POST', '{\"status\":\"0\",\"name\":\"测试\",\"type\":\"test\"}', NULL, '2022-06-07 06:04:28', '/dict', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (370, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:04:29', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (371, 'GET', NULL, NULL, '2022-06-07 06:04:31', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (372, 'POST', '{\"id\":\"6\",\"createBy\":\"1\",\"createTime\":\"2022-06-07T14:04:30\",\"updateTime\":\"2022-06-07T06:04:28\",\"name\":\"测试\",\"type\":\"test1\"}', NULL, '2022-06-07 06:04:33', '/dict', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (373, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:04:33', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (374, 'POST', '{\"status\":\"0\",\"name\":\"测试1\",\"type\":\"test1\"}', NULL, '2022-06-07 06:04:53', '/dict', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (375, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:04:53', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (376, 'POST', '{\"status\":\"0\",\"name\":\"测试1\",\"type\":\"test\"}', NULL, '2022-06-07 06:05:02', '/dict', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (377, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:05:03', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (378, 'DELETE', NULL, NULL, '2022-06-07 06:05:07', '/dict/type/7', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (379, 'DELETE', NULL, NULL, '2022-06-07 06:05:15', '/dict/type/7', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (380, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:05:49', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (381, 'DELETE', NULL, NULL, '2022-06-07 06:06:21', '/dict/7', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (382, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:06:21', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (383, 'GET', NULL, NULL, '2022-06-07 06:06:30', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (384, 'GET', NULL, NULL, '2022-06-07 06:06:31', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (385, 'GET', NULL, NULL, '2022-06-07 06:06:31', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (386, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"test1\"}', NULL, '2022-06-07 06:06:31', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (387, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"test1\"}', NULL, '2022-06-07 06:08:03', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (388, 'POST', '{\"current\":1,\"size\":10,\"dictType\":\"test1\"}', NULL, '2022-06-07 06:08:58', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (389, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:09:02', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (390, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:09:29', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (391, 'GET', NULL, NULL, '2022-06-07 06:09:33', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (392, 'GET', NULL, NULL, '2022-06-07 06:09:34', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (393, 'GET', NULL, NULL, '2022-06-07 06:09:34', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (394, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:09:34', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (395, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:11:17', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (396, 'POST', '{\"current\":1,\"size\":10,\"type\":\"dict_type\"}', NULL, '2022-06-07 06:11:21', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (397, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:11:25', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (398, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:12:40', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (399, 'GET', NULL, NULL, '2022-06-07 06:13:45', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (400, 'GET', NULL, NULL, '2022-06-07 06:13:48', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (401, 'GET', NULL, NULL, '2022-06-07 06:13:48', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (402, 'GET', NULL, NULL, '2022-06-07 06:13:49', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (403, 'GET', NULL, NULL, '2022-06-07 06:13:49', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (404, 'GET', NULL, NULL, '2022-06-07 06:13:49', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (405, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:13:49', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (406, 'GET', NULL, NULL, '2022-06-07 06:15:39', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (407, 'GET', NULL, NULL, '2022-06-07 06:15:40', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (408, 'GET', NULL, NULL, '2022-06-07 06:15:40', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (409, 'GET', NULL, NULL, '2022-06-07 06:15:40', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (410, 'GET', NULL, NULL, '2022-06-07 06:15:40', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (411, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:15:41', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (412, 'GET', NULL, NULL, '2022-06-07 06:16:56', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (413, 'GET', NULL, NULL, '2022-06-07 06:16:56', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (414, 'GET', NULL, NULL, '2022-06-07 06:16:57', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (415, 'GET', NULL, NULL, '2022-06-07 06:16:57', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (416, 'GET', NULL, NULL, '2022-06-07 06:16:57', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (417, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:16:58', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (418, 'POST', '{\"dictSort\":0,\"status\":\"正常\",\"remark\":\"111\",\"type\":\"test1\",\"sort\":2,\"name\":\"c1\",\"value\":\"0\"}', NULL, '2022-06-07 06:17:17', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (419, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:17:17', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (420, 'GET', NULL, NULL, '2022-06-07 06:17:48', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (421, 'GET', NULL, NULL, '2022-06-07 06:17:49', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (422, 'GET', NULL, NULL, '2022-06-07 06:17:49', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (423, 'GET', NULL, NULL, '2022-06-07 06:17:49', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (424, 'GET', NULL, NULL, '2022-06-07 06:17:50', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (425, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:17:50', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (426, 'GET', NULL, NULL, '2022-06-07 06:24:32', '/dict/', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (427, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:24:39', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (428, 'GET', NULL, NULL, '2022-06-07 06:25:27', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (429, 'GET', NULL, NULL, '2022-06-07 06:25:28', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (430, 'GET', NULL, NULL, '2022-06-07 06:25:28', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (431, 'GET', NULL, NULL, '2022-06-07 06:25:28', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (432, 'GET', NULL, NULL, '2022-06-07 06:25:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (433, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:25:28', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (434, 'GET', NULL, NULL, '2022-06-07 06:25:52', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (435, 'GET', NULL, NULL, '2022-06-07 06:25:53', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (436, 'GET', NULL, NULL, '2022-06-07 06:25:53', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (437, 'GET', NULL, NULL, '2022-06-07 06:25:53', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (438, 'GET', NULL, NULL, '2022-06-07 06:25:53', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (439, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:25:54', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (440, 'GET', NULL, NULL, '2022-06-07 06:25:56', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (441, 'POST', '{\"id\":\"9\",\"createBy\":\"1\",\"createTime\":\"2022-06-07T14:17:18\",\"updateTime\":\"2022-06-07T06:17:17\",\"type\":\"test1\",\"name\":\"c1\",\"value\":\"0\",\"sort\":1,\"remark\":\"ddd\"}', NULL, '2022-06-07 06:26:02', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (442, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:26:03', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (443, 'GET', NULL, NULL, '2022-06-07 06:26:04', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (444, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:29:01', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (445, 'GET', NULL, NULL, '2022-06-07 06:29:06', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (446, 'GET', NULL, NULL, '2022-06-07 06:29:06', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (447, 'GET', NULL, NULL, '2022-06-07 06:29:06', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (448, 'GET', NULL, NULL, '2022-06-07 06:29:06', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (449, 'GET', NULL, NULL, '2022-06-07 06:29:07', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (450, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:29:07', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (451, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:29:59', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (452, 'GET', NULL, NULL, '2022-06-07 06:30:01', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (453, 'POST', '{\"id\":\"9\",\"createBy\":\"1\",\"createTime\":\"2022-06-07T14:17:18\",\"updateTime\":\"2022-06-07T14:26:04\",\"type\":\"test1\",\"name\":\"c1\",\"value\":\"0\",\"sort\":2,\"remark\":\"dfd\",\"status\":\"正常\"}', NULL, '2022-06-07 06:30:07', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (454, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:30:07', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (455, 'GET', NULL, NULL, '2022-06-07 06:30:12', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (456, 'POST', '{\"id\":\"9\",\"createBy\":\"1\",\"createTime\":\"2022-06-07T14:17:18\",\"updateTime\":\"2022-06-07T14:30:08\",\"type\":\"test1\",\"name\":\"c1\",\"value\":\"0\",\"sort\":2,\"remark\":\"dfd\",\"status\":\"正常\"}', NULL, '2022-06-07 06:30:14', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (457, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:30:14', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (458, 'GET', NULL, NULL, '2022-06-07 06:30:43', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (459, 'GET', NULL, NULL, '2022-06-07 06:30:43', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (460, 'GET', NULL, NULL, '2022-06-07 06:30:44', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (461, 'GET', NULL, NULL, '2022-06-07 06:30:44', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (462, 'GET', NULL, NULL, '2022-06-07 06:30:44', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (463, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:30:44', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (464, 'GET', NULL, NULL, '2022-06-07 06:30:47', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (465, 'POST', '{\"id\":\"9\",\"createBy\":\"1\",\"createTime\":\"2022-06-07T14:17:18\",\"updateTime\":\"2022-06-07T14:30:15\",\"type\":\"test1\",\"name\":\"c1\",\"value\":\"0\",\"sort\":2,\"remark\":\"dfd\",\"status\":\"0\"}', NULL, '2022-06-07 06:30:50', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (466, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:30:50', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (467, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:30:59', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (468, 'GET', NULL, NULL, '2022-06-07 06:32:42', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (469, 'POST', '{\"id\":\"9\",\"createBy\":\"1\",\"createTime\":\"2022-06-07T14:17:18\",\"updateTime\":\"2022-06-07T14:30:51\",\"type\":\"test1\",\"name\":\"c1\",\"value\":\"0\",\"sort\":2,\"remark\":\"dfd\",\"status\":\"0\"}', NULL, '2022-06-07 06:32:45', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (470, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 06:32:45', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (471, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:34:45', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (472, 'GET', NULL, NULL, '2022-06-07 06:34:49', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (473, 'GET', NULL, NULL, '2022-06-07 06:34:53', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (474, 'GET', NULL, NULL, '2022-06-07 06:34:53', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (475, 'GET', NULL, NULL, '2022-06-07 06:34:53', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (476, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:34:53', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (477, 'GET', NULL, NULL, '2022-06-07 06:34:55', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (478, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-06T09:10:31\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"false\",\"sort\":0,\"status\":false}', NULL, '2022-06-07 06:35:03', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (479, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:35:04', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (480, 'GET', NULL, NULL, '2022-06-07 06:35:07', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (481, 'GET', NULL, NULL, '2022-06-07 06:35:27', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (482, 'GET', NULL, NULL, '2022-06-07 06:35:27', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (483, 'GET', NULL, NULL, '2022-06-07 06:35:27', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (484, 'GET', NULL, NULL, '2022-06-07 06:35:27', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (485, 'GET', NULL, NULL, '2022-06-07 06:35:27', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (486, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:35:27', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (487, 'GET', NULL, NULL, '2022-06-07 06:35:29', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (488, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T06:35:21\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"false\",\"sort\":0,\"status\":\"0\"}', NULL, '2022-06-07 06:35:33', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (489, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:35:33', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (490, 'GET', NULL, NULL, '2022-06-07 06:35:44', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (491, 'GET', NULL, NULL, '2022-06-07 06:35:54', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (492, 'GET', NULL, NULL, '2022-06-07 06:35:55', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (493, 'GET', NULL, NULL, '2022-06-07 06:35:55', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (494, 'GET', NULL, NULL, '2022-06-07 06:35:55', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (495, 'GET', NULL, NULL, '2022-06-07 06:35:55', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (496, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:35:55', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (497, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:35:58', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (498, 'GET', NULL, NULL, '2022-06-07 06:36:01', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (499, 'GET', NULL, NULL, '2022-06-07 06:36:02', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (500, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:36:02', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (501, 'GET', NULL, NULL, '2022-06-07 06:36:08', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (502, 'GET', NULL, NULL, '2022-06-07 06:36:08', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (503, 'GET', NULL, NULL, '2022-06-07 06:36:08', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (504, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:36:08', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (505, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:36:31', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (506, 'GET', NULL, NULL, '2022-06-07 06:36:38', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (507, 'GET', NULL, NULL, '2022-06-07 06:36:38', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (508, 'GET', NULL, NULL, '2022-06-07 06:36:38', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (509, 'GET', NULL, NULL, '2022-06-07 06:36:38', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (510, 'GET', NULL, NULL, '2022-06-07 06:36:38', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (511, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:36:38', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (512, 'GET', NULL, NULL, '2022-06-07 06:36:41', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (513, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T06:35:21\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"false\",\"sort\":0,\"status\":\"false\"}', NULL, '2022-06-07 06:36:50', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (514, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:36:50', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (515, 'GET', NULL, NULL, '2022-06-07 06:37:15', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (516, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T06:35:21\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"false\",\"sort\":0,\"status\":\"false\"}', NULL, '2022-06-07 06:37:21', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (517, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:37:21', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (518, 'GET', NULL, NULL, '2022-06-07 06:49:37', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (519, 'GET', NULL, NULL, '2022-06-07 06:49:42', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (520, 'GET', NULL, NULL, '2022-06-07 06:49:42', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (521, 'GET', NULL, NULL, '2022-06-07 06:49:42', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (522, 'GET', NULL, NULL, '2022-06-07 06:49:42', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (523, 'GET', NULL, NULL, '2022-06-07 06:49:43', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (524, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:49:43', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (525, 'GET', NULL, NULL, '2022-06-07 06:49:46', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (526, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T06:48:49\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":0}', NULL, '2022-06-07 06:49:49', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (527, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:49:49', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (528, 'GET', NULL, NULL, '2022-06-07 06:52:59', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (529, 'GET', NULL, NULL, '2022-06-07 06:52:59', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (530, 'GET', NULL, NULL, '2022-06-07 06:53:00', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (531, 'GET', NULL, NULL, '2022-06-07 06:53:00', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (532, 'GET', NULL, NULL, '2022-06-07 06:53:00', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (533, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:53:00', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (534, 'GET', NULL, NULL, '2022-06-07 06:53:02', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (535, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T06:48:49\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"0\"}', NULL, '2022-06-07 06:53:04', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (536, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:53:04', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (537, 'GET', NULL, NULL, '2022-06-07 06:53:23', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (538, 'GET', NULL, NULL, '2022-06-07 06:53:23', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (539, 'GET', NULL, NULL, '2022-06-07 06:53:24', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (540, 'GET', NULL, NULL, '2022-06-07 06:53:24', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (541, 'GET', NULL, NULL, '2022-06-07 06:53:24', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (542, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:53:25', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (543, 'GET', NULL, NULL, '2022-06-07 06:53:27', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (544, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T06:48:49\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":0}', NULL, '2022-06-07 06:53:29', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (545, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:53:29', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (546, 'GET', NULL, NULL, '2022-06-07 06:54:47', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (547, 'GET', NULL, NULL, '2022-06-07 06:54:47', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (548, 'GET', NULL, NULL, '2022-06-07 06:54:47', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (549, 'GET', NULL, NULL, '2022-06-07 06:54:47', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (550, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:54:48', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (551, 'GET', NULL, NULL, '2022-06-07 06:54:48', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (552, 'GET', NULL, NULL, '2022-06-07 06:54:52', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (553, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:55:01', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (554, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:55:17', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (555, 'GET', NULL, NULL, '2022-06-07 06:55:20', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (556, 'GET', NULL, NULL, '2022-06-07 06:55:20', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (557, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 06:55:21', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (558, 'GET', NULL, NULL, '2022-06-07 06:55:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (559, 'GET', NULL, NULL, '2022-06-07 06:55:28', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (560, 'GET', NULL, NULL, '2022-06-07 06:55:28', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (561, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:55:28', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (562, 'GET', NULL, NULL, '2022-06-07 06:56:10', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (563, 'GET', NULL, NULL, '2022-06-07 06:56:10', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (564, 'GET', NULL, NULL, '2022-06-07 06:56:11', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (565, 'GET', NULL, NULL, '2022-06-07 06:56:11', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (566, 'GET', NULL, NULL, '2022-06-07 06:56:11', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (567, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:56:11', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (568, 'GET', NULL, NULL, '2022-06-07 06:56:17', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (569, 'GET', NULL, NULL, '2022-06-07 06:56:17', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (570, 'GET', NULL, NULL, '2022-06-07 06:56:18', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (571, 'GET', NULL, NULL, '2022-06-07 06:56:18', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (572, 'GET', NULL, NULL, '2022-06-07 06:56:18', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (573, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:56:18', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (574, 'GET', NULL, NULL, '2022-06-07 06:57:52', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (575, 'GET', NULL, NULL, '2022-06-07 06:57:52', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (576, 'GET', NULL, NULL, '2022-06-07 06:57:53', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (577, 'GET', NULL, NULL, '2022-06-07 06:57:53', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (578, 'GET', NULL, NULL, '2022-06-07 06:57:53', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (579, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:57:53', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (580, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 06:57:57', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (581, 'GET', NULL, NULL, '2022-06-07 07:07:52', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (582, 'GET', NULL, NULL, '2022-06-07 07:07:52', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (583, 'GET', NULL, NULL, '2022-06-07 07:07:52', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (584, 'GET', NULL, NULL, '2022-06-07 07:07:52', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (585, 'GET', NULL, NULL, '2022-06-07 07:07:52', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (586, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:07:52', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (587, 'GET', NULL, NULL, '2022-06-07 07:08:04', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (588, 'GET', NULL, NULL, '2022-06-07 07:08:16', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (589, 'GET', NULL, NULL, '2022-06-07 07:08:16', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (590, 'GET', NULL, NULL, '2022-06-07 07:08:17', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (591, 'GET', NULL, NULL, '2022-06-07 07:08:17', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (592, 'GET', NULL, NULL, '2022-06-07 07:08:17', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (593, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:08:17', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (594, 'GET', NULL, NULL, '2022-06-07 07:08:19', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (595, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 07:08:33', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (596, 'GET', NULL, NULL, '2022-06-07 07:08:40', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (597, 'GET', NULL, NULL, '2022-06-07 07:08:40', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (598, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 07:08:41', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (599, 'GET', NULL, NULL, '2022-06-07 07:08:43', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (600, 'GET', NULL, NULL, '2022-06-07 07:08:43', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (601, 'GET', NULL, NULL, '2022-06-07 07:08:43', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (602, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:08:43', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (603, 'GET', NULL, NULL, '2022-06-07 07:08:48', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (604, 'GET', NULL, NULL, '2022-06-07 07:09:32', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (605, 'GET', NULL, NULL, '2022-06-07 07:09:33', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (606, 'GET', NULL, NULL, '2022-06-07 07:09:33', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (607, 'GET', NULL, NULL, '2022-06-07 07:09:33', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (608, 'GET', NULL, NULL, '2022-06-07 07:09:34', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (609, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:09:34', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (610, 'GET', NULL, NULL, '2022-06-07 07:09:36', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (611, 'GET', NULL, NULL, '2022-06-07 07:10:28', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (612, 'GET', NULL, NULL, '2022-06-07 07:10:28', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (613, 'GET', NULL, NULL, '2022-06-07 07:10:29', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (614, 'GET', NULL, NULL, '2022-06-07 07:10:29', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (615, 'GET', NULL, NULL, '2022-06-07 07:10:29', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (616, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:10:29', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (617, 'GET', NULL, NULL, '2022-06-07 07:10:31', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (618, 'GET', NULL, NULL, '2022-06-07 07:23:09', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (619, 'GET', NULL, NULL, '2022-06-07 07:23:09', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (620, 'GET', NULL, NULL, '2022-06-07 07:23:40', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (621, 'GET', NULL, NULL, '2022-06-07 07:23:40', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (622, 'GET', NULL, NULL, '2022-06-07 07:23:41', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (623, 'GET', NULL, NULL, '2022-06-07 07:23:41', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (624, 'GET', NULL, NULL, '2022-06-07 07:23:41', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (625, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:23:41', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (626, 'GET', NULL, NULL, '2022-06-07 07:24:18', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (627, 'GET', NULL, NULL, '2022-06-07 07:24:19', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (628, 'GET', NULL, NULL, '2022-06-07 07:24:19', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (629, 'GET', NULL, NULL, '2022-06-07 07:24:19', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (630, 'GET', NULL, NULL, '2022-06-07 07:24:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (631, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:24:20', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (632, 'GET', NULL, NULL, '2022-06-07 07:24:26', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (633, 'GET', NULL, NULL, '2022-06-07 07:28:28', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (634, 'GET', NULL, NULL, '2022-06-07 07:28:28', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (635, 'GET', NULL, NULL, '2022-06-07 07:28:29', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (636, 'GET', NULL, NULL, '2022-06-07 07:28:29', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (637, 'GET', NULL, NULL, '2022-06-07 07:28:29', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (638, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:28:29', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (639, 'GET', NULL, NULL, '2022-06-07 07:28:31', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (640, 'GET', NULL, NULL, '2022-06-07 07:28:57', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (641, 'GET', NULL, NULL, '2022-06-07 07:29:03', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (642, 'GET', NULL, NULL, '2022-06-07 07:34:57', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (643, 'GET', NULL, NULL, '2022-06-07 07:35:12', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (644, 'GET', NULL, NULL, '2022-06-07 07:35:12', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (645, 'GET', NULL, NULL, '2022-06-07 07:35:12', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (646, 'GET', NULL, NULL, '2022-06-07 07:35:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (647, 'GET', NULL, NULL, '2022-06-07 07:35:13', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (648, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:35:13', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (649, 'GET', NULL, NULL, '2022-06-07 07:35:14', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (650, 'GET', NULL, NULL, '2022-06-07 07:35:46', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (651, 'GET', NULL, NULL, '2022-06-07 07:35:46', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (652, 'GET', NULL, NULL, '2022-06-07 07:35:46', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (653, 'GET', NULL, NULL, '2022-06-07 07:35:46', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (654, 'GET', NULL, NULL, '2022-06-07 07:35:46', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (655, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:35:47', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (656, 'GET', NULL, NULL, '2022-06-07 07:35:50', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (657, 'GET', NULL, NULL, '2022-06-07 07:37:05', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (658, 'GET', NULL, NULL, '2022-06-07 07:37:05', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (659, 'GET', NULL, NULL, '2022-06-07 07:37:06', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (660, 'GET', NULL, NULL, '2022-06-07 07:37:06', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (661, 'GET', NULL, NULL, '2022-06-07 07:37:06', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (662, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:37:06', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (663, 'GET', NULL, NULL, '2022-06-07 07:37:08', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (664, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T07:22:09\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":true}', NULL, '2022-06-07 07:37:12', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (665, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:37:12', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (666, 'GET', NULL, NULL, '2022-06-07 07:40:37', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (667, 'GET', NULL, NULL, '2022-06-07 07:40:41', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (668, 'GET', NULL, NULL, '2022-06-07 07:40:41', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (669, 'GET', NULL, NULL, '2022-06-07 07:40:42', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (670, 'GET', NULL, NULL, '2022-06-07 07:40:42', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (671, 'GET', NULL, NULL, '2022-06-07 07:40:42', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (672, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:40:42', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (673, 'GET', NULL, NULL, '2022-06-07 07:40:44', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (674, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:37:13\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"false\"}', NULL, '2022-06-07 07:40:47', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (675, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:40:48', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (676, 'GET', NULL, NULL, '2022-06-07 07:40:49', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (677, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:40:49\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":false}', NULL, '2022-06-07 07:41:46', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (678, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:41:46', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (679, 'GET', NULL, NULL, '2022-06-07 07:41:53', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (680, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:41:47\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"false\"}', NULL, '2022-06-07 07:41:57', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (681, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:41:57', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (682, 'GET', NULL, NULL, '2022-06-07 07:42:18', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (683, 'GET', NULL, NULL, '2022-06-07 07:42:18', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (684, 'GET', NULL, NULL, '2022-06-07 07:42:18', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (685, 'GET', NULL, NULL, '2022-06-07 07:42:18', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (686, 'GET', NULL, NULL, '2022-06-07 07:42:19', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (687, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:42:19', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (688, 'GET', NULL, NULL, '2022-06-07 07:42:21', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (689, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:41:58\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":true}', NULL, '2022-06-07 07:42:26', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (690, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:42:26', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (691, 'GET', NULL, NULL, '2022-06-07 07:42:31', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (692, 'GET', NULL, NULL, '2022-06-07 07:42:45', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (693, 'GET', NULL, NULL, '2022-06-07 07:42:45', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (694, 'GET', NULL, NULL, '2022-06-07 07:42:46', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (695, 'GET', NULL, NULL, '2022-06-07 07:42:46', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (696, 'GET', NULL, NULL, '2022-06-07 07:42:46', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (697, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:42:46', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (698, 'GET', NULL, NULL, '2022-06-07 07:42:48', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (699, 'GET', NULL, NULL, '2022-06-07 07:42:59', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (700, 'GET', NULL, NULL, '2022-06-07 07:43:57', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (701, 'GET', NULL, NULL, '2022-06-07 07:43:58', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (702, 'GET', NULL, NULL, '2022-06-07 07:43:58', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (703, 'GET', NULL, NULL, '2022-06-07 07:43:58', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (704, 'GET', NULL, NULL, '2022-06-07 07:43:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (705, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:43:58', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (706, 'GET', NULL, NULL, '2022-06-07 07:44:00', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (707, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:42:27\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"0\"}', NULL, '2022-06-07 07:44:03', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (708, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:44:04', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (709, 'GET', NULL, NULL, '2022-06-07 07:45:17', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (710, 'GET', NULL, NULL, '2022-06-07 07:45:17', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (711, 'GET', NULL, NULL, '2022-06-07 07:45:18', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (712, 'GET', NULL, NULL, '2022-06-07 07:45:18', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (713, 'GET', NULL, NULL, '2022-06-07 07:45:18', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (714, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:45:18', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (715, 'GET', NULL, NULL, '2022-06-07 07:45:20', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (716, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:42:27\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"0\"}', NULL, '2022-06-07 07:45:23', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (717, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:45:23', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (718, 'GET', NULL, NULL, '2022-06-07 07:46:09', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (719, 'GET', NULL, NULL, '2022-06-07 07:46:09', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (720, 'GET', NULL, NULL, '2022-06-07 07:46:10', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (721, 'GET', NULL, NULL, '2022-06-07 07:46:10', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (722, 'GET', NULL, NULL, '2022-06-07 07:46:10', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (723, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:46:10', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (724, 'GET', NULL, NULL, '2022-06-07 07:46:12', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (725, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:42:27\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"false\"}', NULL, '2022-06-07 07:46:19', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (726, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:46:19', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (727, 'GET', NULL, NULL, '2022-06-07 07:46:24', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (728, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:46:20\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":false}', NULL, '2022-06-07 07:46:28', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (729, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:46:28', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (730, 'GET', NULL, NULL, '2022-06-07 07:46:43', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (731, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:46:29\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":\"false\"}', NULL, '2022-06-07 07:46:51', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (732, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:46:51', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (733, 'GET', NULL, NULL, '2022-06-07 07:46:58', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (734, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:46:52\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":false}', NULL, '2022-06-07 07:47:01', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (735, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:47:01', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (736, 'GET', NULL, NULL, '2022-06-07 07:48:12', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (737, 'GET', NULL, NULL, '2022-06-07 07:48:12', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (738, 'GET', NULL, NULL, '2022-06-07 07:48:13', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (739, 'GET', NULL, NULL, '2022-06-07 07:48:13', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (740, 'GET', NULL, NULL, '2022-06-07 07:48:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (741, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:48:13', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (742, 'GET', NULL, NULL, '2022-06-07 07:48:15', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (743, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:47:02\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":true}', NULL, '2022-06-07 07:48:18', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (744, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:48:18', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (745, 'GET', NULL, NULL, '2022-06-07 07:48:21', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (746, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:48:19\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":false}', NULL, '2022-06-07 07:48:23', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (747, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:48:23', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (748, 'GET', NULL, NULL, '2022-06-07 07:51:22', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (749, 'GET', NULL, NULL, '2022-06-07 07:51:22', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (750, 'GET', NULL, NULL, '2022-06-07 07:51:23', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (751, 'GET', NULL, NULL, '2022-06-07 07:51:23', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (752, 'GET', NULL, NULL, '2022-06-07 07:51:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (753, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:51:24', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (754, 'GET', NULL, NULL, '2022-06-07 07:51:44', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (755, 'GET', NULL, NULL, '2022-06-07 07:51:44', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (756, 'GET', NULL, NULL, '2022-06-07 07:51:45', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (757, 'GET', NULL, NULL, '2022-06-07 07:51:45', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (758, 'GET', NULL, NULL, '2022-06-07 07:51:45', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (759, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:51:45', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (760, 'GET', NULL, NULL, '2022-06-07 07:52:27', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (761, 'GET', NULL, NULL, '2022-06-07 07:52:27', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (762, 'GET', NULL, NULL, '2022-06-07 07:52:28', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (763, 'GET', NULL, NULL, '2022-06-07 07:52:28', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (764, 'GET', NULL, NULL, '2022-06-07 07:52:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (765, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:52:28', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (766, 'GET', NULL, NULL, '2022-06-07 07:52:33', '/dict/item/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (767, 'POST', '{\"id\":\"3\",\"createTime\":\"2020-12-07T16:04:41\",\"updateTime\":\"2022-06-07T15:48:24\",\"type\":\"sys_normal_disable\",\"name\":\"正常\",\"value\":\"0\",\"sort\":0,\"status\":false,\"remark\":\"ddd\"}', NULL, '2022-06-07 07:52:35', '/dict/item', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (768, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:52:36', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (769, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":\"0\"}', NULL, '2022-06-07 07:52:53', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (770, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":\"0\"}', NULL, '2022-06-07 07:52:56', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (771, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":\"0\"}', NULL, '2022-06-07 07:54:07', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (772, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":\"0\"}', NULL, '2022-06-07 07:54:10', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (773, 'GET', NULL, NULL, '2022-06-07 07:59:25', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (774, 'GET', NULL, NULL, '2022-06-07 07:59:25', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (775, 'GET', NULL, NULL, '2022-06-07 07:59:26', '/dict/3', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (776, 'GET', NULL, NULL, '2022-06-07 07:59:26', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (777, 'GET', NULL, NULL, '2022-06-07 07:59:26', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (778, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\"}', NULL, '2022-06-07 07:59:26', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (779, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:29', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (780, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:31', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (781, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:31', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (782, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":1}', NULL, '2022-06-07 07:59:34', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (783, 'POST', '{\"current\":1,\"size\":10,\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:36', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (784, 'POST', '{\"current\":1,\"size\":10,\"name\":\"正常\",\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:51', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (785, 'POST', '{\"current\":1,\"size\":10,\"name\":\"正\",\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:54', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (786, 'POST', '{\"current\":1,\"size\":10,\"name\":\"\",\"type\":\"sys_normal_disable\",\"status\":0}', NULL, '2022-06-07 07:59:56', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (787, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 08:00:06', '/dict/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (788, 'GET', NULL, NULL, '2022-06-07 08:00:11', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (789, 'GET', NULL, NULL, '2022-06-07 08:00:14', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (790, 'GET', NULL, NULL, '2022-06-07 08:00:14', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (791, 'GET', NULL, NULL, '2022-06-07 08:00:14', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (792, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 08:00:14', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (793, 'GET', NULL, NULL, '2022-06-07 08:01:16', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (794, 'GET', NULL, NULL, '2022-06-07 08:01:16', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (795, 'GET', NULL, NULL, '2022-06-07 08:01:16', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (796, 'GET', NULL, NULL, '2022-06-07 08:01:16', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (797, 'GET', NULL, NULL, '2022-06-07 08:01:17', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (798, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 08:01:17', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (799, 'GET', NULL, NULL, '2022-06-07 08:02:01', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (800, 'GET', NULL, NULL, '2022-06-07 08:02:02', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (801, 'GET', NULL, NULL, '2022-06-07 08:02:02', '/dict/6', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (802, 'GET', NULL, NULL, '2022-06-07 08:02:03', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (803, 'GET', NULL, NULL, '2022-06-07 08:02:03', '/dict/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (804, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 08:02:03', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (805, 'DELETE', NULL, NULL, '2022-06-07 08:02:05', '/dict/item/9', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (806, 'POST', '{\"current\":1,\"size\":10,\"type\":\"test1\"}', NULL, '2022-06-07 08:02:05', '/dict/item/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (807, 'GET', NULL, NULL, '2022-06-07 08:02:10', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (808, 'GET', NULL, NULL, '2022-06-07 08:02:10', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (809, 'GET', NULL, NULL, '2022-06-07 08:02:10', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (810, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-07 08:02:10', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (811, 'GET', NULL, NULL, '2022-06-07 08:02:19', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (812, 'GET', NULL, NULL, '2022-06-08 01:51:18', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (813, 'GET', NULL, NULL, '2022-06-08 01:51:18', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (814, 'GET', NULL, NULL, '2022-06-08 01:51:27', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (815, 'GET', NULL, NULL, '2022-06-08 01:51:27', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (816, 'GET', NULL, NULL, '2022-06-08 01:51:37', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (817, 'GET', NULL, NULL, '2022-06-08 01:51:37', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (818, 'GET', NULL, NULL, '2022-06-08 01:52:27', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (819, 'GET', NULL, NULL, '2022-06-08 01:52:27', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (820, 'GET', NULL, NULL, '2022-06-08 01:54:01', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (821, 'GET', NULL, NULL, '2022-06-08 01:54:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (822, 'GET', NULL, NULL, '2022-06-08 02:16:11', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (823, 'GET', NULL, NULL, '2022-06-08 02:16:11', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (824, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:18:30', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (825, 'GET', NULL, NULL, '2022-06-08 02:18:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (826, 'GET', NULL, NULL, '2022-06-08 02:18:31', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (827, 'GET', NULL, NULL, '2022-06-08 02:18:31', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (828, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:19:13', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (829, 'GET', NULL, NULL, '2022-06-08 02:19:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (830, 'GET', NULL, NULL, '2022-06-08 02:19:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (831, 'GET', NULL, NULL, '2022-06-08 02:19:13', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (832, 'GET', NULL, NULL, '2022-06-08 02:19:24', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (833, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:19:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (834, 'GET', NULL, NULL, '2022-06-08 02:19:24', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (835, 'GET', NULL, NULL, '2022-06-08 02:19:24', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (836, 'GET', NULL, NULL, '2022-06-08 02:19:27', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (837, 'GET', NULL, NULL, '2022-06-08 02:19:27', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (838, 'PUT', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":0,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\",\"roleIds\":[]}', NULL, '2022-06-08 02:19:31', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (839, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:19:32', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (840, 'GET', NULL, NULL, '2022-06-08 02:21:33', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (841, 'GET', NULL, NULL, '2022-06-08 02:21:33', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (842, 'GET', NULL, NULL, '2022-06-08 02:21:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (843, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:21:33', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (844, 'GET', NULL, NULL, '2022-06-08 02:24:23', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (845, 'GET', NULL, NULL, '2022-06-08 02:24:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (846, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":1,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\",\"roleIds\":[]}', NULL, '2022-06-08 02:24:26', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (847, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:24:27', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (848, 'GET', NULL, NULL, '2022-06-08 02:24:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (849, 'GET', NULL, NULL, '2022-06-08 02:24:31', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (850, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"updateTime\":\"2022-06-08T10:24:28\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":true,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\",\"mobile\":\"15546789876\"}', NULL, '2022-06-08 02:25:24', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (851, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:25:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (852, 'GET', NULL, NULL, '2022-06-08 02:26:03', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (853, 'GET', NULL, NULL, '2022-06-08 02:26:03', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (854, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"updateTime\":\"2022-06-08T10:24:28\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":true,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\"}', NULL, '2022-06-08 02:26:06', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (855, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:26:06', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (856, 'GET', NULL, NULL, '2022-06-08 02:28:05', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (857, 'GET', NULL, NULL, '2022-06-08 02:28:05', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (858, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"updateTime\":\"2022-06-08T10:24:28\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":true,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\"}', NULL, '2022-06-08 02:28:07', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (859, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:28:08', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (860, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:31:02', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (861, 'GET', NULL, NULL, '2022-06-08 02:31:02', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (862, 'GET', NULL, NULL, '2022-06-08 02:31:02', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (863, 'GET', NULL, NULL, '2022-06-08 02:31:02', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (864, 'GET', NULL, NULL, '2022-06-08 02:31:05', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (865, 'GET', NULL, NULL, '2022-06-08 02:31:05', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (866, 'GET', NULL, NULL, '2022-06-08 02:31:06', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (867, 'GET', NULL, NULL, '2022-06-08 02:31:06', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (868, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:31:06', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (869, 'GET', NULL, NULL, '2022-06-08 02:31:06', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (870, 'GET', NULL, NULL, '2022-06-08 02:31:10', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (871, 'GET', NULL, NULL, '2022-06-08 02:31:10', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (872, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"updateTime\":\"2022-06-08T10:28:09\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":false,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\",\"roleIds\":[]}', NULL, '2022-06-08 02:31:13', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (873, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:31:13', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (874, 'GET', NULL, NULL, '2022-06-08 02:31:16', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (875, 'GET', NULL, NULL, '2022-06-08 02:31:16', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (876, 'GET', NULL, NULL, '2022-06-08 02:31:32', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (877, 'GET', NULL, NULL, '2022-06-08 02:31:33', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (878, 'GET', NULL, NULL, '2022-06-08 02:31:34', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (879, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:31:34', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (880, 'GET', NULL, NULL, '2022-06-08 02:31:34', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (881, 'GET', NULL, NULL, '2022-06-08 02:31:34', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (882, 'GET', NULL, NULL, '2022-06-08 02:31:36', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (883, 'GET', NULL, NULL, '2022-06-08 02:31:36', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (884, 'POST', '{\"id\":\"5\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T17:48:45\",\"updateTime\":\"2022-06-08T10:31:14\",\"account\":\"6G]xL\",\"name\":\"test\",\"sex\":true,\"deptId\":\"100\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"8mFxse\",\"password\":\"\",\"roleIds\":[]}', NULL, '2022-06-08 02:31:38', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (885, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:31:39', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (886, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 02:31:41', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (887, 'GET', NULL, NULL, '2022-06-08 02:31:44', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (888, 'GET', NULL, NULL, '2022-06-08 02:31:44', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (889, 'GET', NULL, NULL, '2022-06-08 02:31:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (890, 'GET', NULL, NULL, '2022-06-08 02:31:45', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (891, 'GET', NULL, NULL, '2022-06-08 02:31:45', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (892, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:31:45', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (893, 'GET', NULL, NULL, '2022-06-08 02:31:47', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (894, 'GET', NULL, NULL, '2022-06-08 02:31:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (895, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 02:31:50', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (896, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:32:40', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (897, 'GET', NULL, NULL, '2022-06-08 02:32:41', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (898, 'GET', NULL, NULL, '2022-06-08 02:32:41', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (899, 'GET', NULL, NULL, '2022-06-08 02:32:41', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (900, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:33:23', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (901, 'GET', NULL, NULL, '2022-06-08 02:33:24', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (902, 'GET', NULL, NULL, '2022-06-08 02:33:24', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (903, 'GET', NULL, NULL, '2022-06-08 02:33:24', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (904, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:33:31', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (905, 'GET', NULL, NULL, '2022-06-08 02:33:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (906, 'GET', NULL, NULL, '2022-06-08 02:33:31', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (907, 'GET', NULL, NULL, '2022-06-08 02:33:31', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (908, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:34:35', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (909, 'GET', NULL, NULL, '2022-06-08 02:34:35', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (910, 'GET', NULL, NULL, '2022-06-08 02:34:35', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (911, 'GET', NULL, NULL, '2022-06-08 02:34:35', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (912, 'GET', NULL, NULL, '2022-06-08 02:34:55', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (913, 'GET', NULL, NULL, '2022-06-08 02:34:55', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (914, 'GET', NULL, NULL, '2022-06-08 02:34:56', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (915, 'GET', NULL, NULL, '2022-06-08 02:34:56', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (916, 'GET', NULL, NULL, '2022-06-08 02:34:56', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (917, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:34:56', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (918, 'GET', NULL, NULL, '2022-06-08 02:35:11', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (919, 'GET', NULL, NULL, '2022-06-08 02:35:11', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (920, 'GET', NULL, NULL, '2022-06-08 02:35:12', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (921, 'GET', NULL, NULL, '2022-06-08 02:35:12', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (922, 'GET', NULL, NULL, '2022-06-08 02:35:12', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (923, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:35:12', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (924, 'GET', NULL, NULL, '2022-06-08 02:35:34', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (925, 'GET', NULL, NULL, '2022-06-08 02:35:34', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (926, 'GET', NULL, NULL, '2022-06-08 02:35:35', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (927, 'GET', NULL, NULL, '2022-06-08 02:35:35', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (928, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:35:35', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (929, 'GET', NULL, NULL, '2022-06-08 02:35:35', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (930, 'GET', NULL, NULL, '2022-06-08 02:35:38', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (931, 'GET', NULL, NULL, '2022-06-08 02:35:38', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (932, 'GET', NULL, NULL, '2022-06-08 02:36:14', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (933, 'GET', NULL, NULL, '2022-06-08 02:36:14', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (934, 'GET', NULL, NULL, '2022-06-08 02:38:26', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (935, 'GET', NULL, NULL, '2022-06-08 02:38:26', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (936, 'GET', NULL, NULL, '2022-06-08 02:38:27', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (937, 'GET', NULL, NULL, '2022-06-08 02:38:27', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (938, 'GET', NULL, NULL, '2022-06-08 02:38:27', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (939, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:38:27', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (940, 'GET', NULL, NULL, '2022-06-08 02:39:01', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (941, 'GET', NULL, NULL, '2022-06-08 02:39:01', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (942, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 02:39:02', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (943, 'GET', NULL, NULL, '2022-06-08 02:39:02', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (944, 'GET', NULL, NULL, '2022-06-08 02:39:02', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (945, 'GET', NULL, NULL, '2022-06-08 02:39:02', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (946, 'GET', NULL, NULL, '2022-06-08 05:37:26', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (947, 'GET', NULL, NULL, '2022-06-08 05:37:26', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (948, 'GET', NULL, NULL, '2022-06-08 05:37:27', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (949, 'GET', NULL, NULL, '2022-06-08 05:37:27', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (950, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:37:27', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (951, 'GET', NULL, NULL, '2022-06-08 05:37:27', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (952, 'GET', NULL, NULL, '2022-06-08 05:37:30', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (953, 'GET', NULL, NULL, '2022-06-08 05:37:30', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (954, 'GET', NULL, NULL, '2022-06-08 05:39:51', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (955, 'GET', NULL, NULL, '2022-06-08 05:39:51', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (956, 'GET', NULL, NULL, '2022-06-08 05:39:52', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (957, 'GET', NULL, NULL, '2022-06-08 05:39:52', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (958, 'GET', NULL, NULL, '2022-06-08 05:39:52', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (959, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:39:52', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (960, 'GET', NULL, NULL, '2022-06-08 05:40:34', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (961, 'GET', NULL, NULL, '2022-06-08 05:40:34', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (962, 'GET', NULL, NULL, '2022-06-08 05:40:35', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (963, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:40:35', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (964, 'GET', NULL, NULL, '2022-06-08 05:40:35', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (965, 'GET', NULL, NULL, '2022-06-08 05:40:35', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (966, 'GET', NULL, NULL, '2022-06-08 05:43:14', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (967, 'GET', NULL, NULL, '2022-06-08 05:43:14', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (968, 'GET', NULL, NULL, '2022-06-08 05:43:15', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (969, 'GET', NULL, NULL, '2022-06-08 05:43:15', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (970, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:43:15', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (971, 'GET', NULL, NULL, '2022-06-08 05:43:15', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (972, 'GET', NULL, NULL, '2022-06-08 05:43:32', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (973, 'GET', NULL, NULL, '2022-06-08 05:43:32', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (974, 'GET', NULL, NULL, '2022-06-08 05:43:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (975, 'GET', NULL, NULL, '2022-06-08 05:43:33', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (976, 'GET', NULL, NULL, '2022-06-08 05:43:33', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (977, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:43:33', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (978, 'GET', NULL, NULL, '2022-06-08 05:44:19', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (979, 'GET', NULL, NULL, '2022-06-08 05:44:19', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (980, 'GET', NULL, NULL, '2022-06-08 05:44:20', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (981, 'GET', NULL, NULL, '2022-06-08 05:44:20', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (982, 'GET', NULL, NULL, '2022-06-08 05:44:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (983, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:44:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (984, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:44:47', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (985, 'GET', NULL, NULL, '2022-06-08 05:44:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (986, 'GET', NULL, NULL, '2022-06-08 05:44:47', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (987, 'GET', NULL, NULL, '2022-06-08 05:44:47', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (988, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 05:45:02', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (989, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 05:46:11', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (990, 'GET', NULL, NULL, '2022-06-08 05:46:15', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (991, 'GET', NULL, NULL, '2022-06-08 05:46:15', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (992, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:46:17', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (993, 'GET', NULL, NULL, '2022-06-08 05:46:17', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (994, 'GET', NULL, NULL, '2022-06-08 05:46:17', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (995, 'GET', NULL, NULL, '2022-06-08 05:46:17', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (996, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 05:47:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (997, 'GET', NULL, NULL, '2022-06-08 05:47:27', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (998, 'GET', NULL, NULL, '2022-06-08 05:47:27', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (999, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:47:28', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1000, 'GET', NULL, NULL, '2022-06-08 05:47:28', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1001, 'GET', NULL, NULL, '2022-06-08 05:47:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1002, 'GET', NULL, NULL, '2022-06-08 05:47:28', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1003, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 05:48:15', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1004, 'GET', NULL, NULL, '2022-06-08 05:48:18', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1005, 'GET', NULL, NULL, '2022-06-08 05:48:18', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1006, 'GET', NULL, NULL, '2022-06-08 05:48:19', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1007, 'GET', NULL, NULL, '2022-06-08 05:48:19', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1008, 'GET', NULL, NULL, '2022-06-08 05:48:19', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1009, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:48:19', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1010, 'GET', NULL, NULL, '2022-06-08 05:49:18', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1011, 'GET', NULL, NULL, '2022-06-08 05:49:19', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1012, 'GET', NULL, NULL, '2022-06-08 05:49:20', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1013, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:49:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1014, 'GET', NULL, NULL, '2022-06-08 05:49:20', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1015, 'GET', NULL, NULL, '2022-06-08 05:49:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1016, 'GET', NULL, NULL, '2022-06-08 05:49:35', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1017, 'GET', NULL, NULL, '2022-06-08 05:49:36', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1018, 'GET', NULL, NULL, '2022-06-08 05:49:37', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1019, 'GET', NULL, NULL, '2022-06-08 05:49:37', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1020, 'GET', NULL, NULL, '2022-06-08 05:49:37', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1021, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:49:37', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1022, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:50:47', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1023, 'GET', NULL, NULL, '2022-06-08 05:50:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1024, 'GET', NULL, NULL, '2022-06-08 05:50:47', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1025, 'GET', NULL, NULL, '2022-06-08 05:50:47', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1026, 'GET', NULL, NULL, '2022-06-08 05:50:55', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1027, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:50:55', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1028, 'GET', NULL, NULL, '2022-06-08 05:50:56', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1029, 'GET', NULL, NULL, '2022-06-08 05:50:56', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1030, 'GET', NULL, NULL, '2022-06-08 05:52:18', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1031, 'GET', NULL, NULL, '2022-06-08 05:52:18', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1032, 'GET', NULL, NULL, '2022-06-08 05:53:39', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1033, 'GET', NULL, NULL, '2022-06-08 05:53:39', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1034, 'GET', NULL, NULL, '2022-06-08 05:53:48', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1035, 'GET', NULL, NULL, '2022-06-08 05:53:48', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1036, 'GET', NULL, NULL, '2022-06-08 05:53:49', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1037, 'GET', NULL, NULL, '2022-06-08 05:53:49', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1038, 'GET', NULL, NULL, '2022-06-08 05:53:49', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1039, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 05:53:49', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1040, 'GET', NULL, NULL, '2022-06-08 05:57:11', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1041, 'GET', NULL, NULL, '2022-06-08 05:57:11', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1042, 'GET', NULL, NULL, '2022-06-08 06:12:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1043, 'GET', NULL, NULL, '2022-06-08 06:12:58', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1044, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:12:58', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1045, 'GET', NULL, NULL, '2022-06-08 06:12:58', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1046, 'GET', NULL, NULL, '2022-06-08 06:13:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1047, 'GET', NULL, NULL, '2022-06-08 06:13:02', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1048, 'GET', NULL, NULL, '2022-06-08 06:13:02', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1049, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:14:01', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1050, 'GET', NULL, NULL, '2022-06-08 06:14:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1051, 'GET', NULL, NULL, '2022-06-08 06:14:01', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1052, 'GET', NULL, NULL, '2022-06-08 06:14:01', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1053, 'GET', NULL, NULL, '2022-06-08 06:14:03', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1054, 'GET', NULL, NULL, '2022-06-08 06:14:03', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1055, 'GET', NULL, NULL, '2022-06-08 06:14:03', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1056, 'GET', NULL, NULL, '2022-06-08 06:14:17', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1057, 'GET', NULL, NULL, '2022-06-08 06:14:18', '/user/5', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1058, 'GET', NULL, NULL, '2022-06-08 06:14:18', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1059, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:15:31', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1060, 'GET', NULL, NULL, '2022-06-08 06:15:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1061, 'GET', NULL, NULL, '2022-06-08 06:15:31', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1062, 'GET', NULL, NULL, '2022-06-08 06:15:31', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1063, 'GET', NULL, NULL, '2022-06-08 06:15:33', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1064, 'GET', NULL, NULL, '2022-06-08 06:15:33', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1065, 'GET', NULL, NULL, '2022-06-08 06:15:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1066, 'GET', NULL, NULL, '2022-06-08 06:16:18', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1067, 'GET', NULL, NULL, '2022-06-08 06:16:18', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1068, 'GET', NULL, NULL, '2022-06-08 06:16:44', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1069, 'GET', NULL, NULL, '2022-06-08 06:16:44', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1070, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:18:51', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1071, 'GET', NULL, NULL, '2022-06-08 06:18:51', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1072, 'GET', NULL, NULL, '2022-06-08 06:18:51', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1073, 'GET', NULL, NULL, '2022-06-08 06:18:51', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1074, 'GET', NULL, NULL, '2022-06-08 06:18:52', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1075, 'GET', NULL, NULL, '2022-06-08 06:18:52', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1076, 'GET', NULL, NULL, '2022-06-08 06:19:19', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1077, 'GET', NULL, NULL, '2022-06-08 06:19:19', '/user/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1078, 'GET', NULL, NULL, '2022-06-08 06:19:19', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1079, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:20:17', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1080, 'GET', NULL, NULL, '2022-06-08 06:20:17', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1081, 'GET', NULL, NULL, '2022-06-08 06:20:17', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1082, 'GET', NULL, NULL, '2022-06-08 06:20:17', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1083, 'GET', NULL, NULL, '2022-06-08 06:20:20', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1084, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:20:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1085, 'GET', NULL, NULL, '2022-06-08 06:20:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1086, 'GET', NULL, NULL, '2022-06-08 06:20:20', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1087, 'GET', NULL, NULL, '2022-06-08 06:20:22', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1088, 'GET', NULL, NULL, '2022-06-08 06:20:22', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1089, 'GET', NULL, NULL, '2022-06-08 06:23:13', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1090, 'GET', NULL, NULL, '2022-06-08 06:23:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1091, 'GET', NULL, NULL, '2022-06-08 06:23:13', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1092, 'POST', '{\"id\":\"2\",\"createBy\":\"1\",\"createTime\":\"2021-06-02T16:31:59\",\"account\":\"user\",\"name\":\"user\",\"sex\":false,\"deptId\":\"101\",\"avatar\":\"http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png\",\"remark\":\"总经理来了\",\"password\":\"\",\"roleIds\":[\"2\",\"3\"]}', NULL, '2022-06-08 06:23:20', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1093, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:23:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1094, 'GET', NULL, NULL, '2022-06-08 06:23:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1095, 'GET', NULL, NULL, '2022-06-08 06:23:23', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1096, 'GET', NULL, NULL, '2022-06-08 06:23:23', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1097, 'GET', NULL, NULL, '2022-06-08 06:29:59', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1098, 'GET', NULL, NULL, '2022-06-08 06:29:59', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1099, 'GET', NULL, NULL, '2022-06-08 06:29:59', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1100, 'GET', NULL, NULL, '2022-06-08 06:31:31', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1101, 'GET', NULL, NULL, '2022-06-08 06:31:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1102, 'GET', NULL, NULL, '2022-06-08 06:31:31', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1103, 'POST', '{\"id\":\"2\",\"account\":\"user\",\"name\":\"user\",\"sex\":false,\"deptId\":\"101\",\"remark\":\"总经理来了\",\"roleIds\":[\"2\",\"3\"],\"password\":\"\"}', NULL, '2022-06-08 06:31:42', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1104, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:31:42', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1105, 'GET', NULL, NULL, '2022-06-08 06:31:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1106, 'GET', NULL, NULL, '2022-06-08 06:31:45', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1107, 'GET', NULL, NULL, '2022-06-08 06:31:45', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1108, 'POST', '{\"id\":\"2\",\"account\":\"user\",\"name\":\"user\",\"sex\":false,\"deptId\":\"101\",\"remark\":\"总经理来了\",\"roleIds\":[\"2\",\"3\",\"4\"],\"password\":\"\"}', NULL, '2022-06-08 06:32:04', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1109, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:32:05', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1110, 'GET', NULL, NULL, '2022-06-08 06:32:17', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1111, 'GET', NULL, NULL, '2022-06-08 06:32:17', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1112, 'GET', NULL, NULL, '2022-06-08 06:32:17', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1113, 'GET', NULL, NULL, '2022-06-08 06:45:50', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1114, 'GET', NULL, NULL, '2022-06-08 06:45:50', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1115, 'GET', NULL, NULL, '2022-06-08 06:45:50', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1116, 'GET', NULL, NULL, '2022-06-08 06:47:39', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1117, 'GET', NULL, NULL, '2022-06-08 06:47:39', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1118, 'GET', NULL, NULL, '2022-06-08 06:47:39', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1119, 'GET', NULL, NULL, '2022-06-08 06:49:46', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1120, 'GET', NULL, NULL, '2022-06-08 06:49:46', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1121, 'GET', NULL, NULL, '2022-06-08 06:49:46', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1122, 'POST', '{\"id\":\"2\",\"account\":\"user\",\"name\":\"user\",\"sex\":false,\"deptId\":\"101\",\"remark\":\"总经理来了\",\"roleIds\":[\"2\",\"3\",\"4\"],\"password\":\"\"}', NULL, '2022-06-08 06:49:51', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1123, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:49:51', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1124, 'GET', NULL, NULL, '2022-06-08 06:49:53', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1125, 'GET', NULL, NULL, '2022-06-08 06:49:53', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1126, 'GET', NULL, NULL, '2022-06-08 06:49:53', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1127, 'POST', '{\"id\":\"2\",\"account\":\"user\",\"name\":\"user\",\"sex\":false,\"deptId\":\"101\",\"remark\":\"总经理来了\",\"roleIds\":[\"2\",\"3\",\"4\"],\"password\":\"\",\"mobile\":\"13567856786\"}', NULL, '2022-06-08 06:50:08', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1128, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:50:09', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1129, 'GET', NULL, NULL, '2022-06-08 06:50:10', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1130, 'GET', NULL, NULL, '2022-06-08 06:50:10', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1131, 'GET', NULL, NULL, '2022-06-08 06:50:10', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1132, 'GET', NULL, NULL, '2022-06-08 06:50:14', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1133, 'GET', NULL, NULL, '2022-06-08 06:50:14', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1134, 'GET', NULL, NULL, '2022-06-08 06:50:14', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1135, 'POST', '{\"id\":\"2\",\"account\":\"user\",\"name\":\"user\",\"sex\":true,\"mobile\":\"13567856786\",\"deptId\":\"101\",\"remark\":\"总经理来了\",\"roleIds\":[\"2\",\"3\",\"4\"],\"password\":\"\"}', NULL, '2022-06-08 06:50:16', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1136, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:50:16', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1137, 'GET', NULL, NULL, '2022-06-08 06:50:19', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1138, 'GET', NULL, NULL, '2022-06-08 06:50:20', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1139, 'GET', NULL, NULL, '2022-06-08 06:50:20', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1140, 'POST', '{\"id\":\"2\",\"account\":\"user\",\"name\":\"user\",\"sex\":true,\"mobile\":\"13567856786\",\"deptId\":\"103\",\"remark\":\"总经理来了\",\"roleIds\":[\"2\",\"3\",\"4\"],\"password\":\"\"}', NULL, '2022-06-08 06:50:24', '/user', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1141, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:50:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1142, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 06:50:35', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1143, 'POST', '{\"current\":1,\"size\":10,\"params\":{},\"page\":1}', NULL, '2022-06-08 06:50:56', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1144, 'POST', '{\"current\":1,\"size\":10,\"account\":\"admin\",\"params\":{},\"page\":1}', NULL, '2022-06-08 06:50:59', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1145, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"2321\",\"params\":{},\"page\":1}', NULL, '2022-06-08 06:51:03', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1146, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"2321\",\"params\":{},\"page\":1}', NULL, '2022-06-08 06:51:03', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1147, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"1\",\"params\":{},\"page\":1}', NULL, '2022-06-08 06:51:05', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1148, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"15\",\"params\":{},\"page\":1}', NULL, '2022-06-08 06:51:08', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1149, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1}', NULL, '2022-06-08 06:51:10', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1150, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"103\"}', NULL, '2022-06-08 06:51:11', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1151, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"104\"}', NULL, '2022-06-08 06:51:12', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1152, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"104\"}', NULL, '2022-06-08 06:51:13', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1153, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"105\"}', NULL, '2022-06-08 06:51:14', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1154, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"105\"}', NULL, '2022-06-08 06:51:14', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1155, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"105\"}', NULL, '2022-06-08 06:51:15', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1156, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"106\"}', NULL, '2022-06-08 06:51:15', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1157, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"107\"}', NULL, '2022-06-08 06:51:17', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1158, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"108\"}', NULL, '2022-06-08 06:51:17', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1159, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"109\"}', NULL, '2022-06-08 06:51:18', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1160, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"109\"}', NULL, '2022-06-08 06:51:19', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1161, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"108\"}', NULL, '2022-06-08 06:51:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1162, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"108\"}', NULL, '2022-06-08 06:51:20', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1163, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"109\"}', NULL, '2022-06-08 06:51:21', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1164, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"107\"}', NULL, '2022-06-08 06:51:22', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1165, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"106\"}', NULL, '2022-06-08 06:51:22', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1166, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"105\"}', NULL, '2022-06-08 06:51:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1167, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"105\"}', NULL, '2022-06-08 06:51:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1168, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"104\"}', NULL, '2022-06-08 06:51:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1169, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"104\"}', NULL, '2022-06-08 06:51:25', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1170, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"103\"}', NULL, '2022-06-08 06:51:25', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1171, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"103\"}', NULL, '2022-06-08 06:51:26', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1172, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"104\"}', NULL, '2022-06-08 06:51:27', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1173, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"104\"}', NULL, '2022-06-08 06:51:28', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1174, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"105\"}', NULL, '2022-06-08 06:51:29', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1175, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"106\"}', NULL, '2022-06-08 06:51:30', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1176, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"107\"}', NULL, '2022-06-08 06:51:31', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1177, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"107\"}', NULL, '2022-06-08 06:51:32', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1178, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"107\"}', NULL, '2022-06-08 06:51:37', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1179, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"107\"}', NULL, '2022-06-08 06:51:39', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1180, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"109\"}', NULL, '2022-06-08 06:52:09', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1181, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"109\"}', NULL, '2022-06-08 06:53:39', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1182, 'POST', '{\"current\":1,\"size\":10,\"account\":\"\",\"mobile\":\"155\",\"params\":{},\"page\":1,\"id\":\"108\"}', NULL, '2022-06-08 06:53:42', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1183, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 06:54:17', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1184, 'GET', NULL, NULL, '2022-06-08 06:54:17', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1185, 'GET', NULL, NULL, '2022-06-08 06:54:17', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1186, 'GET', NULL, NULL, '2022-06-08 06:54:17', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1187, 'POST', '{\"current\":1,\"size\":10,\"deptId\":\"109\",\"params\":{}}', NULL, '2022-06-08 06:54:19', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1188, 'POST', '{\"current\":1,\"size\":10,\"deptId\":\"108\",\"params\":{}}', NULL, '2022-06-08 06:54:22', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1189, 'POST', '{\"current\":1,\"size\":10,\"deptId\":\"101\",\"params\":{}}', NULL, '2022-06-08 06:54:23', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1190, 'POST', '{\"current\":1,\"size\":10,\"deptId\":\"100\",\"params\":{}}', NULL, '2022-06-08 06:54:24', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1191, 'GET', NULL, NULL, '2022-06-08 06:54:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1192, 'POST', '{}', NULL, '2022-06-08 06:54:28', '/dept/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1193, 'POST', '{\"deptName\":\"AT\"}', NULL, '2022-06-08 06:59:55', '/dept/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1194, 'POST', '{\"deptName\":\"AT\"}', NULL, '2022-06-08 07:00:01', '/dept/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1195, 'POST', '{}', NULL, '2022-06-08 07:00:56', '/dept/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1196, 'GET', NULL, NULL, '2022-06-08 07:00:56', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1197, 'POST', '{}', NULL, '2022-06-08 07:01:39', '/dept/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1198, 'GET', NULL, NULL, '2022-06-08 07:02:53', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1199, 'GET', NULL, NULL, '2022-06-08 07:02:53', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1200, 'GET', NULL, NULL, '2022-06-08 07:02:55', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1201, 'GET', NULL, NULL, '2022-06-08 07:03:24', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1202, 'GET', NULL, NULL, '2022-06-08 07:03:25', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1203, 'GET', NULL, NULL, '2022-06-08 07:03:30', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1204, 'GET', NULL, NULL, '2022-06-08 07:03:30', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1205, 'GET', NULL, NULL, '2022-06-08 07:03:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1206, 'GET', NULL, NULL, '2022-06-08 07:04:36', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1207, 'GET', NULL, NULL, '2022-06-08 07:04:36', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1208, 'GET', NULL, NULL, '2022-06-08 07:05:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1209, 'GET', NULL, NULL, '2022-06-08 07:08:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1210, 'GET', NULL, NULL, '2022-06-08 07:08:01', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1211, 'GET', NULL, NULL, '2022-06-08 07:08:12', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1212, 'GET', NULL, NULL, '2022-06-08 07:08:12', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1213, 'GET', NULL, NULL, '2022-06-08 07:08:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1214, 'GET', NULL, NULL, '2022-06-08 07:08:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1215, 'GET', NULL, NULL, '2022-06-08 07:08:16', '/dept/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1216, 'GET', NULL, NULL, '2022-06-08 07:08:16', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1217, 'GET', NULL, NULL, '2022-06-08 07:08:19', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1218, 'GET', NULL, NULL, '2022-06-08 07:08:19', '/dept/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1219, 'GET', NULL, NULL, '2022-06-08 07:08:37', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1220, 'GET', NULL, NULL, '2022-06-08 07:08:37', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1221, 'GET', NULL, NULL, '2022-06-08 07:08:39', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1222, 'GET', NULL, NULL, '2022-06-08 07:08:39', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1223, 'GET', NULL, NULL, '2022-06-08 07:09:43', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1224, 'GET', NULL, NULL, '2022-06-08 07:09:43', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1225, 'GET', NULL, NULL, '2022-06-08 07:10:11', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1226, 'GET', NULL, NULL, '2022-06-08 07:10:11', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1227, 'GET', NULL, NULL, '2022-06-08 07:10:12', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1228, 'GET', NULL, NULL, '2022-06-08 07:10:12', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1229, 'GET', NULL, NULL, '2022-06-08 07:10:14', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1230, 'GET', NULL, NULL, '2022-06-08 07:10:14', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1231, 'GET', NULL, NULL, '2022-06-08 07:11:36', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1232, 'GET', NULL, NULL, '2022-06-08 07:11:37', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1233, 'GET', NULL, NULL, '2022-06-08 07:11:37', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1234, 'GET', NULL, NULL, '2022-06-08 07:11:37', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1235, 'GET', NULL, NULL, '2022-06-08 07:12:42', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1236, 'GET', NULL, NULL, '2022-06-08 07:12:42', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1237, 'GET', NULL, NULL, '2022-06-08 07:12:47', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1238, 'GET', NULL, NULL, '2022-06-08 07:12:47', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1239, 'GET', NULL, NULL, '2022-06-08 07:12:48', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1240, 'GET', NULL, NULL, '2022-06-08 07:12:48', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1241, 'GET', NULL, NULL, '2022-06-08 07:12:50', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1242, 'GET', NULL, NULL, '2022-06-08 07:12:50', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1243, 'GET', NULL, NULL, '2022-06-08 07:13:00', '/dept/list/exclude/undefined', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1244, 'GET', NULL, NULL, '2022-06-08 07:13:00', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1245, 'GET', NULL, NULL, '2022-06-08 07:13:40', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1246, 'GET', NULL, NULL, '2022-06-08 07:13:40', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1247, 'GET', NULL, NULL, '2022-06-08 07:13:41', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1248, 'GET', NULL, NULL, '2022-06-08 07:14:54', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1249, 'GET', NULL, NULL, '2022-06-08 07:15:00', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1250, 'GET', NULL, NULL, '2022-06-08 07:15:00', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1251, 'GET', NULL, NULL, '2022-06-08 07:15:03', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1252, 'GET', NULL, NULL, '2022-06-08 07:15:03', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1253, 'GET', NULL, NULL, '2022-06-08 07:15:11', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1254, 'GET', NULL, NULL, '2022-06-08 07:15:48', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1255, 'GET', NULL, NULL, '2022-06-08 07:16:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1256, 'GET', NULL, NULL, '2022-06-08 07:16:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1257, 'GET', NULL, NULL, '2022-06-08 07:16:25', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1258, 'GET', NULL, NULL, '2022-06-08 07:16:27', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1259, 'GET', NULL, NULL, '2022-06-08 07:23:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1260, 'GET', NULL, NULL, '2022-06-08 07:23:28', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1261, 'GET', NULL, NULL, '2022-06-08 07:23:51', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1262, 'GET', NULL, NULL, '2022-06-08 07:23:51', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1263, 'GET', NULL, NULL, '2022-06-08 07:29:24', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1264, 'GET', NULL, NULL, '2022-06-08 07:29:25', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1265, 'GET', NULL, NULL, '2022-06-08 07:29:25', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1266, 'GET', NULL, NULL, '2022-06-08 07:29:25', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1267, 'GET', NULL, NULL, '2022-06-08 07:29:27', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1268, 'GET', NULL, NULL, '2022-06-08 07:29:29', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1269, 'GET', NULL, NULL, '2022-06-08 07:29:33', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1270, 'GET', NULL, NULL, '2022-06-08 07:31:53', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1271, 'GET', NULL, NULL, '2022-06-08 07:35:00', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1272, 'GET', NULL, NULL, '2022-06-08 07:35:00', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1273, 'GET', NULL, NULL, '2022-06-08 07:35:28', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1274, 'GET', NULL, NULL, '2022-06-08 07:35:32', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1275, 'GET', NULL, NULL, '2022-06-08 07:35:46', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1276, 'GET', NULL, NULL, '2022-06-08 07:36:15', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1277, 'GET', NULL, NULL, '2022-06-08 07:36:15', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1278, 'GET', NULL, NULL, '2022-06-08 07:36:17', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1279, 'GET', NULL, NULL, '2022-06-08 07:36:25', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1280, 'GET', NULL, NULL, '2022-06-08 07:36:25', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1281, 'GET', NULL, NULL, '2022-06-08 07:36:30', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1282, 'GET', NULL, NULL, '2022-06-08 07:36:30', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1283, 'GET', NULL, NULL, '2022-06-08 07:36:31', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1284, 'GET', NULL, NULL, '2022-06-08 07:36:32', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1285, 'GET', NULL, NULL, '2022-06-08 07:36:34', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1286, 'GET', NULL, NULL, '2022-06-08 07:37:50', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1287, 'GET', NULL, NULL, '2022-06-08 07:37:50', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1288, 'GET', NULL, NULL, '2022-06-08 07:37:52', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1289, 'GET', NULL, NULL, '2022-06-08 07:37:52', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1290, 'GET', NULL, NULL, '2022-06-08 07:37:54', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1291, 'GET', NULL, NULL, '2022-06-08 07:38:03', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1292, 'GET', NULL, NULL, '2022-06-08 07:38:09', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1293, 'GET', NULL, NULL, '2022-06-08 07:38:15', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1294, 'GET', NULL, NULL, '2022-06-08 07:38:19', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1295, 'GET', NULL, NULL, '2022-06-08 07:38:22', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1296, 'GET', NULL, NULL, '2022-06-08 07:38:25', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1297, 'GET', NULL, NULL, '2022-06-08 07:40:57', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1298, 'GET', NULL, NULL, '2022-06-08 07:40:57', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1299, 'GET', NULL, NULL, '2022-06-08 07:41:00', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1300, 'GET', NULL, NULL, '2022-06-08 07:41:00', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1301, 'GET', NULL, NULL, '2022-06-08 07:41:02', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1302, 'GET', NULL, NULL, '2022-06-08 07:41:04', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1303, 'GET', NULL, NULL, '2022-06-08 07:41:12', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1304, 'GET', NULL, NULL, '2022-06-08 07:41:12', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1305, 'GET', NULL, NULL, '2022-06-08 07:41:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1306, 'GET', NULL, NULL, '2022-06-08 07:41:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1307, 'GET', NULL, NULL, '2022-06-08 07:41:14', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1308, 'GET', NULL, NULL, '2022-06-08 07:43:45', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1309, 'GET', NULL, NULL, '2022-06-08 07:43:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1310, 'GET', NULL, NULL, '2022-06-08 07:44:48', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1311, 'GET', NULL, NULL, '2022-06-08 07:44:48', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1312, 'GET', NULL, NULL, '2022-06-08 07:44:50', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1313, 'GET', NULL, NULL, '2022-06-08 07:44:51', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1314, 'GET', NULL, NULL, '2022-06-08 07:45:21', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1315, 'GET', NULL, NULL, '2022-06-08 07:45:22', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1316, 'GET', NULL, NULL, '2022-06-08 07:45:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1317, 'GET', NULL, NULL, '2022-06-08 07:45:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1318, 'GET', NULL, NULL, '2022-06-08 07:45:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1319, 'GET', NULL, NULL, '2022-06-08 07:45:33', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1320, 'GET', NULL, NULL, '2022-06-08 07:47:04', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1321, 'GET', NULL, NULL, '2022-06-08 07:47:04', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1322, 'GET', NULL, NULL, '2022-06-08 07:47:06', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1323, 'GET', NULL, NULL, '2022-06-08 07:47:06', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1324, 'GET', NULL, NULL, '2022-06-08 07:47:26', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1325, 'GET', NULL, NULL, '2022-06-08 07:47:27', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1326, 'GET', NULL, NULL, '2022-06-08 07:47:51', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1327, 'GET', NULL, NULL, '2022-06-08 07:47:51', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1328, 'GET', NULL, NULL, '2022-06-08 07:47:59', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1329, 'GET', NULL, NULL, '2022-06-08 07:48:00', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1330, 'GET', NULL, NULL, '2022-06-08 07:48:02', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1331, 'GET', NULL, NULL, '2022-06-08 07:48:20', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1332, 'GET', NULL, NULL, '2022-06-08 07:48:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1333, 'GET', NULL, NULL, '2022-06-08 07:48:23', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1334, 'GET', NULL, NULL, '2022-06-08 07:49:42', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1335, 'GET', NULL, NULL, '2022-06-08 07:49:42', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1336, 'GET', NULL, NULL, '2022-06-08 07:49:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1337, 'GET', NULL, NULL, '2022-06-08 07:49:47', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1338, 'GET', NULL, NULL, '2022-06-08 07:50:04', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1339, 'GET', NULL, NULL, '2022-06-08 07:50:05', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1340, 'GET', NULL, NULL, '2022-06-08 07:50:10', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1341, 'GET', NULL, NULL, '2022-06-08 07:51:44', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1342, 'GET', NULL, NULL, '2022-06-08 07:51:45', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1343, 'GET', NULL, NULL, '2022-06-08 07:51:46', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1344, 'GET', NULL, NULL, '2022-06-08 07:52:42', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1345, 'GET', NULL, NULL, '2022-06-08 07:52:42', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1346, 'GET', NULL, NULL, '2022-06-08 07:53:29', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1347, 'GET', NULL, NULL, '2022-06-08 07:53:29', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1348, 'GET', NULL, NULL, '2022-06-08 07:55:54', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1349, 'GET', NULL, NULL, '2022-06-08 07:55:54', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1350, 'GET', NULL, NULL, '2022-06-08 07:55:55', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1351, 'GET', NULL, NULL, '2022-06-08 07:55:55', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1352, 'GET', NULL, NULL, '2022-06-08 07:57:48', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1353, 'GET', NULL, NULL, '2022-06-08 07:57:48', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1354, 'GET', NULL, NULL, '2022-06-08 07:57:50', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1355, 'GET', NULL, NULL, '2022-06-08 08:04:50', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1356, 'GET', NULL, NULL, '2022-06-08 08:04:50', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1357, 'GET', NULL, NULL, '2022-06-08 08:04:52', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1358, 'GET', NULL, NULL, '2022-06-08 08:04:52', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1359, 'GET', NULL, NULL, '2022-06-08 08:04:58', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1360, 'GET', NULL, NULL, '2022-06-08 08:04:58', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1361, 'GET', NULL, NULL, '2022-06-08 08:05:00', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1362, 'GET', NULL, NULL, '2022-06-08 08:05:03', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1363, 'GET', NULL, NULL, '2022-06-08 08:05:59', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1364, 'GET', NULL, NULL, '2022-06-08 08:05:59', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1365, 'GET', NULL, NULL, '2022-06-08 08:06:02', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1366, 'GET', NULL, NULL, '2022-06-08 08:06:30', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1367, 'GET', NULL, NULL, '2022-06-08 08:06:30', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1368, 'GET', NULL, NULL, '2022-06-08 08:06:33', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1369, 'GET', NULL, NULL, '2022-06-08 08:08:14', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1370, 'GET', NULL, NULL, '2022-06-08 08:08:36', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1371, 'GET', NULL, NULL, '2022-06-08 08:08:36', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1372, 'GET', NULL, NULL, '2022-06-08 08:08:38', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1373, 'GET', NULL, NULL, '2022-06-08 08:12:08', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1374, 'GET', NULL, NULL, '2022-06-08 08:13:36', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1375, 'GET', NULL, NULL, '2022-06-08 08:14:50', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1376, 'GET', NULL, NULL, '2022-06-08 08:14:50', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1377, 'GET', NULL, NULL, '2022-06-08 08:15:19', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1378, 'GET', NULL, NULL, '2022-06-08 08:15:20', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1379, 'GET', NULL, NULL, '2022-06-08 08:15:22', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1380, 'GET', NULL, NULL, '2022-06-08 08:20:35', '/user/info', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1381, 'GET', NULL, NULL, '2022-06-08 08:20:36', '/menu', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1382, 'GET', NULL, NULL, '2022-06-08 08:20:38', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1383, 'GET', NULL, NULL, '2022-06-08 08:20:38', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1384, 'GET', NULL, NULL, '2022-06-08 08:20:54', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1385, 'GET', NULL, NULL, '2022-06-08 08:20:54', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1386, 'GET', NULL, NULL, '2022-06-08 08:21:14', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1387, 'GET', NULL, NULL, '2022-06-08 08:21:14', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1388, 'GET', NULL, NULL, '2022-06-08 08:21:16', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1389, 'GET', NULL, NULL, '2022-06-08 08:21:16', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1390, 'GET', NULL, NULL, '2022-06-08 08:21:38', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1391, 'GET', NULL, NULL, '2022-06-08 08:21:38', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1392, 'GET', NULL, NULL, '2022-06-08 08:21:48', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1393, 'GET', NULL, NULL, '2022-06-08 08:21:48', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1394, 'GET', NULL, NULL, '2022-06-08 08:22:56', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1395, 'GET', NULL, NULL, '2022-06-08 08:22:56', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1396, 'GET', NULL, NULL, '2022-06-08 08:22:57', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1397, 'GET', NULL, NULL, '2022-06-08 08:22:57', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1398, 'GET', NULL, NULL, '2022-06-08 08:23:36', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1399, 'GET', NULL, NULL, '2022-06-08 08:23:36', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1400, 'GET', NULL, NULL, '2022-06-08 08:23:37', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1401, 'GET', NULL, NULL, '2022-06-08 08:26:05', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1402, 'GET', NULL, NULL, '2022-06-08 08:26:22', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1403, 'GET', NULL, NULL, '2022-06-08 08:26:22', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1404, 'GET', NULL, NULL, '2022-06-08 08:26:24', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1405, 'GET', NULL, NULL, '2022-06-08 08:27:13', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1406, 'GET', NULL, NULL, '2022-06-08 08:27:13', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1407, 'GET', NULL, NULL, '2022-06-08 08:27:15', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1408, 'GET', NULL, NULL, '2022-06-08 08:27:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1409, 'GET', NULL, NULL, '2022-06-08 08:27:34', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1410, 'GET', NULL, NULL, '2022-06-08 08:27:35', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1411, 'GET', NULL, NULL, '2022-06-08 08:27:56', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1412, 'GET', NULL, NULL, '2022-06-08 08:27:56', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1413, 'GET', NULL, NULL, '2022-06-08 08:27:57', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1414, 'GET', NULL, NULL, '2022-06-08 08:28:59', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1415, 'GET', NULL, NULL, '2022-06-08 08:28:59', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1416, 'GET', NULL, NULL, '2022-06-08 08:31:04', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1417, 'GET', NULL, NULL, '2022-06-08 08:31:04', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1418, 'GET', NULL, NULL, '2022-06-08 08:40:37', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1419, 'GET', NULL, NULL, '2022-06-08 08:40:37', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1420, 'GET', NULL, NULL, '2022-06-08 08:41:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1421, 'GET', NULL, NULL, '2022-06-08 08:41:28', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1422, 'GET', NULL, NULL, '2022-06-08 08:41:29', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1423, 'GET', NULL, NULL, '2022-06-08 08:41:29', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1424, 'GET', NULL, NULL, '2022-06-08 08:42:09', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1425, 'GET', NULL, NULL, '2022-06-08 08:42:09', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1426, 'GET', NULL, NULL, '2022-06-08 08:42:10', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1427, 'GET', NULL, NULL, '2022-06-08 08:42:22', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1428, 'GET', NULL, NULL, '2022-06-08 08:42:22', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1429, 'GET', NULL, NULL, '2022-06-08 08:42:24', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1430, 'GET', NULL, NULL, '2022-06-08 08:43:16', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1431, 'GET', NULL, NULL, '2022-06-08 08:43:16', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1432, 'GET', NULL, NULL, '2022-06-08 08:43:19', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1433, 'GET', NULL, NULL, '2022-06-08 08:44:28', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1434, 'GET', NULL, NULL, '2022-06-08 08:44:28', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1435, 'GET', NULL, NULL, '2022-06-08 08:44:33', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1436, 'GET', NULL, NULL, '2022-06-08 08:50:04', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1437, 'GET', NULL, NULL, '2022-06-08 08:50:04', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1438, 'GET', NULL, NULL, '2022-06-08 08:50:05', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1439, 'GET', NULL, NULL, '2022-06-08 08:50:32', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1440, 'GET', NULL, NULL, '2022-06-08 08:50:32', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1441, 'GET', NULL, NULL, '2022-06-08 08:50:34', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1442, 'GET', NULL, NULL, '2022-06-08 08:51:10', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1443, 'GET', NULL, NULL, '2022-06-08 08:51:10', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1444, 'GET', NULL, NULL, '2022-06-08 08:51:11', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1445, 'GET', NULL, NULL, '2022-06-08 08:51:29', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1446, 'GET', NULL, NULL, '2022-06-08 08:51:29', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1447, 'GET', NULL, NULL, '2022-06-08 08:51:30', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1448, 'GET', NULL, NULL, '2022-06-08 08:53:03', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1449, 'GET', NULL, NULL, '2022-06-08 08:53:03', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1450, 'GET', NULL, NULL, '2022-06-08 08:53:09', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1451, 'GET', NULL, NULL, '2022-06-08 08:53:33', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1452, 'GET', NULL, NULL, '2022-06-08 08:53:33', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1453, 'GET', NULL, NULL, '2022-06-08 08:54:23', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1454, 'GET', NULL, NULL, '2022-06-08 08:54:23', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1455, 'GET', NULL, NULL, '2022-06-08 08:55:06', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1456, 'GET', NULL, NULL, '2022-06-08 08:56:24', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1457, 'GET', NULL, NULL, '2022-06-08 08:56:24', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1458, 'GET', NULL, NULL, '2022-06-08 08:56:29', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1459, 'GET', NULL, NULL, '2022-06-08 08:56:30', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1460, 'GET', NULL, NULL, '2022-06-08 08:56:54', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1461, 'GET', NULL, NULL, '2022-06-08 08:56:54', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1462, 'GET', NULL, NULL, '2022-06-08 08:56:57', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1463, 'GET', NULL, NULL, '2022-06-08 08:57:04', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1464, 'GET', NULL, NULL, '2022-06-08 08:57:09', '/dept/102', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1465, 'GET', NULL, NULL, '2022-06-08 09:00:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1466, 'GET', NULL, NULL, '2022-06-08 09:00:02', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1467, 'GET', NULL, NULL, '2022-06-08 09:00:29', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1468, 'GET', NULL, NULL, '2022-06-08 09:00:29', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1469, 'GET', NULL, NULL, '2022-06-08 09:00:31', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1470, 'GET', NULL, NULL, '2022-06-08 09:00:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1471, 'GET', NULL, NULL, '2022-06-08 09:00:58', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1472, 'GET', NULL, NULL, '2022-06-08 09:00:58', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1473, 'GET', NULL, NULL, '2022-06-08 09:01:05', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1474, 'GET', NULL, NULL, '2022-06-08 09:01:05', '/dept/102', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1475, 'GET', NULL, NULL, '2022-06-08 09:01:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1476, 'GET', NULL, NULL, '2022-06-08 09:01:47', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1477, 'GET', NULL, NULL, '2022-06-08 09:01:50', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1478, 'GET', NULL, NULL, '2022-06-08 09:02:03', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1479, 'GET', NULL, NULL, '2022-06-08 09:02:03', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1480, 'GET', NULL, NULL, '2022-06-08 09:02:07', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1481, 'GET', NULL, NULL, '2022-06-08 09:02:07', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1482, 'GET', NULL, NULL, '2022-06-08 09:02:11', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1483, 'GET', NULL, NULL, '2022-06-08 09:02:11', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1484, 'GET', NULL, NULL, '2022-06-08 09:02:14', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1485, 'GET', NULL, NULL, '2022-06-08 09:02:14', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1486, 'GET', NULL, NULL, '2022-06-08 09:02:53', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1487, 'GET', NULL, NULL, '2022-06-08 09:02:53', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1488, 'GET', NULL, NULL, '2022-06-08 09:02:57', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1489, 'GET', NULL, NULL, '2022-06-08 09:03:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1490, 'GET', NULL, NULL, '2022-06-08 09:03:06', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1491, 'GET', NULL, NULL, '2022-06-08 09:03:24', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1492, 'GET', NULL, NULL, '2022-06-08 09:03:25', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1493, 'GET', NULL, NULL, '2022-06-08 09:03:28', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1494, 'GET', NULL, NULL, '2022-06-08 09:03:28', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1495, 'GET', NULL, NULL, '2022-06-08 09:03:58', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1496, 'GET', NULL, NULL, '2022-06-08 09:03:58', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1497, 'GET', NULL, NULL, '2022-06-08 09:05:06', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1498, 'GET', NULL, NULL, '2022-06-08 09:05:06', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1499, 'GET', NULL, NULL, '2022-06-08 09:05:08', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1500, 'GET', NULL, NULL, '2022-06-08 09:05:14', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1501, 'GET', NULL, NULL, '2022-06-08 09:05:15', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1502, 'GET', NULL, NULL, '2022-06-08 09:05:30', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1503, 'GET', NULL, NULL, '2022-06-08 09:05:56', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1504, 'GET', NULL, NULL, '2022-06-08 09:05:56', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1505, 'GET', NULL, NULL, '2022-06-08 09:05:57', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1506, 'GET', NULL, NULL, '2022-06-08 09:06:02', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1507, 'GET', NULL, NULL, '2022-06-08 09:06:04', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1508, 'GET', NULL, NULL, '2022-06-08 09:06:41', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1509, 'GET', NULL, NULL, '2022-06-08 09:06:41', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1510, 'GET', NULL, NULL, '2022-06-08 09:06:43', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1511, 'GET', NULL, NULL, '2022-06-08 09:06:47', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1512, 'GET', NULL, NULL, '2022-06-08 09:06:54', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1513, 'GET', NULL, NULL, '2022-06-08 09:09:24', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1514, 'GET', NULL, NULL, '2022-06-08 09:09:24', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1515, 'GET', NULL, NULL, '2022-06-08 09:09:27', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1516, 'GET', NULL, NULL, '2022-06-08 09:09:31', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1517, 'GET', NULL, NULL, '2022-06-08 09:09:33', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1518, 'GET', NULL, NULL, '2022-06-08 09:10:38', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1519, 'GET', NULL, NULL, '2022-06-08 09:10:38', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1520, 'GET', NULL, NULL, '2022-06-08 09:10:53', '/dept/109', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1521, 'POST', '{\"id\":\"109\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"102\",\"name\":\"财务部门\",\"sort\":3}', NULL, '2022-06-08 09:10:55', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1522, 'GET', NULL, NULL, '2022-06-08 09:10:56', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1523, 'GET', NULL, NULL, '2022-06-08 09:13:12', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1524, 'GET', NULL, NULL, '2022-06-08 09:13:12', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1525, 'GET', NULL, NULL, '2022-06-08 09:13:14', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1526, 'GET', NULL, NULL, '2022-06-08 09:13:54', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1527, 'GET', NULL, NULL, '2022-06-08 09:13:54', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1528, 'GET', NULL, NULL, '2022-06-08 09:13:55', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1529, 'POST', '{\"id\":\"101\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"100\",\"name\":\"深圳总公司\",\"sort\":1}', NULL, '2022-06-08 09:13:59', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1530, 'GET', NULL, NULL, '2022-06-08 09:13:59', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1531, 'GET', NULL, NULL, '2022-06-08 09:14:20', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1532, 'GET', NULL, NULL, '2022-06-08 09:14:30', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1533, 'GET', NULL, NULL, '2022-06-08 09:15:20', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1534, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 09:15:21', '/user/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1535, 'GET', NULL, NULL, '2022-06-08 09:15:21', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1536, 'GET', NULL, NULL, '2022-06-08 09:15:21', '/dict/item/type/sys_user_sex', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1537, 'GET', NULL, NULL, '2022-06-08 09:15:22', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1538, 'GET', NULL, NULL, '2022-06-08 09:15:22', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1539, 'GET', NULL, NULL, '2022-06-08 09:15:22', '/user/2', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1540, 'GET', NULL, NULL, '2022-06-08 09:15:28', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1541, 'GET', NULL, NULL, '2022-06-08 09:15:28', '/role/list', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1542, 'GET', NULL, NULL, '2022-06-08 09:16:31', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1543, 'GET', NULL, NULL, '2022-06-08 09:16:31', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1544, 'GET', NULL, NULL, '2022-06-08 09:16:55', '/dept/100', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1545, 'POST', '{\"id\":\"100\",\"createTime\":\"2020-12-01T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"-1\",\"name\":\"DD-CAT\",\"sort\":0,\"code\":\"000000\"}', NULL, '2022-06-08 09:17:01', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1546, 'GET', NULL, NULL, '2022-06-08 09:17:02', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1547, 'GET', NULL, NULL, '2022-06-08 09:17:03', '/dept/101', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1548, 'POST', '{\"id\":\"101\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"100\",\"name\":\"深圳总公司\",\"sort\":1,\"code\":\"100100\"}', NULL, '2022-06-08 09:17:11', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1549, 'GET', NULL, NULL, '2022-06-08 09:17:11', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1550, 'GET', NULL, NULL, '2022-06-08 09:17:13', '/dept/102', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1551, 'POST', '{\"id\":\"102\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"100\",\"name\":\"长沙分公司\",\"sort\":2,\"code\":\"100200\"}', NULL, '2022-06-08 09:17:18', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1552, 'GET', NULL, NULL, '2022-06-08 09:17:18', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1553, 'GET', NULL, NULL, '2022-06-08 09:17:19', '/dept/103', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1554, 'POST', '{\"id\":\"103\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"101\",\"name\":\"研发部门\",\"sort\":1,\"code\":\"100101\"}', NULL, '2022-06-08 09:17:26', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1555, 'GET', NULL, NULL, '2022-06-08 09:17:26', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1556, 'GET', NULL, NULL, '2022-06-08 09:17:28', '/dept/104', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1557, 'GET', NULL, NULL, '2022-06-08 09:17:32', '/dept/104', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1558, 'POST', '{\"id\":\"104\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"101\",\"name\":\"市场部门\",\"sort\":2,\"code\":\"100102\"}', NULL, '2022-06-08 09:17:36', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1559, 'GET', NULL, NULL, '2022-06-08 09:17:36', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1560, 'GET', NULL, NULL, '2022-06-08 09:17:37', '/dept/105', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1561, 'POST', '{\"id\":\"105\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"101\",\"name\":\"测试部门\",\"sort\":3,\"code\":\"100103\"}', NULL, '2022-06-08 09:17:40', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1562, 'GET', NULL, NULL, '2022-06-08 09:17:40', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1563, 'GET', NULL, NULL, '2022-06-08 09:17:42', '/dept/106', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1564, 'POST', '{\"id\":\"106\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"101\",\"name\":\"财务部门\",\"sort\":4,\"code\":\"100104\"}', NULL, '2022-06-08 09:17:45', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1565, 'GET', NULL, NULL, '2022-06-08 09:17:45', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1566, 'GET', NULL, NULL, '2022-06-08 09:17:56', '/dept/107', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1567, 'POST', '{\"id\":\"107\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"101\",\"name\":\"运维部门\",\"sort\":5,\"code\":\"100105\"}', NULL, '2022-06-08 09:18:00', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1568, 'GET', NULL, NULL, '2022-06-08 09:18:01', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1569, 'GET', NULL, NULL, '2022-06-08 09:18:03', '/dept/108', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1570, 'POST', '{\"id\":\"108\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"102\",\"name\":\"市场部门\",\"sort\":1,\"code\":\"100201\"}', NULL, '2022-06-08 09:18:07', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1571, 'GET', NULL, NULL, '2022-06-08 09:18:07', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1572, 'GET', NULL, NULL, '2022-06-08 09:18:08', '/dept/109', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1573, 'POST', '{\"id\":\"109\",\"createTime\":\"2018-03-16T11:33:00\",\"updateTime\":\"2018-03-16T11:33:00\",\"parentId\":\"102\",\"name\":\"财务部门\",\"sort\":2,\"code\":\"100202\"}', NULL, '2022-06-08 09:18:12', '/dept', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1574, 'GET', NULL, NULL, '2022-06-08 09:18:12', '/dept/tree', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1575, 'POST', '{\"current\":1,\"size\":10,\"params\":{}}', NULL, '2022-06-08 09:18:16', '/role/page', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1576, 'GET', NULL, NULL, '2022-06-08 09:18:16', '/dict/item/type/sys_normal_disable', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1577, 'GET', NULL, NULL, '2022-06-08 09:18:21', '/role/1', '127.0.0.1:8081');
INSERT INTO `sys_log` VALUES (1578, 'GET', NULL, NULL, '2022-06-08 09:18:22', '/menu/roleMenuTreeselect/1', '127.0.0.1:8081');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端URL',
  `parent_id` int NULL DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'VUE页面',
  `sort` int NULL DEFAULT 1 COMMENT '排序值',
  `type` tinyint NULL DEFAULT 0 COMMENT '菜单类型 （0目录 1菜单 2按钮）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `flag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1000, '系统管理', NULL, 'system', -1, 'system', '', 1, 0, 1, '2018-09-28 08:29:53', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1100, '用户管理', NULL, 'user', 1000, 'user', 'system/user/index', 1, 1, 1, '2017-11-02 22:24:37', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1101, '用户新增', 'sys:user:add', NULL, 1100, NULL, NULL, NULL, 2, 1, '2017-11-08 09:52:09', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1102, '用户修改', 'sys:user:edit', NULL, 1100, NULL, NULL, NULL, 2, 1, '2017-11-08 09:52:48', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1103, '用户删除', 'sys:user:del', NULL, 1100, NULL, NULL, NULL, 2, 1, '2017-11-08 09:54:01', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1200, '菜单管理', NULL, 'menu', 1000, 'tree-table', 'system/menu/index', 2, 1, 1, '2017-11-08 09:57:27', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1201, '菜单新增', 'sys:menu:add', NULL, 1200, NULL, NULL, NULL, 2, 1, '2017-11-08 10:15:53', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1202, '菜单修改', 'sys:menu:edit', NULL, 1200, NULL, NULL, NULL, 2, 1, '2017-11-08 10:16:23', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1203, '菜单删除', 'sys:menu:del', NULL, 1200, NULL, NULL, NULL, 2, 1, '2017-11-08 10:16:43', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1300, '角色管理', NULL, 'role', 1000, 'peoples', 'system/role/index', 3, 1, 1, '2017-11-08 10:13:37', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1301, '角色新增', 'sys:role:add', NULL, 1300, NULL, NULL, NULL, 2, 1, '2017-11-08 10:14:18', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1302, '角色修改', 'sys:role:edit', NULL, 1300, NULL, NULL, NULL, 2, 1, '2017-11-08 10:14:41', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1303, '角色删除', 'sys:role:del', NULL, 1300, NULL, NULL, NULL, 2, 1, '2017-11-08 10:14:59', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1304, '分配权限', 'sys:role:perm', NULL, 1300, NULL, NULL, NULL, 2, 1, '2018-04-20 07:22:55', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1400, '部门管理', NULL, 'dept', 1000, 'tree', 'system/dept/index', 4, 1, 1, '2018-01-20 13:17:19', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1401, '部门新增', 'sys:dept:add', NULL, 1400, NULL, NULL, NULL, 2, 1, '2018-01-20 14:56:16', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1402, '部门修改', 'sys:dept:edit', NULL, 1400, NULL, NULL, NULL, 2, 1, '2018-01-20 14:56:59', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (1403, '部门删除', 'sys:dept:del', NULL, 1400, NULL, NULL, NULL, 2, 1, '2018-01-20 14:57:28', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2000, '系统工具', NULL, 'sys-tools', -1, 'tool', '', 3, 0, 1, '2019-11-07 20:56:00', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, 'logs', 2000, 'log', 'monitor/log/index', 5, 1, 1, '2017-11-20 14:06:22', 1, '2021-11-17 06:26:23', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys:log:del', NULL, 2100, NULL, NULL, NULL, 2, 1, '2017-11-20 20:37:37', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, 'dict', 2000, 'dict', 'system/dict/index', 6, 1, 1, '2017-11-29 11:30:52', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys:dict:del', NULL, 2200, NULL, NULL, NULL, 2, 1, '2017-11-29 11:30:11', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys:dict:add', NULL, 2200, NULL, NULL, NULL, 2, 1, '2018-05-11 22:34:55', 1, '2021-06-02 08:56:24', b'0', NULL);
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys:dict:edit', NULL, 2200, NULL, NULL, NULL, 2, 1, '2018-05-11 22:36:03', 1, '2021-06-02 08:56:24', b'0', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `flag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_UNIQUE`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '系统管理员', NULL, NULL, '2020-10-13 13:26:08', NULL, '2020-10-13 13:26:11', b'0');
INSERT INTO `sys_role` VALUES (2, 'test', '测试', NULL, 1, '2020-10-13 13:26:08', 1, '2020-12-16 14:53:51', b'0');
INSERT INTO `sys_role` VALUES (3, 'test1', 'haha', NULL, NULL, NULL, NULL, '2021-05-28 17:51:32', b'0');
INSERT INTO `sys_role` VALUES (4, 'user', 'user', NULL, 1, '2021-06-02 17:53:27', NULL, NULL, b'0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID',
  `create_by` bigint NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `flag` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1000, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (2, 1, 1100, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (3, 1, 1101, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (4, 1, 1102, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (5, 1, 1103, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (6, 1, 1200, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (7, 1, 1201, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (8, 1, 1202, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (9, 1, 1203, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (10, 1, 1300, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (11, 1, 1301, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (12, 1, 1302, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (13, 1, 1303, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (14, 1, 1304, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (15, 1, 1400, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (16, 1, 1401, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (17, 1, 1402, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (18, 1, 1403, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (19, 1, 2000, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (20, 1, 2100, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (21, 1, 2101, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (22, 1, 2200, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (23, 1, 2201, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (24, 1, 2202, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (25, 1, 2203, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (26, 1, 2204, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (27, 1, 2205, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (28, 1, 2300, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (29, 1, 2301, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (30, 1, 2400, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (31, 1, 2401, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (32, 1, 2402, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (33, 1, 2403, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (34, 1, 2500, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (35, 1, 3000, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (36, 1, 3100, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (37, 1, 3200, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (38, 1, 3300, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (39, 1, 3301, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (40, 1, 3302, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (41, 1, 3303, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (42, 1, 3400, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (43, 1, 9999, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');
INSERT INTO `sys_role_menu` VALUES (44, 2, 1101, NULL, '2022-04-20 07:16:15', NULL, '2022-04-20 07:16:15', b'0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` bit(1) NULL DEFAULT NULL COMMENT '性别 0男 1女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `flag` bit(1) NULL DEFAULT b'0' COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', b'0', 'http://192.168.164.128/static/images/b64543a98226cffcaa9bbee9f1799a96f703eab3.jpeg', '15512345678', '系统管理员', 100, 1, '2021-05-14 11:34:31', 1, '2021-05-14 11:34:39', b'0');
INSERT INTO `sys_user` VALUES (2, 'user', 'user', 'e10adc3949ba59abbe56e057f20f883e', b'1', 'http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png', '13567856786', '总经理来了', 103, 1, '2021-06-02 16:31:59', NULL, '2022-06-08 14:50:25', b'0');
INSERT INTO `sys_user` VALUES (5, '6G]xL', 'test', 'e10adc3949ba59abbe56e057f20f883e', b'1', 'http://192.168.10.254/file/community/avatar/f74cb568be5445fcb41dbfd2267fa8ee.png', NULL, '8mFxse', 100, 1, '2021-06-02 17:48:45', NULL, '2022-06-08 10:31:40', b'0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (2, 4);

SET FOREIGN_KEY_CHECKS = 1;
