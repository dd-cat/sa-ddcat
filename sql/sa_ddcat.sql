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

 Date: 09/06/2022 13:58:32
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
) ENGINE = InnoDB AUTO_INCREMENT = 1628 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

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
INSERT INTO `sys_role` VALUES (4, 'user', 'user', 'dfd', 1, '2021-06-02 17:53:27', NULL, '2022-06-09 10:29:14', b'0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID'
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1100);
INSERT INTO `sys_role_menu` VALUES (1, 1101);
INSERT INTO `sys_role_menu` VALUES (1, 1102);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1200);
INSERT INTO `sys_role_menu` VALUES (1, 1201);
INSERT INTO `sys_role_menu` VALUES (1, 1202);
INSERT INTO `sys_role_menu` VALUES (1, 1203);
INSERT INTO `sys_role_menu` VALUES (1, 1300);
INSERT INTO `sys_role_menu` VALUES (1, 1301);
INSERT INTO `sys_role_menu` VALUES (1, 1302);
INSERT INTO `sys_role_menu` VALUES (1, 1303);
INSERT INTO `sys_role_menu` VALUES (1, 1304);
INSERT INTO `sys_role_menu` VALUES (1, 1400);
INSERT INTO `sys_role_menu` VALUES (1, 1401);
INSERT INTO `sys_role_menu` VALUES (1, 1402);
INSERT INTO `sys_role_menu` VALUES (1, 1403);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2100);
INSERT INTO `sys_role_menu` VALUES (1, 2101);
INSERT INTO `sys_role_menu` VALUES (1, 2200);
INSERT INTO `sys_role_menu` VALUES (1, 2201);
INSERT INTO `sys_role_menu` VALUES (1, 2202);
INSERT INTO `sys_role_menu` VALUES (1, 2203);
INSERT INTO `sys_role_menu` VALUES (1, 2204);
INSERT INTO `sys_role_menu` VALUES (1, 2205);
INSERT INTO `sys_role_menu` VALUES (1, 2300);
INSERT INTO `sys_role_menu` VALUES (1, 2301);
INSERT INTO `sys_role_menu` VALUES (1, 2400);
INSERT INTO `sys_role_menu` VALUES (1, 2401);
INSERT INTO `sys_role_menu` VALUES (1, 2402);
INSERT INTO `sys_role_menu` VALUES (1, 2403);
INSERT INTO `sys_role_menu` VALUES (1, 2500);
INSERT INTO `sys_role_menu` VALUES (1, 3000);
INSERT INTO `sys_role_menu` VALUES (1, 3100);
INSERT INTO `sys_role_menu` VALUES (1, 3200);
INSERT INTO `sys_role_menu` VALUES (1, 3300);
INSERT INTO `sys_role_menu` VALUES (1, 3301);
INSERT INTO `sys_role_menu` VALUES (1, 3302);
INSERT INTO `sys_role_menu` VALUES (1, 3303);
INSERT INTO `sys_role_menu` VALUES (1, 3400);
INSERT INTO `sys_role_menu` VALUES (1, 9999);
INSERT INTO `sys_role_menu` VALUES (2, 1101);

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (2, 4);

SET FOREIGN_KEY_CHECKS = 1;
