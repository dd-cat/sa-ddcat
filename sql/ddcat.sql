/*
 Navicat Premium Data Transfer

 Source Server         : master
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 192.168.164.128:3306
 Source Schema         : ddcat

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 15/06/2021 20:11:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门编号',
  `sort` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `flag` tinyint NULL DEFAULT 0 COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'logo',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, -1, 'DD-CAT', NULL, 0, 'admin', '15888888888', 'admin@qq.com', NULL, '2020-12-01 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '深圳总公司', NULL, 1, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '长沙分公司', NULL, 2, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '研发部门', NULL, 1, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '市场部门', NULL, 2, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '测试部门', NULL, 3, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '财务部门', NULL, 4, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '运维部门', NULL, 5, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '市场部门', NULL, 1, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '财务部门', NULL, 2, 'admin', '15888888888', 'admin@qq.com', NULL, '2018-03-16 11:33:00', NULL, '2018-03-16 11:33:00', 0, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `flag` tinyint NULL DEFAULT 0 COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_del_flag`(`flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'dict_type', '字典类型', NULL, '2019-05-16 14:16:20', NULL, '2021-05-24 01:44:55', '系统类不能修改', 0);
INSERT INTO `sys_dict` VALUES (2, 'log_type', '日志类型', NULL, '2020-03-13 14:21:01', NULL, '2021-05-24 01:44:56', '0-正常 1 异常', 0);
INSERT INTO `sys_dict` VALUES (3, 'sys_normal_disable', '通用状态', NULL, '2020-12-07 16:05:57', NULL, '2021-05-24 01:44:56', NULL, 0);
INSERT INTO `sys_dict` VALUES (4, 'sys_show_hide', '显示状态', NULL, '2020-12-07 17:27:03', NULL, '2021-05-24 01:44:59', NULL, 0);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序（升序）',
  `create_user_id` bigint NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_user_id` bigint NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `flag` tinyint NULL DEFAULT 0,
  `dict_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`label`) USING BTREE,
  INDEX `sys_dict_del_flag`(`flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, 'dict_type', '系统类', '1', 0, NULL, '2019-05-16 14:20:40', NULL, '2019-05-16 14:20:40', '不能修改删除', 0, NULL);
INSERT INTO `sys_dict_item` VALUES (2, 'dict_type', '业务类', '0', 1, NULL, '2019-05-16 14:20:59', NULL, '2020-12-07 17:44:31', '可以修改', 0, NULL);
INSERT INTO `sys_dict_item` VALUES (3, 'sys_normal_disable', '正常', '0', 0, NULL, '2020-12-07 16:04:41', NULL, '2020-12-07 17:44:18', NULL, 0, NULL);
INSERT INTO `sys_dict_item` VALUES (4, 'sys_normal_disable', '停用', '1', 1, NULL, '2020-12-07 16:05:23', NULL, '2020-12-07 17:44:19', NULL, 0, NULL);
INSERT INTO `sys_dict_item` VALUES (5, 'sys_show_hide', '显示', '0', 0, NULL, '2020-12-07 17:27:35', NULL, '2020-12-07 17:44:21', NULL, 0, NULL);
INSERT INTO `sys_dict_item` VALUES (6, 'sys_show_hide', '隐藏', '1', 0, NULL, '2020-12-07 17:28:02', NULL, '2020-12-07 17:44:23', NULL, 0, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `time` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行时间',
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  `create_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_user_id`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1400330282732679175 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1395265577525776385, '部门树', 'com.ddcat.system.controller.SysDeptController.tree()', '[]', '256', NULL, 'admin', '2021-05-20 14:30:11');
INSERT INTO `sys_log` VALUES (1396717195362365441, '当前登录人菜单信息', 'com.ddcat.system.controller.SysMenuController.getUserMenus()', '[]', '163', NULL, 'admin', '2021-05-24 14:38:24');
INSERT INTO `sys_log` VALUES (1399648694831202306, '用户分页查询', 'com.ddcat.controller.SysUserController.page()', '[{\"current\":1,\"size\":10}]', '334', NULL, NULL, '2021-06-01 16:47:08');
INSERT INTO `sys_log` VALUES (1399999484502507521, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '344', '用户不存在！', NULL, '2021-06-02 16:01:03');
INSERT INTO `sys_log` VALUES (1399999598512078849, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '144', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.role\' doesn\'t exist\r\n### The error may exist in file [C:\\Java\\newproject\\sa-ddcat\\target\\classes\\mapper\\SysRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT r.*         FROM role r,              user_role ur         WHERE r.id = ur.role_id           AND r.state = 0           and ur.user_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.role\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ddcat.role\' doesn\'t exist', NULL, '2021-06-02 16:01:30');
INSERT INTO `sys_log` VALUES (1400000119461396482, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '436', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'r.state\' in \'where clause\'\r\n### The error may exist in file [C:\\Java\\newproject\\sa-ddcat\\target\\classes\\mapper\\SysRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT r.*         FROM sys_role r,              sys_user_role ur         WHERE r.id = ur.role_id           AND r.state = 0           and ur.user_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'r.state\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'r.state\' in \'where clause\'', NULL, '2021-06-02 16:03:34');
INSERT INTO `sys_log` VALUES (1400000507493240833, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '441', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'rm.permission_id\' in \'on clause\'\r\n### The error may exist in file [C:\\Java\\newproject\\sa-ddcat\\target\\classes\\mapper\\SysMenuMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select m.*         from sys_menu m                  left join sys_role_menu rm on m.id = rm.permission_id         where m.flag = 0           and rm.role_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'rm.permission_id\' in \'on clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'rm.permission_id\' in \'on clause\'', NULL, '2021-06-02 16:05:06');
INSERT INTO `sys_log` VALUES (1400001066367479809, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1367', NULL, NULL, '2021-06-02 16:07:20');
INSERT INTO `sys_log` VALUES (1400001315802755073, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1367', NULL, NULL, '2021-06-02 16:08:19');
INSERT INTO `sys_log` VALUES (1400002920652591105, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1573', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622621681615,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":\"1\",\"createBy\":\"admin\",\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateBy\":\"admin\",\"[truncated 590 bytes]; line: 1, column: 251] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622621681615,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":\"1\",\"createBy\":\"admin\",\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateBy\":\"admin\",\"[truncated 590 bytes]; line: 1, column: 251] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', NULL, '2021-06-02 16:14:42');
INSERT INTO `sys_log` VALUES (1400003352460333057, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1329', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622621784572,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":\"1\",\"createBy\":\"admin\",\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateBy\":\"admin\",\"[truncated 590 bytes]; line: 1, column: 251] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622621784572,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":\"1\",\"createBy\":\"admin\",\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateBy\":\"admin\",\"[truncated 590 bytes]; line: 1, column: 251] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', NULL, '2021-06-02 16:16:25');
INSERT INTO `sys_log` VALUES (1400004155841466369, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '2987', 'Could not read JSON: Expected array or string.\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622621784572,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":\"1\",\"createBy\":\"admin\",\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateBy\":\"admin\",\"[truncated 590 bytes]; line: 1, column: 250] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.MismatchedInputException: Expected array or string.\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622621784572,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":\"1\",\"createBy\":\"admin\",\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateBy\":\"admin\",\"[truncated 590 bytes]; line: 1, column: 250] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', NULL, '2021-06-02 16:19:36');
INSERT INTO `sys_log` VALUES (1400004216973447169, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '72', NULL, NULL, '2021-06-02 16:19:51');
INSERT INTO `sys_log` VALUES (1400005008325390338, '退出登录', 'com.ddcat.controller.SysUserController.isLogin()', '[]', '16', '未提供token', NULL, '2021-06-02 16:22:59');
INSERT INTO `sys_log` VALUES (1400005133131100161, '退出登录', 'com.ddcat.controller.SysUserController.isLogin()', '[]', '0', '未提供token', NULL, '2021-06-02 16:23:29');
INSERT INTO `sys_log` VALUES (1400005216631304193, '退出登录', 'com.ddcat.controller.SysUserController.isLogin()', '[]', '802', NULL, NULL, '2021-06-02 16:23:49');
INSERT INTO `sys_log` VALUES (1400007273031430146, '用户保存or修改', 'com.ddcat.controller.SysUserController.saveOrUpdate()', '[{\"deptId\":101,\"remark\":\"总经理来了\",\"account\":\"user\",\"username\":\"user\"}]', '314', NULL, NULL, '2021-06-02 16:31:59');
INSERT INTO `sys_log` VALUES (1400020216980729857, '用户登录', NULL, NULL, '1276', NULL, '1', '2021-06-02 17:23:26');
INSERT INTO `sys_log` VALUES (1400022401332322306, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '3729', NULL, '1', '2021-06-02 17:32:06');
INSERT INTO `sys_log` VALUES (1400025310245687298, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1425', NULL, '1', '2021-06-02 17:43:40');
INSERT INTO `sys_log` VALUES (1400026340320632833, '用户分页查询', 'com.ddcat.controller.SysUserController.page()', '[{\"current\":1,\"size\":10}]', '410', NULL, '1', '2021-06-02 17:47:45');
INSERT INTO `sys_log` VALUES (1400026591488139265, '用户保存or修改', 'com.ddcat.controller.SysUserController.saveOrUpdate()', '[{\"deptId\":1056089995117412,\"remark\":\"2Bn(f7U\",\"account\":\"ZtHh\",\"username\":\"J92ser\"}]', '28', NULL, '1', '2021-06-02 17:48:45');
INSERT INTO `sys_log` VALUES (1400026669959372802, '用户分页查询', 'com.ddcat.controller.SysUserController.page()', '[{\"current\":1,\"size\":10}]', '11', NULL, '1', '2021-06-02 17:49:04');
INSERT INTO `sys_log` VALUES (1400027142321983489, '用户分页查询', 'com.ddcat.controller.SysUserController.page()', '[{\"current\":1,\"size\":10}]', '383', NULL, '1', '2021-06-02 17:50:56');
INSERT INTO `sys_log` VALUES (1400027284110430209, '角色分页查询', 'com.ddcat.controller.SysRoleController.page()', '[{\"pageSize\":10,\"pageNum\":1}]', '42', NULL, '1', '2021-06-02 17:51:30');
INSERT INTO `sys_log` VALUES (1400027789041623042, '角色保存or修改', 'com.ddcat.controller.SysRoleController.saveOrUpdate()', '[{\"code\":\"user\",\"name\":\"user\"}]', '4234', NULL, '1', '2021-06-02 17:53:31');
INSERT INTO `sys_log` VALUES (1400027853159948290, '角色分页查询', 'com.ddcat.controller.SysRoleController.page()', '[{\"pageSize\":10,\"pageNum\":1}]', '292', NULL, '1', '2021-06-02 17:53:46');
INSERT INTO `sys_log` VALUES (1400033361468067841, '用户保存or修改', 'com.ddcat.controller.SysUserController.saveOrUpdate()', '[{\"deptId\":8974557162971296,\"remark\":\"8mFxse\",\"id\":1400026591425224706,\"account\":\"6G]xL\",\"username\":\"ahG\"}]', '1233', NULL, '1', '2021-06-02 18:15:39');
INSERT INTO `sys_log` VALUES (1400040307524923393, '用户删除', 'com.ddcat.controller.SysUserController.delete()', '[1400026591425224706]', '252', NULL, '1', '2021-06-02 18:43:14');
INSERT INTO `sys_log` VALUES (1400042816750518273, '用户删除', 'com.ddcat.controller.SysUserController.delete()', '[1400026591425224706]', '727', NULL, '1', '2021-06-02 18:53:10');
INSERT INTO `sys_log` VALUES (1400274751150112769, '菜单获取树形数据', 'com.ddcat.controller.SysMenuController.tree()', '[]', '341', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.permission\' doesn\'t exist\r\n### The error may exist in com/ddcat/mapper/SysMenuMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, name, parent_id parentId from permission where state = 0\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.permission\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ddcat.permission\' doesn\'t exist', '1', '2021-06-03 10:14:50');
INSERT INTO `sys_log` VALUES (1400277711582236674, '当前登录人菜单信息', 'com.ddcat.controller.SysMenuController.getUserMenus()', '[]', '1171', NULL, '1', '2021-06-03 10:26:37');
INSERT INTO `sys_log` VALUES (1400278126444949506, '当前登录人菜单信息', 'com.ddcat.controller.SysMenuController.getUserMenus()', '[]', '1521', NULL, '1', '2021-06-03 10:28:16');
INSERT INTO `sys_log` VALUES (1400279163314638849, '菜单获取树形数据', 'com.ddcat.controller.SysMenuController.tree()', '[]', '861', 'java.lang.Integer cannot be cast to java.lang.String', '1', '2021-06-03 10:32:21');
INSERT INTO `sys_log` VALUES (1400279462783762434, '菜单获取树形数据', 'com.ddcat.controller.SysMenuController.tree()', '[]', '448', NULL, '1', '2021-06-03 10:33:34');
INSERT INTO `sys_log` VALUES (1400279691507548162, '通过角色ID获取菜单ID', 'com.ddcat.controller.SysMenuController.getByRoleId()', '[1]', '75', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.role_permission\' doesn\'t exist\r\n### The error may exist in com/ddcat/mapper/SysMenuMapper.java (best guess)\r\n### The error may involve com.ddcat.mapper.SysMenuMapper.getByRoleId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select permission_id from role_permission where role_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.role_permission\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ddcat.role_permission\' doesn\'t exist', '1', '2021-06-03 10:34:29');
INSERT INTO `sys_log` VALUES (1400280023830732801, '通过角色ID获取菜单ID', 'com.ddcat.controller.SysMenuController.getByRoleId()', '[1]', '401', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.role_menu\' doesn\'t exist\r\n### The error may exist in com/ddcat/mapper/SysMenuMapper.java (best guess)\r\n### The error may involve com.ddcat.mapper.SysMenuMapper.getByRoleId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select menu_id from role_menu where role_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'ddcat.role_menu\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'ddcat.role_menu\' doesn\'t exist', '1', '2021-06-03 10:35:47');
INSERT INTO `sys_log` VALUES (1400280501088002050, '通过角色ID获取菜单ID', 'com.ddcat.controller.SysMenuController.getByRoleId()', '[1]', '384', NULL, '1', '2021-06-03 10:37:41');
INSERT INTO `sys_log` VALUES (1400280675789152258, '当前登录人菜单信息', 'com.ddcat.controller.SysMenuController.getUserMenus()', '[]', '62', NULL, '1', '2021-06-03 10:38:24');
INSERT INTO `sys_log` VALUES (1400280871155634178, '当前登录人菜单信息', 'com.ddcat.controller.SysMenuController.getUserMenus()', '[]', '1108', NULL, '1', '2021-06-03 10:39:10');
INSERT INTO `sys_log` VALUES (1400281006761598977, '当前登录人菜单信息', 'com.ddcat.controller.SysMenuController.getUserMenus()', '[]', '1136', NULL, '1', '2021-06-03 10:39:43');
INSERT INTO `sys_log` VALUES (1400281278384828418, '当前登录人菜单信息', 'com.ddcat.controller.SysMenuController.getUserMenus()', '[]', '2300', NULL, '1', '2021-06-03 10:40:47');
INSERT INTO `sys_log` VALUES (1400282555936251905, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1378', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688351818,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688351818,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', '1', '2021-06-03 10:45:52');
INSERT INTO `sys_log` VALUES (1400283507716059138, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1349', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688578795,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688578795,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', '1', '2021-06-03 10:49:39');
INSERT INTO `sys_log` VALUES (1400284101683990529, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '293', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688720270,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688720270,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', '1', '2021-06-03 10:52:01');
INSERT INTO `sys_log` VALUES (1400284322853847042, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1314', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688773139,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688773139,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', '1', '2021-06-03 10:52:53');
INSERT INTO `sys_log` VALUES (1400284665708822529, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1328', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688854672,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622688854672,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', '1', '2021-06-03 10:54:15');
INSERT INTO `sys_log` VALUES (1400285946762498049, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '290', 'Could not read JSON: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622689160144,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"]); nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: Cannot construct instance of `java.time.LocalDateTime` (no Creators, like default constructor, exist): cannot deserialize from Object value (no delegate- or property-based Creator)\n at [Source: (byte[])\"{\"@class\":\"cn.dev33.satoken.session.SaSession\",\"id\":\"token:login:session:1\",\"createTime\":1622689160144,\"dataMap\":{\"@class\":\"java.util.concurrent.ConcurrentHashMap\",\"user\":{\"@class\":\"com.ddcat.entity.SysUser\",\"id\":1,\"createUserId\":1,\"createTime\":{\"month\":\"MAY\",\"year\":2021,\"dayOfMonth\":14,\"hour\":11,\"minute\":34,\"monthValue\":5,\"nano\":0,\"second\":31,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"chronology\":{\"@class\":\"java.time.chrono.IsoChronology\",\"id\":\"ISO\",\"calendarType\":\"iso8601\"}},\"updateUserId\":1,\"updat\"[truncated 584 bytes]; line: 1, column: 247] (through reference chain: cn.dev33.satoken.session.SaSession[\"dataMap\"]->java.util.concurrent.ConcurrentHashMap[\"user\"]->com.ddcat.entity.SysUser[\"createTime\"])', '1', '2021-06-03 10:59:20');
INSERT INTO `sys_log` VALUES (1400286960035127297, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '1672', NULL, '1', '2021-06-03 11:03:22');
INSERT INTO `sys_log` VALUES (1400291634461106178, '用户登录', 'com.ddcat.controller.SysUserController.login()', '[{\"password\":\"123456\",\"account\":\"admin\"}]', '76', NULL, '1', '2021-06-03 11:21:56');
INSERT INTO `sys_log` VALUES (1400291725586554881, '字典分页查询', 'com.ddcat.controller.SysDictController.page()', '[{\"pageSize\":10,\"pageNum\":1}]', '6', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'name\' in \'field list\'\r\n### The error may exist in com/ddcat/mapper/SysDictMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,name,type,create_user_id,create_time,update_user_id,update_time,flag  FROM sys_dict   WHERE flag=0 LIMIT ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'name\' in \'field list\'', '1', '2021-06-03 11:22:18');
INSERT INTO `sys_log` VALUES (1400292991754678274, '字典分页查询', 'com.ddcat.controller.SysDictController.page()', '[{\"current\":1,\"size\":10}]', '1441', NULL, '1', '2021-06-03 11:27:19');
INSERT INTO `sys_log` VALUES (1400293354461204481, '字典分页查询', 'com.ddcat.controller.SysDictController.page()', '[{\"current\":1,\"size\":10}]', '366', NULL, '1', '2021-06-03 11:28:46');
INSERT INTO `sys_log` VALUES (1400327234622853121, '组织获取树形数据', 'com.ddcat.controller.SysDeptController.tree()', '[]', '86', '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'code\' in \'field list\'\r\n### The error may exist in com/ddcat/mapper/SysDeptMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,code,avatar,sort,parent_id,name,create_user_id,create_time,update_user_id,update_time,flag  FROM sys_dept   WHERE  flag=0\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'code\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'code\' in \'field list\'', '1', '2021-06-03 13:43:24');
INSERT INTO `sys_log` VALUES (1400329420455022593, '组织获取树形数据', 'com.ddcat.controller.SysDeptController.tree()', '[]', '31', NULL, '1', '2021-06-03 13:52:05');
INSERT INTO `sys_log` VALUES (1400330016406929410, '组织获取树形数据', 'com.ddcat.controller.SysDeptController.tree()', '[]', '340', NULL, '1', '2021-06-03 13:54:27');
INSERT INTO `sys_log` VALUES (1400330282732679169, '组织获取树形数据', 'com.ddcat.controller.SysDeptController.tree()', '[]', '325', NULL, '1', '2021-06-03 13:55:30');
INSERT INTO `sys_log` VALUES (1400330282732679170, '菜单获取树形数据', 'com.ddcat.controller.SysMenuController.tree()', '[]', '503', NULL, '1', '2021-06-09 16:13:43');
INSERT INTO `sys_log` VALUES (1400330282732679171, '用户认证', 'com.ddcat.controller.LoginController.login()', '[{\"password\":\"10\",\"account\":\"1\"}]', '533', '用户不存在！', '0', '2021-06-15 16:22:48');
INSERT INTO `sys_log` VALUES (1400330282732679172, '用户认证', 'com.ddcat.controller.LoginController.login()', '[{\"password\":\"10\",\"account\":\"1\"}]', '362', '用户不存在！', '0', '2021-06-15 16:45:27');
INSERT INTO `sys_log` VALUES (1400330282732679173, '用户认证', 'com.ddcat.controller.LoginController.login()', '[{\"password\":\"10\",\"account\":\"1\"}]', '331', '用户不存在！', '0', '2021-06-15 16:48:34');
INSERT INTO `sys_log` VALUES (1400330282732679174, '用户认证', 'com.ddcat.controller.LoginController.login()', '[{\"password\":\"123456\",\"account\":\"sa\"}]', '390', '用户不存在！', '0', '2021-06-15 17:00:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL COMMENT '菜单ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端URL',
  `parent_id` int NULL DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'VUE页面',
  `sort` int NULL DEFAULT 1 COMMENT '排序值',
  `is_cache` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '路由缓冲 0-开启，1- 关闭',
  `type` tinyint NULL DEFAULT 0 COMMENT '菜单类型 （0目录 1菜单 2按钮）',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_frame` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否外链',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '显示状态',
  `flag` tinyint NULL DEFAULT 0 COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1000, '系统管理', NULL, 'system', -1, 'system', '', 1, '0', 0, 1, '2018-09-28 08:29:53', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1100, '用户管理', NULL, 'user', 1000, 'user', 'system/user/index', 1, '0', 1, 1, '2017-11-02 22:24:37', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1101, '用户新增', 'sys:user:add', NULL, 1100, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 09:52:09', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1102, '用户修改', 'sys:user:edit', NULL, 1100, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 09:52:48', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1103, '用户删除', 'sys:user:del', NULL, 1100, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 09:54:01', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1200, '菜单管理', NULL, 'menu', 1000, 'tree-table', 'system/menu/index', 2, '0', 1, 1, '2017-11-08 09:57:27', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1201, '菜单新增', 'sys:menu:add', NULL, 1200, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 10:15:53', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1202, '菜单修改', 'sys:menu:edit', NULL, 1200, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 10:16:23', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1203, '菜单删除', 'sys:menu:del', NULL, 1200, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 10:16:43', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1300, '角色管理', NULL, 'role', 1000, 'peoples', 'system/role/index', 3, '0', 1, 1, '2017-11-08 10:13:37', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1301, '角色新增', 'sys:role:add', NULL, 1300, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 10:14:18', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1302, '角色修改', 'sys:role:edit', NULL, 1300, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 10:14:41', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1303, '角色删除', 'sys:role:del', NULL, 1300, NULL, NULL, NULL, '0', 2, 1, '2017-11-08 10:14:59', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1304, '分配权限', 'sys:role:perm', NULL, 1300, NULL, NULL, NULL, '0', 2, 1, '2018-04-20 07:22:55', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1400, '部门管理', NULL, 'dept', 1000, 'tree', 'system/dept/index', 4, '0', 1, 1, '2018-01-20 13:17:19', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1401, '部门新增', 'sys:dept:add', NULL, 1400, NULL, NULL, NULL, '0', 2, 1, '2018-01-20 14:56:16', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1402, '部门修改', 'sys:dept:edit', NULL, 1400, NULL, NULL, NULL, '0', 2, 1, '2018-01-20 14:56:59', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (1403, '部门删除', 'sys:dept:del', NULL, 1400, NULL, NULL, NULL, '0', 2, 1, '2018-01-20 14:57:28', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2000, '系统工具', NULL, 'sys-tools', -1, 'tool', '', 3, '0', 0, 1, '2019-11-07 20:56:00', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, 'logs', 2204, 'log', 'monitor/log/index', 5, '0', 1, 1, '2017-11-20 14:06:22', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys:log:del', NULL, 2100, NULL, NULL, NULL, '0', 2, 1, '2017-11-20 20:37:37', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, 'dict', 2000, 'dict', 'system/dict/index', 6, '0', 1, 1, '2017-11-29 11:30:52', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys:dict:del', NULL, 2200, NULL, NULL, NULL, '0', 2, 1, '2017-11-29 11:30:11', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys:dict:add', NULL, 2200, NULL, NULL, NULL, '0', 2, 1, '2018-05-11 22:34:55', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys:dict:edit', NULL, 2200, NULL, NULL, NULL, '0', 2, 1, '2018-05-11 22:36:03', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2204, '系统监控', '', 'monitor', -1, 'monitor', '', 2, '0', 0, 1, '2020-12-04 22:36:03', 1, '2021-06-02 08:56:24', '1', '0', 0, NULL);
INSERT INTO `sys_menu` VALUES (2205, '接口文档', NULL, 'swagger', 2204, 'swagger', 'tools/swagger/index', 5, '1', 1, 1, '2017-11-20 14:06:22', 1, '2021-06-02 08:56:24', '1', '0', 1, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `flag` tinyint NULL DEFAULT 0 COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_UNIQUE`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ROLE_admin', '系统管理员', NULL, NULL, '2020-10-13 13:26:08', NULL, '2020-10-13 13:26:11', 0);
INSERT INTO `sys_role` VALUES (2, 'ROLE_test', '测试', NULL, 1, '2020-10-13 13:26:08', 1, '2020-12-16 14:53:51', 1);
INSERT INTO `sys_role` VALUES (3, 'Role_test1', 'haha', NULL, NULL, NULL, NULL, '2021-05-28 17:51:32', 1);
INSERT INTO `sys_role` VALUES (1400027774210564097, 'user', 'user', NULL, 1, '2021-06-02 17:53:27', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = DYNAMIC;

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
  `id` bigint NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` tinyint NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门',
  `create_user_id` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `flag` tinyint NULL DEFAULT 0 COMMENT '逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, '', '', '', '系统管理员', 0, 1, '2021-05-14 11:34:31', 1, '2021-05-14 11:34:39', 0);
INSERT INTO `sys_user` VALUES (1400007272049963009, 'user', 'user', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, '总经理来了', 101, 1, '2021-06-02 16:31:59', 1, NULL, 0);
INSERT INTO `sys_user` VALUES (1400026591425224706, '6G]xL', 'ahG', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, '8mFxse', 8974557162971296, 1, '2021-06-02 17:48:45', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
