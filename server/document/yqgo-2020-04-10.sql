/*
Navicat MySQL Data Transfer

Source Server         : eforinaj
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : yqgo

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-04-10 21:54:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `cate_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(10) DEFAULT '0' COMMENT '顶级分类',
  `cate_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `cate_slug` varchar(50) DEFAULT NULL COMMENT '分类别名',
  `cate_img` varchar(255) DEFAULT NULL COMMENT '分类背景图',
  `cate_key` varchar(50) DEFAULT NULL COMMENT '分类关键字',
  `cate_sort` int(10) DEFAULT NULL COMMENT '分类排序',
  `status` char(1) DEFAULT NULL COMMENT '分类状态',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `cate_module` varchar(50) DEFAULT NULL COMMENT '分类栏目',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_category
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '文件存储设置', 'flieOptions', '{\"aly\":{\"endpoint\":\"\",\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"bucketName\":\"\"},\"qny\":{\"endpoint\":\"\",\"accessKeyId\":\"\",\"accessKeySecret\":\"\",\"bucketName\":\"\",\"address\":\"\"},\"engine\":\"1\",\"folder\":\"public/uploads\",\"size\":\"50\",\"type\":[\".png\",\".mp3\",\".wav\",\".jpg\",\".mp4\",\".jpeg\",\".gif\"]}', 'Y', 'admin', '2020-04-10 19:21:50', 'admin', '2020-04-10 19:37:22', '文件存储设置');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('31', '0', '阴阳人', '6', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-03-20 19:49:06', '', null, '性别阴阳人');
INSERT INTO `sys_dict_data` VALUES ('33', '0', '本地', '1', 'sys_media_engine', '', '', 'Y', '0', 'admin', '2020-04-10 19:06:55', '', null, '存储引擎本地');
INSERT INTO `sys_dict_data` VALUES ('34', '0', '阿里云', '2', 'sys_media_engine', '', '', 'Y', '0', 'admin', '2020-04-10 19:07:10', '', null, '阿里云OSS');
INSERT INTO `sys_dict_data` VALUES ('35', '0', '七牛云', '3', 'sys_media_engine', '', '', 'Y', '0', 'admin', '2020-04-10 19:07:31', '', null, '七牛云oss');
INSERT INTO `sys_dict_data` VALUES ('36', '0', 'PNG', '.png', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:24:31', 'admin', '2020-04-10 19:35:09', 'PNG格式图片');
INSERT INTO `sys_dict_data` VALUES ('37', '0', 'JPEG', '.jpeg', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:30:35', 'admin', '2020-04-10 19:35:01', 'JPEG格式图片');
INSERT INTO `sys_dict_data` VALUES ('38', '0', 'MP3', '.mp3', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:32:41', 'admin', '2020-04-10 19:34:44', 'MP3音频类型');
INSERT INTO `sys_dict_data` VALUES ('39', '0', 'MP4', '.mp4', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:33:03', 'admin', '2020-04-10 19:34:40', 'MP4视频类型');
INSERT INTO `sys_dict_data` VALUES ('40', '0', 'WAV', '.wav', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:33:38', 'admin', '2020-04-10 19:34:36', 'WAV音频类型');
INSERT INTO `sys_dict_data` VALUES ('41', '0', 'JPG', '.jpg', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:35:39', '', null, 'JPG图片类型');
INSERT INTO `sys_dict_data` VALUES ('42', '0', 'GIF', '.gif', 'sys_media_type', '', '', 'Y', '0', 'admin', '2020-04-10 19:36:32', '', null, 'GIF图片类型');
INSERT INTO `sys_dict_data` VALUES ('43', '0', '圈子', 'circle', 'sys_cate_module', '', '', 'Y', '0', 'admin', '2020-04-10 21:39:57', '', null, '圈子模块');
INSERT INTO `sys_dict_data` VALUES ('44', '0', '资源', 'resources', 'sys_cate_module', '', '', 'Y', '0', 'admin', '2020-04-10 21:41:54', '', null, '资源模块');
INSERT INTO `sys_dict_data` VALUES ('45', '0', '帖子', 'feed', 'sys_cate_module', '', '', 'Y', '0', 'admin', '2020-04-10 21:42:17', '', null, '帖子模块');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('15', '文件引擎', 'sys_media_engine', '0', 'admin', '2020-04-10 19:04:52', 'admin', '2020-04-10 19:11:04', '文件引擎列表');
INSERT INTO `sys_dict_type` VALUES ('16', '文件类型', 'sys_media_type', '0', 'admin', '2020-04-10 19:12:03', '', null, '文件类型列表');
INSERT INTO `sys_dict_type` VALUES ('17', '分类模块', 'sys_cate_module', '0', 'admin', '2020-04-10 21:38:02', '', null, '分类模块列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `token` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImV4cCI6MTU4MzIzMDE5MywiaWF0IjoxNTgzMjIxNTkzLCJpc3MiOiJhZG1pbiJ9.kCDdVvUgo5kbO1UegHSoWYXlYulhhiKT8GPey5ZPKDk', '2020-03-03 15:46:33');
INSERT INTO `sys_logininfor` VALUES ('4', 'xinyuetan', '[::1]', '内网IP', 'PostmanRuntime', '', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJ4aW55dWV0YW4iLCJleHAiOjE1ODQ3MzMyNzIsImlhdCI6MTU4NDcyNDY3MiwiaXNzIjoieGlueXVldGFuIn0.3q_bFutfOKAP9Uje0k3dTp-jMlhbcd1HG3Zc7n5Tph0', '2020-03-21 01:17:52');
INSERT INTO `sys_logininfor` VALUES ('5', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImV4cCI6MTU4NjUzMTQ1MywiaWF0IjoxNTg2NTIyODUzLCJpc3MiOiJhZG1pbiJ9.QjlYmr2lB9anBhGJYNCv1piuvpJ8Bk-KhQrT6mjYnUc', '2020-04-10 20:47:33');

-- ----------------------------
-- Table structure for sys_media
-- ----------------------------
DROP TABLE IF EXISTS `sys_media`;
CREATE TABLE `sys_media` (
  `media_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(10) unsigned NOT NULL COMMENT '上传的用户',
  `link` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `path` varchar(255) DEFAULT NULL COMMENT '存放路径',
  `name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `or_name` varchar(50) DEFAULT NULL COMMENT '原始文件名称',
  `size` varchar(50) NOT NULL COMMENT '文件大小',
  `upload_key` char(1) NOT NULL COMMENT '上传方式 1 为本地上传， 2为oss上传',
  `ext` varchar(10) DEFAULT NULL COMMENT '文件后缀',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `media_type` varchar(20) DEFAULT NULL COMMENT '文件类型',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`media_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_media
-- ----------------------------
INSERT INTO `sys_media` VALUES ('4', '1', 'http://localhost:8199/static/uploads/2020-04-10/c1xjd4tc8pqs2mofcd.png', '/public/uploads/2020-04-10/c1xjd4tc8pqs2mofcd.png', 'c1xjd4tc8pqs2mofcd.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-10 20:45:13', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('5', '1', 'http://localhost:8199/static/uploads/2020-04-10/c1xjezcwgdhghznvsl.png', '/public/uploads/2020-04-10/c1xjezcwgdhghznvsl.png', 'c1xjezcwgdhghznvsl.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-10 20:47:38', null, '0', 'PNG', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `redirect` varchar(200) DEFAULT NULL COMMENT '重定向路径',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '2', 'system', '', 'PageView', 'setting', '1', 'M', '0', '', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 22:30:01', '');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '3', 'monitor', '', 'PageView', 'monitor', '1', 'M', '0', '', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-18 22:29:54', '');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, 'PageView', 'tool', '1', 'M', '0', '', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '用户管理', '0', '1', 'user', '/user/list', 'RouteView', 'user', '1', 'M', '0', '', 'admin', '2020-03-18 19:19:54', 'admin', '2020-03-18 22:25:08', '');
INSERT INTO `sys_menu` VALUES ('100', '用户列表', '4', '1', 'list', '', 'UserList', 'bars', '1', 'C', '0', 'user:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:46:26', '');
INSERT INTO `sys_menu` VALUES ('101', '角色列表', '1067', '2', 'role', '', 'RoleList', 'bars', '1', 'C', '0', 'role:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:53:18', '');
INSERT INTO `sys_menu` VALUES ('102', '菜单列表', '1067', '1', 'menu', '', 'MenuList', 'bars', '1', 'C', '0', 'system:menu:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:55:34', '');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1067', '4', 'dept', '', 'DeptList', 'bars', '1', 'C', '0', 'system:dept:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:53:25', '');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1067', '5', 'post', '', 'PostList', 'bars', '1', 'C', '0', 'system:post:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:53:31', '');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', null, 'DictTypeList', 'bars', '1', 'C', '0', 'system:dict:list', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', null, 'Analysis', 'bars', '1', 'C', '0', 'system:notice:list', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', null, 'UserOnLine', 'bars', '1', 'C', '0', 'monitor:online:list', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', null, 'Analysis', 'bars', '1', 'C', '0', 'monitor:job:list', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', '', 'ServerInfo', 'bars', '1', 'C', '0', 'monitor:server:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:58:20', '');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', 'swagger', null, 'Analysis', 'bars', '1', 'C', '0', 'tool:swagger:list', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '2', '1', 'operlog', '', 'OperLogList', 'bars', '1', 'C', '0', 'monitor:operlog:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:58:30', '');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '2', '2', 'logininfor', '', 'Analysis', 'bars', '1', 'C', '0', 'monitor:logininfor:list', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-10 18:57:41', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '', '', '0', 'F', '', 'user:query', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:46:59', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '', '', '0', 'F', '', 'user:create', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:47:14', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '', '', '0', 'F', '', 'user:edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:47:31', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '', '', '0', 'F', '', 'user:remove', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:47:36', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '', '', '0', 'F', '', 'user:export', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:47:44', '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '', '', '0', 'F', '', 'user:import', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:47:49', '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '', '', '0', 'F', '', 'user:resetPwd', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 23:47:56', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', null, '', '#', '1', 'F', '0', 'system:role:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', null, '', '#', '1', 'F', '0', 'system:role:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', null, '', '#', '1', 'F', '0', 'system:role:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', null, '', '#', '1', 'F', '0', 'system:role:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', null, '', '#', '1', 'F', '0', 'system:role:export', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', null, '', '#', '1', 'F', '0', 'system:menu:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', null, '', '#', '1', 'F', '0', 'system:menu:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', null, '', '#', '1', 'F', '0', 'system:menu:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', null, '', '#', '1', 'F', '0', 'system:menu:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', null, '', '#', '1', 'F', '0', 'system:dept:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', null, '', '#', '1', 'F', '0', 'system:dept:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', null, '', '#', '1', 'F', '0', 'system:dept:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', null, '', '#', '1', 'F', '0', 'system:dept:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', null, '', '#', '1', 'F', '0', 'system:post:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', null, '', '#', '1', 'F', '0', 'system:post:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', null, '', '#', '1', 'F', '0', 'system:post:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', null, '', '#', '1', 'F', '0', 'system:post:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', null, '', '#', '1', 'F', '0', 'system:post:export', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', null, '', '#', '1', 'F', '0', 'system:dict:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', null, '', '#', '1', 'F', '0', 'system:dict:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', null, '', '#', '1', 'F', '0', 'system:dict:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', null, '', '#', '1', 'F', '0', 'system:dict:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', null, '', '#', '1', 'F', '0', 'system:dict:export', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', null, '', '#', '1', 'F', '0', 'system:notice:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', null, '', '#', '1', 'F', '0', 'system:notice:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', null, '', '#', '1', 'F', '0', 'system:notice:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', null, '', '#', '1', 'F', '0', 'system:notice:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', null, '', '#', '1', 'F', '0', 'monitor:operlog:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', null, '', '#', '1', 'F', '0', 'monitor:operlog:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', null, '', '#', '1', 'F', '0', 'monitor:operlog:export', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', null, '', '#', '1', 'F', '0', 'monitor:logininfor:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', null, '', '#', '1', 'F', '0', 'monitor:logininfor:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', null, '', '#', '1', 'F', '0', 'monitor:logininfor:export', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', null, '', '#', '1', 'F', '0', 'monitor:online:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', null, '', '#', '1', 'F', '0', 'monitor:online:batchLogout', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', null, '', '#', '1', 'F', '0', 'monitor:online:forceLogout', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', null, '', '#', '1', 'F', '0', 'monitor:job:query', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', null, '', '#', '1', 'F', '0', 'monitor:job:add', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', null, '', '#', '1', 'F', '0', 'monitor:job:edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', null, '', '#', '1', 'F', '0', 'monitor:job:remove', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', null, '', '#', '1', 'F', '0', 'monitor:job:changeStatus', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', null, '', '#', '1', 'F', '0', 'monitor:job:export', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1065', '字典数据', '1', '5', '/dict/type/data/:dictId', '', 'DictDataList', 'user', '1', 'C', '1', '', 'admin', '2020-03-20 16:21:10', 'admin', '2020-03-21 10:46:03', '');
INSERT INTO `sys_menu` VALUES ('1066', '常规设置', '1', '2', 'setting', '', 'Setting', 'setting', '1', 'C', '0', 'setting:system', 'admin', '2020-03-21 10:34:52', 'admin', '2020-04-10 18:47:29', '');
INSERT INTO `sys_menu` VALUES ('1067', '权限管理', '0', '10', 'premiss', '', 'PageView', 'usb', '1', 'M', '0', '', 'admin', '2020-04-10 18:50:52', 'admin', '2020-04-10 18:51:57', '');
INSERT INTO `sys_menu` VALUES ('1068', '附件管理', '1', '10', 'folder/list', '', 'FolderList', 'upload', '1', 'C', '0', 'folder:list', 'admin', '2020-04-10 19:20:47', 'admin', '2020-04-10 20:49:39', '');
INSERT INTO `sys_menu` VALUES ('1069', '聚合内容', '0', '10', 'juhe', '', 'PageView', 'compass', '1', 'M', '0', '', 'admin', '2020-04-10 20:51:27', 'admin', '2020-04-10 20:52:29', '');
INSERT INTO `sys_menu` VALUES ('1070', '分类列表', '1069', '10', 'cate/list', '', 'CateList', 'bars', '1', 'C', '0', 'cate:list', 'admin', '2020-04-10 21:35:31', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1066,\"ParentId\":1,\"MenuType\":\"C\",\"MenuName\":\"常规设置\",\"OrderNum\":2,\"Path\":\"setting\",\"Icon\":\"setting\",\"IsFrame\":1,\"Perms\":\"setting:system\",\"Visible\":\"0\",\"Component\":\"Setting\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:47:29');
INSERT INTO `sys_oper_log` VALUES ('2', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"权限管理\",\"OrderNum\":10,\"Path\":\"premiss\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:50:52');
INSERT INTO `sys_oper_log` VALUES ('3', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1067,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"权限管理\",\"OrderNum\":10,\"Path\":\"premiss\",\"Icon\":\"usb\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:51:57');
INSERT INTO `sys_oper_log` VALUES ('4', '字典类型删除', '3', '/api/v1/admin/dict/type/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/remove', '[::1]', '内网IP', '[11]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:52:29');
INSERT INTO `sys_oper_log` VALUES ('5', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":101,\"ParentId\":1067,\"MenuType\":\"C\",\"MenuName\":\"角色列表\",\"OrderNum\":2,\"Path\":\"role\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"role:list\",\"Visible\":\"0\",\"Component\":\"RoleList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:53:18');
INSERT INTO `sys_oper_log` VALUES ('6', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":103,\"ParentId\":1067,\"MenuType\":\"C\",\"MenuName\":\"部门管理\",\"OrderNum\":4,\"Path\":\"dept\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"system:dept:list\",\"Visible\":\"0\",\"Component\":\"DeptList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:53:25');
INSERT INTO `sys_oper_log` VALUES ('7', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":104,\"ParentId\":1067,\"MenuType\":\"C\",\"MenuName\":\"岗位管理\",\"OrderNum\":5,\"Path\":\"post\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"system:post:list\",\"Visible\":\"0\",\"Component\":\"PostList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:53:31');
INSERT INTO `sys_oper_log` VALUES ('8', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":102,\"ParentId\":1067,\"MenuType\":\"C\",\"MenuName\":\"菜单列表\",\"OrderNum\":3,\"Path\":\"menu\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"system:menu:list\",\"Visible\":\"0\",\"Component\":\"MenuList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:53:57');
INSERT INTO `sys_oper_log` VALUES ('9', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":102,\"ParentId\":1067,\"MenuType\":\"C\",\"MenuName\":\"菜单列表\",\"OrderNum\":1,\"Path\":\"menu\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"system:menu:list\",\"Visible\":\"0\",\"Component\":\"MenuList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:55:34');
INSERT INTO `sys_oper_log` VALUES ('10', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '113', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:55:49');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '1060', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:55:57');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '1059', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:56:00');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '1057', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:56:02');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '1058', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:56:05');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '1056', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:56:07');
INSERT INTO `sys_oper_log` VALUES ('16', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '1055', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:56:09');
INSERT INTO `sys_oper_log` VALUES ('17', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '114', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:56:12');
INSERT INTO `sys_oper_log` VALUES ('18', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '111', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:57:08');
INSERT INTO `sys_oper_log` VALUES ('19', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":500,\"ParentId\":2,\"MenuType\":\"C\",\"MenuName\":\"操作日志\",\"OrderNum\":1,\"Path\":\"operlog\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"monitor:operlog:list\",\"Visible\":\"0\",\"Component\":\"Analysis\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:57:30');
INSERT INTO `sys_oper_log` VALUES ('20', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":501,\"ParentId\":2,\"MenuType\":\"C\",\"MenuName\":\"登录日志\",\"OrderNum\":2,\"Path\":\"logininfor\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"monitor:logininfor:list\",\"Visible\":\"0\",\"Component\":\"Analysis\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:57:41');
INSERT INTO `sys_oper_log` VALUES ('21', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '108', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:57:45');
INSERT INTO `sys_oper_log` VALUES ('22', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":112,\"ParentId\":2,\"MenuType\":\"C\",\"MenuName\":\"服务监控\",\"OrderNum\":4,\"Path\":\"server\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"monitor:server:list\",\"Visible\":\"0\",\"Component\":\"ServerInfo\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:58:20');
INSERT INTO `sys_oper_log` VALUES ('23', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":500,\"ParentId\":2,\"MenuType\":\"C\",\"MenuName\":\"操作日志\",\"OrderNum\":1,\"Path\":\"operlog\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"monitor:operlog:list\",\"Visible\":\"0\",\"Component\":\"OperLogList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:58:30');
INSERT INTO `sys_oper_log` VALUES ('24', '菜单删除', '3', '/api/v1/admin/menu/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/remove', '[::1]', '内网IP', '106', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 18:59:28');
INSERT INTO `sys_oper_log` VALUES ('25', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"文件引擎\",\"DictType\":\"sys_media_type\",\"Status\":\"0\",\"Remark\":\"文件引擎列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:04:52');
INSERT INTO `sys_oper_log` VALUES ('26', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"本地\",\"DictValue\":\"1\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"存储引擎本地\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:06:55');
INSERT INTO `sys_oper_log` VALUES ('27', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"阿里云\",\"DictValue\":\"2\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"阿里云OSS\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:07:10');
INSERT INTO `sys_oper_log` VALUES ('28', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"七牛云\",\"DictValue\":\"3\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"七牛云oss\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:07:31');
INSERT INTO `sys_oper_log` VALUES ('29', '字典类型修改', '2', '/api/v1/admin/dict/type/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/edit', '[::1]', '内网IP', '{\"DictId\":15,\"DictName\":\"文件引擎\",\"DictType\":\"sys_media_engine\",\"Status\":\"0\",\"Remark\":\"文件引擎列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:11:04');
INSERT INTO `sys_oper_log` VALUES ('30', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"文件类型\",\"DictType\":\"sys_media_type\",\"Status\":\"0\",\"Remark\":\"文件类型列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:12:03');
INSERT INTO `sys_oper_log` VALUES ('31', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":1,\"MenuType\":\"C\",\"MenuName\":\"附件管理\",\"OrderNum\":10,\"Path\":\"folder/list\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"folder:list\",\"Visible\":\"0\",\"Component\":\"FolderList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:20:47');
INSERT INTO `sys_oper_log` VALUES ('32', '系统设置保存', '1', '/api/v1/admin/config/save', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/config/save', '[::1]', '内网IP', '{\"ConfigName\":\"文件存储设置\",\"ConfigKey\":\"flieOptions\",\"ConfigValue\":\"{\\\"aly\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\"},\\\"qny\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\",\\\"address\\\":\\\"\\\"},\\\"engine\\\":\\\"\\\",\\\"folder\\\":\\\"public/uploads\\\",\\\"size\\\":\\\"50\\\",\\\"type\\\":[]}\",\"Remark\":\"文件存储设置\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:21:50');
INSERT INTO `sys_oper_log` VALUES ('33', '系统设置保存', '1', '/api/v1/admin/config/save', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/config/save', '[::1]', '内网IP', '{\"ConfigName\":\"文件存储设置\",\"ConfigKey\":\"flieOptions\",\"ConfigValue\":\"{\\\"aly\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\"},\\\"qny\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\",\\\"address\\\":\\\"\\\"},\\\"engine\\\":\\\"1\\\",\\\"folder\\\":\\\"public/uploads\\\",\\\"size\\\":\\\"50\\\",\\\"type\\\":[]}\",\"Remark\":\"文件存储设置\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:21:58');
INSERT INTO `sys_oper_log` VALUES ('34', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"PNG\",\"DictValue\":\"image/png\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"PNG格式图片\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:24:31');
INSERT INTO `sys_oper_log` VALUES ('35', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":36,\"DictLabel\":\"PNG\",\"DictValue\":\".png\",\"DictType\":\"sys_media_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"PNG格式图片\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:30:05');
INSERT INTO `sys_oper_log` VALUES ('36', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"JPG\",\"DictValue\":\"jpeg\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"JPG格式图片\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:30:35');
INSERT INTO `sys_oper_log` VALUES ('37', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"MP3\",\"DictValue\":\"mp3\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"MP3音频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:32:41');
INSERT INTO `sys_oper_log` VALUES ('38', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"MP4\",\"DictValue\":\"mp4\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"MP4视频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:33:03');
INSERT INTO `sys_oper_log` VALUES ('39', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"WAV\",\"DictValue\":\"wav\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"WAV音频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:33:38');
INSERT INTO `sys_oper_log` VALUES ('40', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":40,\"DictLabel\":\"WAV\",\"DictValue\":\".wav\",\"DictType\":\"sys_media_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"WAV音频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:34:36');
INSERT INTO `sys_oper_log` VALUES ('41', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":39,\"DictLabel\":\"MP4\",\"DictValue\":\".mp4\",\"DictType\":\"sys_media_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"MP4视频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:34:40');
INSERT INTO `sys_oper_log` VALUES ('42', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":38,\"DictLabel\":\"MP3\",\"DictValue\":\".mp3\",\"DictType\":\"sys_media_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"MP3音频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:34:44');
INSERT INTO `sys_oper_log` VALUES ('43', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":37,\"DictLabel\":\"JPEG\",\"DictValue\":\".jpeg\",\"DictType\":\"sys_media_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"JPEG格式图片\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:35:01');
INSERT INTO `sys_oper_log` VALUES ('44', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":36,\"DictLabel\":\"PNG\",\"DictValue\":\".png\",\"DictType\":\"sys_media_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"PNG格式图片\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:35:09');
INSERT INTO `sys_oper_log` VALUES ('45', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"JPG\",\"DictValue\":\".jpg\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"JPG图片类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:35:39');
INSERT INTO `sys_oper_log` VALUES ('46', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"GIF\",\"DictValue\":\".gif\",\"DictType\":\"sys_media_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"GIF图片类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:36:32');
INSERT INTO `sys_oper_log` VALUES ('47', '系统设置保存', '1', '/api/v1/admin/config/save', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/config/save', '[::1]', '内网IP', '{\"ConfigName\":\"文件存储设置\",\"ConfigKey\":\"flieOptions\",\"ConfigValue\":\"{\\\"aly\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\"},\\\"qny\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\",\\\"address\\\":\\\"\\\"},\\\"engine\\\":\\\"1\\\",\\\"folder\\\":\\\"public/uploads\\\",\\\"size\\\":\\\"50\\\",\\\"type\\\":[\\\".png\\\",\\\".mp3\\\",\\\".wav\\\",\\\".jpg\\\"]}\",\"Remark\":\"文件存储设置\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:37:18');
INSERT INTO `sys_oper_log` VALUES ('48', '系统设置保存', '1', '/api/v1/admin/config/save', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/config/save', '[::1]', '内网IP', '{\"ConfigName\":\"文件存储设置\",\"ConfigKey\":\"flieOptions\",\"ConfigValue\":\"{\\\"aly\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\"},\\\"qny\\\":{\\\"endpoint\\\":\\\"\\\",\\\"accessKeyId\\\":\\\"\\\",\\\"accessKeySecret\\\":\\\"\\\",\\\"bucketName\\\":\\\"\\\",\\\"address\\\":\\\"\\\"},\\\"engine\\\":\\\"1\\\",\\\"folder\\\":\\\"public/uploads\\\",\\\"size\\\":\\\"50\\\",\\\"type\\\":[\\\".png\\\",\\\".mp3\\\",\\\".wav\\\",\\\".jpg\\\",\\\".mp4\\\",\\\".jpeg\\\",\\\".gif\\\"]}\",\"Remark\":\"文件存储设置\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 19:37:22');
INSERT INTO `sys_oper_log` VALUES ('49', '附件删除', '3', '/api/v1/admin/media/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/media/remove', '[::1]', '内网IP', '[3,2,1]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 20:45:37');
INSERT INTO `sys_oper_log` VALUES ('50', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1068,\"ParentId\":1,\"MenuType\":\"C\",\"MenuName\":\"附件管理\",\"OrderNum\":10,\"Path\":\"folder/list\",\"Icon\":\"upload\",\"IsFrame\":1,\"Perms\":\"folder:list\",\"Visible\":\"0\",\"Component\":\"FolderList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 20:49:39');
INSERT INTO `sys_oper_log` VALUES ('51', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"聚合内容\",\"OrderNum\":10,\"Path\":\"\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 20:51:27');
INSERT INTO `sys_oper_log` VALUES ('52', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1069,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"聚合内容\",\"OrderNum\":10,\"Path\":\"juhe\",\"Icon\":\"compass\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 20:52:29');
INSERT INTO `sys_oper_log` VALUES ('53', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"分类列表\",\"OrderNum\":10,\"Path\":\"cate/list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"cate:list\",\"Visible\":\"0\",\"Component\":\"CateList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 21:35:31');
INSERT INTO `sys_oper_log` VALUES ('54', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"分类模块\",\"DictType\":\"sys_cate_module\",\"Status\":\"0\",\"Remark\":\"分类模块列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 21:38:02');
INSERT INTO `sys_oper_log` VALUES ('55', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"圈子\",\"DictValue\":\"circle\",\"DictType\":\"sys_cate_module\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"圈子模块\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 21:39:57');
INSERT INTO `sys_oper_log` VALUES ('56', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"资源\",\"DictValue\":\"resources\",\"DictType\":\"sys_cate_module\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"资源模块\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 21:41:54');
INSERT INTO `sys_oper_log` VALUES ('57', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"帖子\",\"DictValue\":\"feed\",\"DictType\":\"sys_cate_module\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"帖子模块\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 21:42:17');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('8', 'vs', '测试岗位', '3', '1', 'admin', '2020-03-19 21:28:21', 'admin', '2020-03-21 10:48:26', '吃撒');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色1', 'common1', '2', '1', '0', '0', 'admin', '2020-03-21 00:58:47', 'admin', '2020-03-21 00:58:47', '普通角色');
INSERT INTO `sys_role` VALUES ('5', '测试角色23', 'test2131', '0', '1', '0', '0', 'admin', '2020-03-21 00:08:16', 'admin', '2020-03-21 00:08:16', '测试绝');
INSERT INTO `sys_role` VALUES ('6', '测试角色223', 'tests223', '0', '1', '0', '0', 'admin', '2020-03-17 16:53:36', '', '2020-03-17 16:53:36', '测试角色2');
INSERT INTO `sys_role` VALUES ('7', '测试角色3', 'test3', '0', '1', '0', '0', 'admin', '2020-03-18 23:00:30', '', null, '测试角色');
INSERT INTO `sys_role` VALUES ('8', '测试角色下的', 'asdas阿萨', '0', '1', '0', '0', 'admin', '2020-03-19 23:22:36', '', null, '测试绝的');
INSERT INTO `sys_role` VALUES ('9', '测试角色1123', 'asdas反倒是', '0', '1', '0', '2', 'admin', '2020-03-19 23:32:51', '', null, '');
INSERT INTO `sys_role` VALUES ('10', '会尽快赶回', '和客户', '0', '1', '0', '0', 'admin', '2020-03-19 23:36:35', '', null, '测试');
INSERT INTO `sys_role` VALUES ('11', '测试角色阿松大双方的', 'admin风格', '0', '2', '0', '0', 'admin', '2020-03-19 23:37:51', 'admin', '2020-03-19 23:42:51', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '103');
INSERT INTO `sys_role_dept` VALUES ('2', '104');
INSERT INTO `sys_role_dept` VALUES ('11', '101');
INSERT INTO `sys_role_dept` VALUES ('11', '103');
INSERT INTO `sys_role_dept` VALUES ('11', '104');
INSERT INTO `sys_role_dept` VALUES ('11', '105');
INSERT INTO `sys_role_dept` VALUES ('11', '106');
INSERT INTO `sys_role_dept` VALUES ('11', '107');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '100');
INSERT INTO `sys_role_menu` VALUES ('5', '101');
INSERT INTO `sys_role_menu` VALUES ('5', '102');
INSERT INTO `sys_role_menu` VALUES ('5', '103');
INSERT INTO `sys_role_menu` VALUES ('5', '104');
INSERT INTO `sys_role_menu` VALUES ('5', '105');
INSERT INTO `sys_role_menu` VALUES ('5', '106');
INSERT INTO `sys_role_menu` VALUES ('5', '107');
INSERT INTO `sys_role_menu` VALUES ('5', '108');
INSERT INTO `sys_role_menu` VALUES ('5', '500');
INSERT INTO `sys_role_menu` VALUES ('5', '501');
INSERT INTO `sys_role_menu` VALUES ('5', '1001');
INSERT INTO `sys_role_menu` VALUES ('5', '1002');
INSERT INTO `sys_role_menu` VALUES ('5', '1003');
INSERT INTO `sys_role_menu` VALUES ('5', '1004');
INSERT INTO `sys_role_menu` VALUES ('5', '1005');
INSERT INTO `sys_role_menu` VALUES ('5', '1006');
INSERT INTO `sys_role_menu` VALUES ('5', '1007');
INSERT INTO `sys_role_menu` VALUES ('5', '1008');
INSERT INTO `sys_role_menu` VALUES ('5', '1009');
INSERT INTO `sys_role_menu` VALUES ('5', '1010');
INSERT INTO `sys_role_menu` VALUES ('5', '1011');
INSERT INTO `sys_role_menu` VALUES ('5', '1012');
INSERT INTO `sys_role_menu` VALUES ('5', '1013');
INSERT INTO `sys_role_menu` VALUES ('5', '1014');
INSERT INTO `sys_role_menu` VALUES ('5', '1015');
INSERT INTO `sys_role_menu` VALUES ('5', '1016');
INSERT INTO `sys_role_menu` VALUES ('5', '1017');
INSERT INTO `sys_role_menu` VALUES ('5', '1018');
INSERT INTO `sys_role_menu` VALUES ('5', '1019');
INSERT INTO `sys_role_menu` VALUES ('5', '1020');
INSERT INTO `sys_role_menu` VALUES ('5', '1021');
INSERT INTO `sys_role_menu` VALUES ('5', '1022');
INSERT INTO `sys_role_menu` VALUES ('5', '1023');
INSERT INTO `sys_role_menu` VALUES ('5', '1024');
INSERT INTO `sys_role_menu` VALUES ('5', '1025');
INSERT INTO `sys_role_menu` VALUES ('5', '1026');
INSERT INTO `sys_role_menu` VALUES ('5', '1027');
INSERT INTO `sys_role_menu` VALUES ('5', '1028');
INSERT INTO `sys_role_menu` VALUES ('5', '1029');
INSERT INTO `sys_role_menu` VALUES ('5', '1030');
INSERT INTO `sys_role_menu` VALUES ('5', '1031');
INSERT INTO `sys_role_menu` VALUES ('5', '1032');
INSERT INTO `sys_role_menu` VALUES ('5', '1033');
INSERT INTO `sys_role_menu` VALUES ('5', '1034');
INSERT INTO `sys_role_menu` VALUES ('5', '1035');
INSERT INTO `sys_role_menu` VALUES ('5', '1036');
INSERT INTO `sys_role_menu` VALUES ('5', '1037');
INSERT INTO `sys_role_menu` VALUES ('5', '1038');
INSERT INTO `sys_role_menu` VALUES ('5', '1039');
INSERT INTO `sys_role_menu` VALUES ('5', '1040');
INSERT INTO `sys_role_menu` VALUES ('5', '1041');
INSERT INTO `sys_role_menu` VALUES ('5', '1042');
INSERT INTO `sys_role_menu` VALUES ('5', '1043');
INSERT INTO `sys_role_menu` VALUES ('5', '1044');
INSERT INTO `sys_role_menu` VALUES ('5', '1045');
INSERT INTO `sys_role_menu` VALUES ('5', '1065');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '3');
INSERT INTO `sys_role_menu` VALUES ('7', '109');
INSERT INTO `sys_role_menu` VALUES ('7', '110');
INSERT INTO `sys_role_menu` VALUES ('7', '111');
INSERT INTO `sys_role_menu` VALUES ('7', '112');
INSERT INTO `sys_role_menu` VALUES ('7', '113');
INSERT INTO `sys_role_menu` VALUES ('7', '114');
INSERT INTO `sys_role_menu` VALUES ('7', '115');
INSERT INTO `sys_role_menu` VALUES ('7', '1046');
INSERT INTO `sys_role_menu` VALUES ('7', '1047');
INSERT INTO `sys_role_menu` VALUES ('7', '1048');
INSERT INTO `sys_role_menu` VALUES ('7', '1049');
INSERT INTO `sys_role_menu` VALUES ('7', '1050');
INSERT INTO `sys_role_menu` VALUES ('7', '1051');
INSERT INTO `sys_role_menu` VALUES ('7', '1052');
INSERT INTO `sys_role_menu` VALUES ('7', '1053');
INSERT INTO `sys_role_menu` VALUES ('7', '1054');
INSERT INTO `sys_role_menu` VALUES ('7', '1055');
INSERT INTO `sys_role_menu` VALUES ('7', '1056');
INSERT INTO `sys_role_menu` VALUES ('7', '1057');
INSERT INTO `sys_role_menu` VALUES ('7', '1058');
INSERT INTO `sys_role_menu` VALUES ('7', '1059');
INSERT INTO `sys_role_menu` VALUES ('7', '1060');
INSERT INTO `sys_role_menu` VALUES ('8', '1');
INSERT INTO `sys_role_menu` VALUES ('8', '2');
INSERT INTO `sys_role_menu` VALUES ('8', '101');
INSERT INTO `sys_role_menu` VALUES ('8', '102');
INSERT INTO `sys_role_menu` VALUES ('8', '103');
INSERT INTO `sys_role_menu` VALUES ('8', '104');
INSERT INTO `sys_role_menu` VALUES ('8', '105');
INSERT INTO `sys_role_menu` VALUES ('8', '106');
INSERT INTO `sys_role_menu` VALUES ('8', '107');
INSERT INTO `sys_role_menu` VALUES ('8', '108');
INSERT INTO `sys_role_menu` VALUES ('8', '109');
INSERT INTO `sys_role_menu` VALUES ('8', '110');
INSERT INTO `sys_role_menu` VALUES ('8', '111');
INSERT INTO `sys_role_menu` VALUES ('8', '112');
INSERT INTO `sys_role_menu` VALUES ('8', '500');
INSERT INTO `sys_role_menu` VALUES ('8', '501');
INSERT INTO `sys_role_menu` VALUES ('8', '1008');
INSERT INTO `sys_role_menu` VALUES ('8', '1009');
INSERT INTO `sys_role_menu` VALUES ('8', '1010');
INSERT INTO `sys_role_menu` VALUES ('8', '1011');
INSERT INTO `sys_role_menu` VALUES ('8', '1012');
INSERT INTO `sys_role_menu` VALUES ('8', '1013');
INSERT INTO `sys_role_menu` VALUES ('8', '1014');
INSERT INTO `sys_role_menu` VALUES ('8', '1015');
INSERT INTO `sys_role_menu` VALUES ('8', '1016');
INSERT INTO `sys_role_menu` VALUES ('8', '1017');
INSERT INTO `sys_role_menu` VALUES ('8', '1018');
INSERT INTO `sys_role_menu` VALUES ('8', '1019');
INSERT INTO `sys_role_menu` VALUES ('8', '1020');
INSERT INTO `sys_role_menu` VALUES ('8', '1021');
INSERT INTO `sys_role_menu` VALUES ('8', '1022');
INSERT INTO `sys_role_menu` VALUES ('8', '1023');
INSERT INTO `sys_role_menu` VALUES ('8', '1024');
INSERT INTO `sys_role_menu` VALUES ('8', '1025');
INSERT INTO `sys_role_menu` VALUES ('8', '1026');
INSERT INTO `sys_role_menu` VALUES ('8', '1027');
INSERT INTO `sys_role_menu` VALUES ('8', '1028');
INSERT INTO `sys_role_menu` VALUES ('8', '1029');
INSERT INTO `sys_role_menu` VALUES ('8', '1030');
INSERT INTO `sys_role_menu` VALUES ('8', '1031');
INSERT INTO `sys_role_menu` VALUES ('8', '1032');
INSERT INTO `sys_role_menu` VALUES ('8', '1033');
INSERT INTO `sys_role_menu` VALUES ('8', '1034');
INSERT INTO `sys_role_menu` VALUES ('8', '1035');
INSERT INTO `sys_role_menu` VALUES ('8', '1036');
INSERT INTO `sys_role_menu` VALUES ('8', '1037');
INSERT INTO `sys_role_menu` VALUES ('8', '1038');
INSERT INTO `sys_role_menu` VALUES ('8', '1039');
INSERT INTO `sys_role_menu` VALUES ('8', '1040');
INSERT INTO `sys_role_menu` VALUES ('8', '1041');
INSERT INTO `sys_role_menu` VALUES ('8', '1042');
INSERT INTO `sys_role_menu` VALUES ('8', '1043');
INSERT INTO `sys_role_menu` VALUES ('8', '1044');
INSERT INTO `sys_role_menu` VALUES ('8', '1045');
INSERT INTO `sys_role_menu` VALUES ('8', '1046');
INSERT INTO `sys_role_menu` VALUES ('8', '1047');
INSERT INTO `sys_role_menu` VALUES ('8', '1048');
INSERT INTO `sys_role_menu` VALUES ('8', '1049');
INSERT INTO `sys_role_menu` VALUES ('8', '1050');
INSERT INTO `sys_role_menu` VALUES ('8', '1051');
INSERT INTO `sys_role_menu` VALUES ('8', '1052');
INSERT INTO `sys_role_menu` VALUES ('8', '1053');
INSERT INTO `sys_role_menu` VALUES ('8', '1054');
INSERT INTO `sys_role_menu` VALUES ('9', '2');
INSERT INTO `sys_role_menu` VALUES ('9', '100');
INSERT INTO `sys_role_menu` VALUES ('9', '109');
INSERT INTO `sys_role_menu` VALUES ('9', '110');
INSERT INTO `sys_role_menu` VALUES ('9', '111');
INSERT INTO `sys_role_menu` VALUES ('9', '112');
INSERT INTO `sys_role_menu` VALUES ('9', '1001');
INSERT INTO `sys_role_menu` VALUES ('9', '1002');
INSERT INTO `sys_role_menu` VALUES ('9', '1003');
INSERT INTO `sys_role_menu` VALUES ('9', '1004');
INSERT INTO `sys_role_menu` VALUES ('9', '1005');
INSERT INTO `sys_role_menu` VALUES ('9', '1006');
INSERT INTO `sys_role_menu` VALUES ('9', '1007');
INSERT INTO `sys_role_menu` VALUES ('9', '1046');
INSERT INTO `sys_role_menu` VALUES ('9', '1047');
INSERT INTO `sys_role_menu` VALUES ('9', '1048');
INSERT INTO `sys_role_menu` VALUES ('9', '1049');
INSERT INTO `sys_role_menu` VALUES ('9', '1050');
INSERT INTO `sys_role_menu` VALUES ('9', '1051');
INSERT INTO `sys_role_menu` VALUES ('9', '1052');
INSERT INTO `sys_role_menu` VALUES ('9', '1053');
INSERT INTO `sys_role_menu` VALUES ('9', '1054');
INSERT INTO `sys_role_menu` VALUES ('9', '1061');
INSERT INTO `sys_role_menu` VALUES ('10', '2');
INSERT INTO `sys_role_menu` VALUES ('10', '100');
INSERT INTO `sys_role_menu` VALUES ('10', '109');
INSERT INTO `sys_role_menu` VALUES ('10', '110');
INSERT INTO `sys_role_menu` VALUES ('10', '111');
INSERT INTO `sys_role_menu` VALUES ('10', '112');
INSERT INTO `sys_role_menu` VALUES ('10', '1001');
INSERT INTO `sys_role_menu` VALUES ('10', '1002');
INSERT INTO `sys_role_menu` VALUES ('10', '1003');
INSERT INTO `sys_role_menu` VALUES ('10', '1004');
INSERT INTO `sys_role_menu` VALUES ('10', '1005');
INSERT INTO `sys_role_menu` VALUES ('10', '1006');
INSERT INTO `sys_role_menu` VALUES ('10', '1007');
INSERT INTO `sys_role_menu` VALUES ('10', '1046');
INSERT INTO `sys_role_menu` VALUES ('10', '1047');
INSERT INTO `sys_role_menu` VALUES ('10', '1048');
INSERT INTO `sys_role_menu` VALUES ('10', '1049');
INSERT INTO `sys_role_menu` VALUES ('10', '1050');
INSERT INTO `sys_role_menu` VALUES ('10', '1051');
INSERT INTO `sys_role_menu` VALUES ('10', '1052');
INSERT INTO `sys_role_menu` VALUES ('10', '1053');
INSERT INTO `sys_role_menu` VALUES ('10', '1054');
INSERT INTO `sys_role_menu` VALUES ('10', '1061');
INSERT INTO `sys_role_menu` VALUES ('11', '1');
INSERT INTO `sys_role_menu` VALUES ('11', '100');
INSERT INTO `sys_role_menu` VALUES ('11', '101');
INSERT INTO `sys_role_menu` VALUES ('11', '102');
INSERT INTO `sys_role_menu` VALUES ('11', '103');
INSERT INTO `sys_role_menu` VALUES ('11', '104');
INSERT INTO `sys_role_menu` VALUES ('11', '105');
INSERT INTO `sys_role_menu` VALUES ('11', '106');
INSERT INTO `sys_role_menu` VALUES ('11', '107');
INSERT INTO `sys_role_menu` VALUES ('11', '108');
INSERT INTO `sys_role_menu` VALUES ('11', '500');
INSERT INTO `sys_role_menu` VALUES ('11', '501');
INSERT INTO `sys_role_menu` VALUES ('11', '1001');
INSERT INTO `sys_role_menu` VALUES ('11', '1002');
INSERT INTO `sys_role_menu` VALUES ('11', '1003');
INSERT INTO `sys_role_menu` VALUES ('11', '1004');
INSERT INTO `sys_role_menu` VALUES ('11', '1005');
INSERT INTO `sys_role_menu` VALUES ('11', '1006');
INSERT INTO `sys_role_menu` VALUES ('11', '1007');
INSERT INTO `sys_role_menu` VALUES ('11', '1008');
INSERT INTO `sys_role_menu` VALUES ('11', '1009');
INSERT INTO `sys_role_menu` VALUES ('11', '1010');
INSERT INTO `sys_role_menu` VALUES ('11', '1011');
INSERT INTO `sys_role_menu` VALUES ('11', '1012');
INSERT INTO `sys_role_menu` VALUES ('11', '1013');
INSERT INTO `sys_role_menu` VALUES ('11', '1014');
INSERT INTO `sys_role_menu` VALUES ('11', '1015');
INSERT INTO `sys_role_menu` VALUES ('11', '1016');
INSERT INTO `sys_role_menu` VALUES ('11', '1017');
INSERT INTO `sys_role_menu` VALUES ('11', '1018');
INSERT INTO `sys_role_menu` VALUES ('11', '1019');
INSERT INTO `sys_role_menu` VALUES ('11', '1020');
INSERT INTO `sys_role_menu` VALUES ('11', '1021');
INSERT INTO `sys_role_menu` VALUES ('11', '1022');
INSERT INTO `sys_role_menu` VALUES ('11', '1023');
INSERT INTO `sys_role_menu` VALUES ('11', '1024');
INSERT INTO `sys_role_menu` VALUES ('11', '1025');
INSERT INTO `sys_role_menu` VALUES ('11', '1026');
INSERT INTO `sys_role_menu` VALUES ('11', '1027');
INSERT INTO `sys_role_menu` VALUES ('11', '1028');
INSERT INTO `sys_role_menu` VALUES ('11', '1029');
INSERT INTO `sys_role_menu` VALUES ('11', '1030');
INSERT INTO `sys_role_menu` VALUES ('11', '1031');
INSERT INTO `sys_role_menu` VALUES ('11', '1032');
INSERT INTO `sys_role_menu` VALUES ('11', '1033');
INSERT INTO `sys_role_menu` VALUES ('11', '1034');
INSERT INTO `sys_role_menu` VALUES ('11', '1035');
INSERT INTO `sys_role_menu` VALUES ('11', '1036');
INSERT INTO `sys_role_menu` VALUES ('11', '1037');
INSERT INTO `sys_role_menu` VALUES ('11', '1038');
INSERT INTO `sys_role_menu` VALUES ('11', '1039');
INSERT INTO `sys_role_menu` VALUES ('11', '1040');
INSERT INTO `sys_role_menu` VALUES ('11', '1041');
INSERT INTO `sys_role_menu` VALUES ('11', '1042');
INSERT INTO `sys_role_menu` VALUES ('11', '1043');
INSERT INTO `sys_role_menu` VALUES ('11', '1044');
INSERT INTO `sys_role_menu` VALUES ('11', '1045');
INSERT INTO `sys_role_menu` VALUES ('11', '1061');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `mate_id` bigint(20) DEFAULT '0' COMMENT '用户信息ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `salt` char(10) DEFAULT NULL COMMENT '密码盐',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', '0', 'admin', '新约谈', '00', 'ry@163.com', '15888888888', '1', '', 'f9609cd9db1529ddb375c7b7f3792e23', 'KavObw', '1', '0', '[::1]', '2020-04-10 18:00:52', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', '0', 'xinyuetan', '片氪', '00', 'ry@qq.com', '15666666666', '1', '', '2bd095f0bd6f62a5e64902866cad4cc1', 'U11NSq', '1', '0', '[::1]', '2020-03-21 00:33:33', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES ('4', '103', '0', 'kena', '可那', '00', 'ry@qq.com', '15666666666', '0', '', 'e10adc3949ba59abbe56e057f20f883e', 'ckTV21', '0', '0', '[::1]', '2020-03-07 22:48:01', 'admin', '2018-03-16 11:33:00', 'rt', '2018-03-16 11:33:00', 'asd');
INSERT INTO `sys_user` VALUES ('6', '108', '0', 'a121300', '我试试啊的啊', '', 'admin@qq.com', '13097797317', '1', '', '064d332aeee88f17b1e8c4e526c2da17', 'ckTV21', '0', '0', '', null, 'admin', '2020-03-10 15:49:24', '', '2020-03-10 15:49:24', '测试人员');
INSERT INTO `sys_user` VALUES ('7', '101', '0', 'Reiki', 'asdasfasdasd', '', 'adm@qq.com', '13097797315', '2', '', 'e10adc3949ba59abbe56e057f20f883e', 'ckTV21', '0', '2', '', null, 'admin', '2020-03-10 17:32:43', '', '2020-03-10 17:32:43', '');
INSERT INTO `sys_user` VALUES ('8', '100', '0', 'yingasa啊54', '看书的风格', '', 'eforinsfaj@gma.com', '13797897366', '1', '', 'e10adc3949ba59abbe56e057f20f883e', 'ckTV21', '0', '2', '', null, 'admin', '2020-03-10 17:35:04', 'admin', '2020-03-10 21:52:16', '成啊');
INSERT INTO `sys_user` VALUES ('9', '107', '0', 'jklhdfrgdsgj', '重新修改的昵称asdas', '', 'admin@entovchte.com', '13093737317', '1', '', '1219aa4a98e1773c4fa880eb0ff3a4a7', 'qWzntQ', '0', '2', '', null, 'admin', '2020-03-10 20:23:51', 'admin', '2020-03-10 21:09:53', 'casda');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('5', '2');
INSERT INTO `sys_user_post` VALUES ('5', '3');
INSERT INTO `sys_user_post` VALUES ('6', '2');
INSERT INTO `sys_user_post` VALUES ('6', '3');
INSERT INTO `sys_user_post` VALUES ('8', '2');
INSERT INTO `sys_user_post` VALUES ('8', '3');
INSERT INTO `sys_user_post` VALUES ('9', '2');
INSERT INTO `sys_user_post` VALUES ('9', '3');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('5', '1');
INSERT INTO `sys_user_role` VALUES ('5', '2');
INSERT INTO `sys_user_role` VALUES ('6', '1');
INSERT INTO `sys_user_role` VALUES ('6', '2');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1');
INSERT INTO `sys_user_role` VALUES ('9', '2');
