/*
Navicat MySQL Data Transfer

Source Server         : eforinaj
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : yqgo

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-04-21 01:41:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `cate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0' COMMENT '顶级分类',
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
  `cate_description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('1', '0', '测试分类', 'test', 'http://localhost:8199/static/uploads/2020-04-10/c1xl2e93uickc03ft0.png', '测试', '1', '0', '0', 'circle', 'admin', '2020-04-10 22:05:36', '', null, '用来测试的圈子分类', '用来测试的圈子分类');
INSERT INTO `sys_category` VALUES ('2', '0', '美食', 'meishi', 'http://localhost:8199/static/uploads/2020-04-11/c1y6u6alld5gwyuu2c.png', '美食', '99', '0', '0', 'circle', 'admin', '2020-04-11 15:09:11', '', null, '', '美食分类');
INSERT INTO `sys_category` VALUES ('3', '2', '豆腐0.0', 'doufu', 'http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png', '豆腐', '12', '0', '0', 'circle', 'admin', '2020-04-11 15:19:17', 'admin', '2020-04-13 18:11:41', 'v和你们v吧', '豆腐');
INSERT INTO `sys_category` VALUES ('4', '0', '测试分类', 'asdz', 'http://localhost:8199/static/uploads/2020-04-19/c258qzrurltscexvbl.png', '测试', '1', '0', '0', 'resource', 'admin', '2020-04-19 22:07:34', '', null, '', '撒旦发生');
INSERT INTO `sys_category` VALUES ('5', '4', '小测试', 'sas', 'http://localhost:8199/static/uploads/2020-04-19/c258rb6b0yrwxzfhuy.png', 'fdgssa', '0', '0', '0', 'resource', 'admin', '2020-04-19 22:07:58', '', null, 'fsadfasdas', 'asdasdas');
INSERT INTO `sys_category` VALUES ('6', '0', '阿松大阿萨的', 'sdfasdasd', 'http://localhost:8199/static/uploads/2020-04-19/c258ro4i6ckwl8osi3.png', 'fgsd', '1', '0', '0', 'resource', 'admin', '2020-04-19 22:08:25', '', null, 'dfgd', 'dfg');

-- ----------------------------
-- Table structure for sys_circle
-- ----------------------------
DROP TABLE IF EXISTS `sys_circle`;
CREATE TABLE `sys_circle` (
  `circle_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `circle_name` varchar(50) DEFAULT NULL COMMENT '圈子名称',
  `circle_desc` varchar(255) DEFAULT NULL COMMENT '圈子描述',
  `circle_img` varchar(255) DEFAULT NULL COMMENT '圈子背景图',
  `cate_id` bigint(20) DEFAULT NULL COMMENT '圈子所属分类',
  `user_id` bigint(20) DEFAULT NULL COMMENT '管理者',
  `join_type` varchar(50) DEFAULT NULL COMMENT '圈子加入的权限类型',
  `join_value` decimal(10,2) DEFAULT NULL COMMENT '加入值',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `post_count` bigint(10) DEFAULT '0' COMMENT '帖子数量',
  `join_count` bigint(10) DEFAULT '0' COMMENT '加入数量',
  PRIMARY KEY (`circle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_circle
-- ----------------------------
INSERT INTO `sys_circle` VALUES ('2', '文人士', '手机电话费技术的', 'http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png', '2', '2', '3', '2.00', 'admin', '2020-04-13 00:54:23', 'admin', '2020-04-13 16:57:28', '0', '0', '撒旦开发', '5215115', '1515415415');
INSERT INTO `sys_circle` VALUES ('13', 'asdasd', '撒打算', 'http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png', '1', '1', '3', '2.00', 'admin', '2020-04-13 18:50:16', '', null, '0', '0', '啊实打实', '4', '5');
INSERT INTO `sys_circle` VALUES ('14', '相当高v的风格', '岁的法国撒旦', 'http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png', '2', '1', '3', '2.00', 'admin', '2020-04-13 18:50:39', '', null, '1', '0', '士大夫撒旦', '2', '3');
INSERT INTO `sys_circle` VALUES ('15', '发达的', '打发时光的是法国', 'http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png', '1', '1', '1', '0.00', 'admin', '2020-04-14 23:24:01', '', null, '0', '0', '岁的法国撒旦', '123', '12312');

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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门表';

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

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
INSERT INTO `sys_dict_data` VALUES ('43', '0', '圈子', 'circle', 'sys_modules', '', '', 'Y', '0', 'admin', '2020-04-10 21:39:57', '', null, '圈子模块');
INSERT INTO `sys_dict_data` VALUES ('44', '0', '资源', 'resource', 'sys_modules', '', '', 'Y', '0', 'admin', '2020-04-10 21:41:54', 'admin', '2020-04-19 23:01:01', '资源模块');
INSERT INTO `sys_dict_data` VALUES ('45', '0', '帖子', 'feed', 'sys_modules', '', '', 'Y', '0', 'admin', '2020-04-10 21:42:17', '', null, '帖子模块');
INSERT INTO `sys_dict_data` VALUES ('47', '0', '积分限制', '3', 'sys_circle_premis', '', '', 'Y', '0', 'admin', '2020-04-11 12:44:16', 'admin', '2020-04-12 14:34:49', '积分限制加入');
INSERT INTO `sys_dict_data` VALUES ('48', '0', '付费限制', '2', 'sys_circle_premis', '', '', 'Y', '0', 'admin', '2020-04-11 12:47:19', 'admin', '2020-04-12 14:34:44', '付费加入');
INSERT INTO `sys_dict_data` VALUES ('49', '0', '邀请加入', '1', 'sys_circle_premis', '', '', 'Y', '0', 'admin', '2020-04-11 12:57:19', 'admin', '2020-04-12 14:34:39', '邀请加入');
INSERT INTO `sys_dict_data` VALUES ('50', '0', '无限制', '-1', 'sys_circle_premis', '', '', 'Y', '0', 'admin', '2020-04-11 12:57:36', 'admin', '2020-04-12 14:34:29', '无限制加入');
INSERT INTO `sys_dict_data` VALUES ('51', '0', '普通', 'general', 'sys_gruop_type', '', '', 'Y', '0', 'admin', '2020-04-14 00:03:20', 'admin', '2020-04-14 00:03:56', '普通用户');
INSERT INTO `sys_dict_data` VALUES ('52', '0', '会员', 'vip', 'sys_gruop_type', '', '', 'Y', '0', 'admin', '2020-04-14 00:03:50', '', null, '会员用户');
INSERT INTO `sys_dict_data` VALUES ('54', '0', '积分', '1', 'sys_gruop_auth', '', '', 'Y', '0', 'admin', '2020-04-14 17:03:43', '', null, '积分开通');
INSERT INTO `sys_dict_data` VALUES ('55', '0', '付费', '2', 'sys_gruop_auth', '', '', 'Y', '0', 'admin', '2020-04-14 17:03:55', '', null, '付费开通');
INSERT INTO `sys_dict_data` VALUES ('56', '0', '图片', 'img', 'sys_res_type', '', '', 'Y', '0', 'admin', '2020-04-18 15:39:16', '', null, '图片 类型');
INSERT INTO `sys_dict_data` VALUES ('57', '0', '音频', 'music', 'sys_res_type', '', '', 'Y', '0', 'admin', '2020-04-18 15:39:33', '', null, '音频类型');
INSERT INTO `sys_dict_data` VALUES ('58', '0', '视频', 'media', 'sys_res_type', '', '', 'Y', '0', 'admin', '2020-04-18 15:39:49', '', null, '视频类型');
INSERT INTO `sys_dict_data` VALUES ('59', '0', '无限制', '-1', 'sys_res_auth', '', '', 'Y', '0', 'admin', '2020-04-19 22:43:37', '', null, '无限制加入');
INSERT INTO `sys_dict_data` VALUES ('60', '0', '付费', '1', 'sys_res_auth', '', '', 'Y', '0', 'admin', '2020-04-19 22:43:51', 'admin', '2020-04-19 22:44:08', '付费下载');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

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
INSERT INTO `sys_dict_type` VALUES ('17', '系统模块', 'sys_modules', '0', 'admin', '2020-04-10 21:38:02', 'admin', '2020-04-14 16:50:49', '系统模块列表');
INSERT INTO `sys_dict_type` VALUES ('19', '圈子权限', 'sys_circle_premis', '0', 'admin', '2020-04-11 12:33:51', '', null, '圈子权限列表');
INSERT INTO `sys_dict_type` VALUES ('20', '用户组类型', 'sys_gruop_type', '0', 'admin', '2020-04-14 00:01:15', 'admin', '2020-04-14 00:01:33', '用户组类型列表');
INSERT INTO `sys_dict_type` VALUES ('21', '用户组权限', 'sys_gruop_auth', '0', 'admin', '2020-04-14 01:06:54', '', null, '用户组权限列表');
INSERT INTO `sys_dict_type` VALUES ('22', '资源类型', 'sys_res_type', '0', 'admin', '2020-04-18 15:38:23', 'admin', '2020-04-18 15:42:43', '资源类型列表');
INSERT INTO `sys_dict_type` VALUES ('23', '资源下载权限', 'sys_res_auth', '0', 'admin', '2020-04-19 22:42:33', '', null, '资源下载权限列表');

-- ----------------------------
-- Table structure for sys_gruop
-- ----------------------------
DROP TABLE IF EXISTS `sys_gruop`;
CREATE TABLE `sys_gruop` (
  `gruop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gruop_name` varchar(50) DEFAULT NULL COMMENT '小组名称',
  `gruop_type` varchar(50) DEFAULT NULL COMMENT '小组标识',
  `gruop_img` varchar(255) DEFAULT NULL COMMENT '小组图标',
  `down_times` int(10) DEFAULT NULL COMMENT '下载次数',
  `open_type` char(1) DEFAULT NULL COMMENT '开通方式（1 积分 ， 2 付费）',
  `open_value` decimal(10,2) DEFAULT NULL COMMENT '开通费用',
  `validity` int(10) DEFAULT NULL COMMENT '有效期',
  `auth_module` varchar(255) DEFAULT NULL COMMENT '权限模块',
  `status` char(1) DEFAULT NULL COMMENT '小组状态( 0: 否，1：是)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`gruop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_gruop
-- ----------------------------
INSERT INTO `sys_gruop` VALUES ('1', '现在发生的', 'general', 'http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png', '32423', '1', '213421.00', '342', '', '0', '豆腐干岁的法国', 'admin', '2020-04-14 23:25:14', '', null);

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
INSERT INTO `sys_logininfor` VALUES ('5', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImV4cCI6MTU4NzQxMjQ3OSwiaWF0IjoxNTg3NDAzODc5LCJpc3MiOiJhZG1pbiJ9.Ki5aUhh7ejHH52fZIEDzq9sQWFEu4cNJYp8K8KQSlbE', '2020-04-21 01:31:19');

-- ----------------------------
-- Table structure for sys_media
-- ----------------------------
DROP TABLE IF EXISTS `sys_media`;
CREATE TABLE `sys_media` (
  `media_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '上传的用户',
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_media
-- ----------------------------
INSERT INTO `sys_media` VALUES ('4', '1', 'http://localhost:8199/static/uploads/2020-04-10/c1xjd4tc8pqs2mofcd.png', '/public/uploads/2020-04-10/c1xjd4tc8pqs2mofcd.png', 'c1xjd4tc8pqs2mofcd.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-10 20:45:13', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('5', '1', 'http://localhost:8199/static/uploads/2020-04-10/c1xjezcwgdhghznvsl.png', '/public/uploads/2020-04-10/c1xjezcwgdhghznvsl.png', 'c1xjezcwgdhghznvsl.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-10 20:47:38', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('6', '1', 'http://localhost:8199/static/uploads/2020-04-10/c1xl2e93uickc03ft0.png', '/public/uploads/2020-04-10/c1xl2e93uickc03ft0.png', 'c1xl2e93uickc03ft0.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-10 22:05:14', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('7', '1', 'http://localhost:8199/static/uploads/2020-04-11/c1y6u6alld5gwyuu2c.png', '/public/uploads/2020-04-11/c1y6u6alld5gwyuu2c.png', 'c1y6u6alld5gwyuu2c.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-11 15:08:54', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('8', '1', 'http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png', '/public/uploads/2020-04-11/c1y71zorut7sytqoyg.png', 'c1y71zorut7sytqoyg.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-11 15:19:06', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('9', '1', 'http://localhost:8199/static/uploads/2020-04-12/c1yzlye61qc4fa7dgn.png', '/public/uploads/2020-04-12/c1yzlye61qc4fa7dgn.png', 'c1yzlye61qc4fa7dgn.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-12 13:41:42', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('10', '1', 'http://localhost:8199/static/uploads/2020-04-12/c1z0djr0ymn4ewkbme.png', '/public/uploads/2020-04-12/c1z0djr0ymn4ewkbme.png', 'c1z0djr0ymn4ewkbme.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-12 14:17:44', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('11', '1', 'http://localhost:8199/static/uploads/2020-04-12/c1z1sr8r2hso0oehyq.png', '/public/uploads/2020-04-12/c1z1sr8r2hso0oehyq.png', 'c1z1sr8r2hso0oehyq.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-12 15:24:37', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('12', '1', 'http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png', '/public/uploads/2020-04-13/c1zdtb01aik0yvtq85.png', 'c1zdtb01aik0yvtq85.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-13 00:49:33', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('13', '1', 'http://localhost:8199/static/uploads/2020-04-13/c1zdus54zmp0ginm0x.png', '/public/uploads/2020-04-13/c1zdus54zmp0ginm0x.png', 'c1zdus54zmp0ginm0x.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-13 00:51:29', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('14', '1', 'http://localhost:8199/static/uploads/2020-04-13/c1zdw1vxhkc8ug5a0g.png', '/public/uploads/2020-04-13/c1zdw1vxhkc8ug5a0g.png', 'c1zdw1vxhkc8ug5a0g.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-13 00:53:09', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('15', '1', 'http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png', '/public/uploads/2020-04-13/c1zszfdfvs8oibwii9.png', 'c1zszfdfvs8oibwii9.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-13 12:42:50', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('16', '1', 'http://localhost:8199/static/uploads/2020-04-13/c2006nk5siv0hmt7w6.png', '/public/uploads/2020-04-13/c2006nk5siv0hmt7w6.png', 'c2006nk5siv0hmt7w6.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-13 18:21:24', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('17', '1', 'http://localhost:8199/static/uploads/2020-04-14/c20tee49jad4qtn6ju.png', '/public/uploads/2020-04-14/c20tee49jad4qtn6ju.png', 'c20tee49jad4qtn6ju.png', 'QQ截图20200410202933.png', '404', '1', '.png', '2020-04-14 17:15:03', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('18', '1', 'http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png', '/public/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png', 'c20xn9z9tlx4uukkfy.png', 'QQ截图20200410202933.png', '404', '1', '.png', '2020-04-14 20:34:43', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('19', '1', 'http://localhost:8199/static/uploads/2020-04-15/c212n3ule6ow9ojss5.png', '/public/uploads/2020-04-15/c212n3ule6ow9ojss5.png', 'c212n3ule6ow9ojss5.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-15 00:29:35', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('20', '1', 'http://localhost:8199/static/uploads/2020-04-19/c258qzrurltscexvbl.png', '/public/uploads/2020-04-19/c258qzrurltscexvbl.png', 'c258qzrurltscexvbl.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-19 22:07:26', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('21', '1', 'http://localhost:8199/static/uploads/2020-04-19/c258rb6b0yrwxzfhuy.png', '/public/uploads/2020-04-19/c258rb6b0yrwxzfhuy.png', 'c258rb6b0yrwxzfhuy.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-19 22:07:51', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('22', '1', 'http://localhost:8199/static/uploads/2020-04-19/c258ro4i6ckwl8osi3.png', '/public/uploads/2020-04-19/c258ro4i6ckwl8osi3.png', 'c258ro4i6ckwl8osi3.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-19 22:08:20', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('23', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dchw0u71onrlxhx.png', '/public/uploads/2020-04-20/c25dchw0u71onrlxhx.png', 'c25dchw0u71onrlxhx.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 01:43:36', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('24', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dd4odqfj45qn5on.png', '/public/uploads/2020-04-20/c25dd4odqfj45qn5on.png', 'c25dd4odqfj45qn5on.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 01:44:26', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('25', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25ddx2e47xcb2xgv6.png', '/public/uploads/2020-04-20/c25ddx2e47xcb2xgv6.png', 'c25ddx2e47xcb2xgv6.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 01:45:27', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('26', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25df7fmr1s8u4wwlp.png', '/public/uploads/2020-04-20/c25df7fmr1s8u4wwlp.png', 'c25df7fmr1s8u4wwlp.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 01:47:08', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('27', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dfkull5d8aoj2jn.png', '/public/uploads/2020-04-20/c25dfkull5d8aoj2jn.png', 'c25dfkull5d8aoj2jn.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 01:47:38', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('28', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dftnejgkwmwm6rg.png', '/public/uploads/2020-04-20/c25dftnejgkwmwm6rg.png', 'c25dftnejgkwmwm6rg.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 01:47:57', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('29', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dg25jyij06xbqnn.png', '/public/uploads/2020-04-20/c25dg25jyij06xbqnn.png', 'c25dg25jyij06xbqnn.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 01:48:15', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('30', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dgqi34sp8x3ochh.png', '/public/uploads/2020-04-20/c25dgqi34sp8x3ochh.png', 'c25dgqi34sp8x3ochh.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 01:49:08', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('31', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25doqf70a9wctkvah.png', '/public/uploads/2020-04-20/c25doqf70a9wctkvah.png', 'c25doqf70a9wctkvah.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 01:59:35', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('32', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dpv0wmpcgxsypce.png', '/public/uploads/2020-04-20/c25dpv0wmpcgxsypce.png', 'c25dpv0wmpcgxsypce.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 02:01:03', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('33', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dq754pg7szcvvl3.png', '/public/uploads/2020-04-20/c25dq754pg7szcvvl3.png', 'c25dq754pg7szcvvl3.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 02:01:30', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('34', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dqn7jj4m8efxduw.png', '/public/uploads/2020-04-20/c25dqn7jj4m8efxduw.png', 'c25dqn7jj4m8efxduw.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 02:02:05', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('35', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dqopmg5scqgqwep.png', '/public/uploads/2020-04-20/c25dqopmg5scqgqwep.png', 'c25dqopmg5scqgqwep.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 02:02:08', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('36', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dqtgmg464dinx9e.png', '/public/uploads/2020-04-20/c25dqtgmg464dinx9e.png', 'c25dqtgmg464dinx9e.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 02:02:18', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('37', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25dtg3ysn2swiuhmv.png', '/public/uploads/2020-04-20/c25dtg3ysn2swiuhmv.png', 'c25dtg3ysn2swiuhmv.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 02:05:44', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('38', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25vnmzjph04bg7e9k.png', '/public/uploads/2020-04-20/c25vnmzjph04bg7e9k.png', 'c25vnmzjph04bg7e9k.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 16:04:29', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('39', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25wub6nsmz4g7zsdq.png', '/public/uploads/2020-04-20/c25wub6nsmz4g7zsdq.png', 'c25wub6nsmz4g7zsdq.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 17:00:13', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('40', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25wvdl1vjpszvil3g.png', '/public/uploads/2020-04-20/c25wvdl1vjpszvil3g.png', 'c25wvdl1vjpszvil3g.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 17:01:37', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('41', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25wvf6cutjwkaazoy.png', '/public/uploads/2020-04-20/c25wvf6cutjwkaazoy.png', 'c25wvf6cutjwkaazoy.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 17:01:40', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('42', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25wxm4hvd3gakigvm.png', '/public/uploads/2020-04-20/c25wxm4hvd3gakigvm.png', 'c25wxm4hvd3gakigvm.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 17:04:32', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('43', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25wxxm0ls9sbbtram.png', '/public/uploads/2020-04-20/c25wxxm0ls9sbbtram.png', 'c25wxxm0ls9sbbtram.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 17:04:57', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('44', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25xvqmvetq4xgrfvb.png', '/public/uploads/2020-04-20/c25xvqmvetq4xgrfvb.png', 'c25xvqmvetq4xgrfvb.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 17:49:06', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('45', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25xvsjgdm4ka54lcy.png', '/public/uploads/2020-04-20/c25xvsjgdm4ka54lcy.png', 'c25xvsjgdm4ka54lcy.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 17:49:10', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('46', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25xxdwqw0mkbixb22.png', '/public/uploads/2020-04-20/c25xxdwqw0mkbixb22.png', 'c25xxdwqw0mkbixb22.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 17:51:15', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('47', '1', 'http://localhost:8199/static/uploads/2020-04-20/c25xxfd4hlcsmlmnyj.png', '/public/uploads/2020-04-20/c25xxfd4hlcsmlmnyj.png', 'c25xxfd4hlcsmlmnyj.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 17:51:18', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('48', '1', 'http://localhost:8199/static/uploads/2020-04-20/c265rlswtdakp5knjz.png', '/public/uploads/2020-04-20/c265rlswtdakp5knjz.png', 'c265rlswtdakp5knjz.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-20 23:59:51', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('49', '1', 'http://localhost:8199/static/uploads/2020-04-20/c265rn0wh1l4hnkzyi.png', '/public/uploads/2020-04-20/c265rn0wh1l4hnkzyi.png', 'c265rn0wh1l4hnkzyi.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-20 23:59:54', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('50', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265wjli4ec0drcwqc.png', '/public/uploads/2020-04-21/c265wjli4ec0drcwqc.png', 'c265wjli4ec0drcwqc.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:06:18', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('51', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265wkx9ndcs7jtdp5.png', '/public/uploads/2020-04-21/c265wkx9ndcs7jtdp5.png', 'c265wkx9ndcs7jtdp5.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-21 00:06:21', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('52', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265wm44sem4g0di6v.png', '/public/uploads/2020-04-21/c265wm44sem4g0di6v.png', 'c265wm44sem4g0di6v.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:06:24', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('53', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265xlol6qsgyfptjf.png', '/public/uploads/2020-04-21/c265xlol6qsgyfptjf.png', 'c265xlol6qsgyfptjf.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:07:41', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('54', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265xn2qyowgukrv91.png', '/public/uploads/2020-04-21/c265xn2qyowgukrv91.png', 'c265xn2qyowgukrv91.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-21 00:07:44', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('55', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265ycjty0c0t7hk3c.png', '/public/uploads/2020-04-21/c265ycjty0c0t7hk3c.png', 'c265ycjty0c0t7hk3c.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-21 00:08:39', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('56', '1', 'http://localhost:8199/static/uploads/2020-04-21/c265ydt51xm8xe018j.png', '/public/uploads/2020-04-21/c265ydt51xm8xe018j.png', 'c265ydt51xm8xe018j.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:08:42', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('57', '1', 'http://localhost:8199/static/uploads/2020-04-21/c2660pa7op7gvroowb.png', '/public/uploads/2020-04-21/c2660pa7op7gvroowb.png', 'c2660pa7op7gvroowb.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:11:44', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('58', '1', 'http://localhost:8199/static/uploads/2020-04-21/c2660qgeeyw8ohbrdw.png', '/public/uploads/2020-04-21/c2660qgeeyw8ohbrdw.png', 'c2660qgeeyw8ohbrdw.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-21 00:11:46', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('59', '1', 'http://localhost:8199/static/uploads/2020-04-21/c2660rno81q07soo4e.png', '/public/uploads/2020-04-21/c2660rno81q07soo4e.png', 'c2660rno81q07soo4e.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:11:49', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('60', '1', 'http://localhost:8199/static/uploads/2020-04-21/c266976vtbq0sordyf.png', '/public/uploads/2020-04-21/c266976vtbq0sordyf.png', 'c266976vtbq0sordyf.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:22:50', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('61', '1', 'http://localhost:8199/static/uploads/2020-04-21/c26698iatvp4zrbozc.png', '/public/uploads/2020-04-21/c26698iatvp4zrbozc.png', 'c26698iatvp4zrbozc.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 00:22:53', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('62', '1', 'http://localhost:8199/static/uploads/2020-04-21/c267pu8s43ogcfcwfg.png', '/public/uploads/2020-04-21/c267pu8s43ogcfcwfg.png', 'c267pu8s43ogcfcwfg.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-21 01:31:35', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('63', '1', 'http://localhost:8199/static/uploads/2020-04-21/c267pvy8gir40uuolw.png', '/public/uploads/2020-04-21/c267pvy8gir40uuolw.png', 'c267pvy8gir40uuolw.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 01:31:39', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('64', '1', 'http://localhost:8199/static/uploads/2020-04-21/c267rsnaby3wu5pvy1.png', '/public/uploads/2020-04-21/c267rsnaby3wu5pvy1.png', 'c267rsnaby3wu5pvy1.png', 'QQ截图20200410192108.png', '2280', '1', '.png', '2020-04-21 01:34:08', null, '0', 'PNG', '');
INSERT INTO `sys_media` VALUES ('65', '1', 'http://localhost:8199/static/uploads/2020-04-21/c267rtzl4ntkzcgwdt.png', '/public/uploads/2020-04-21/c267rtzl4ntkzcgwdt.png', 'c267rtzl4ntkzcgwdt.png', 'QQ截图20200410202933.png', '25216', '1', '.png', '2020-04-21 01:34:11', null, '0', 'PNG', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

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
INSERT INTO `sys_menu` VALUES ('1071', '用户组', '4', '10', 'gruop/list', '', 'GruopList', 'team', '1', 'C', '0', 'gruop:list', 'admin', '2020-04-10 22:09:32', 'admin', '2020-04-10 22:10:12', '');
INSERT INTO `sys_menu` VALUES ('1072', '圈子列表', '1069', '10', 'circle/list', '', 'CircleList', 'loading-3-quarters', '1', 'C', '0', 'circle:list', 'admin', '2020-04-10 23:42:13', 'admin', '2020-04-10 23:42:37', '');
INSERT INTO `sys_menu` VALUES ('1073', '表单生成', '3', '10', 'kform', '', 'KForm', 'bars', '1', 'C', '0', 'kform', 'admin', '2020-04-11 21:20:37', '', null, '');
INSERT INTO `sys_menu` VALUES ('1074', '标签列表', '1069', '10', 'tag/list', '', 'TagList', 'tags', '1', 'C', '0', 'tag:list', 'admin', '2020-04-15 12:41:27', 'admin', '2020-04-15 17:50:30', '');
INSERT INTO `sys_menu` VALUES ('1075', '资源管理', '0', '10', 'res', '', 'PageView', 'file', '1', 'M', '0', '', 'admin', '2020-04-16 19:13:32', 'admin', '2020-04-16 21:52:17', '');
INSERT INTO `sys_menu` VALUES ('1076', '资源列表', '1075', '10', 'list', '', 'ResourcesList', 'bars', '1', 'C', '0', 'res:list', 'admin', '2020-04-16 19:16:08', 'admin', '2020-04-16 21:53:31', '');
INSERT INTO `sys_menu` VALUES ('1077', '创建资源', '1075', '10', 'create', '', 'ResourcesAdd', 'file-add', '1', 'C', '1', 'res:create', 'admin', '2020-04-16 22:21:10', 'admin', '2020-04-16 22:23:34', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

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
INSERT INTO `sys_oper_log` VALUES ('58', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":0,\"CateName\":\"测试分类\",\"CateModule\":\"circle\",\"CateSlug\":\"test\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-10/c1xl2e93uickc03ft0.png\",\"CateSort\":1,\"CateKey\":\"测试\",\"CateDescription\":\"用来测试的圈子分类\",\"Status\":\"0\",\"Remark\":\"用来测试的圈子分类\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 22:05:36');
INSERT INTO `sys_oper_log` VALUES ('59', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":4,\"MenuType\":\"C\",\"MenuName\":\"用户组\",\"OrderNum\":10,\"Path\":\"gruop/list\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"gruop:list\",\"Visible\":\"0\",\"Component\":\"GruopList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 22:09:32');
INSERT INTO `sys_oper_log` VALUES ('60', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1071,\"ParentId\":4,\"MenuType\":\"C\",\"MenuName\":\"用户组\",\"OrderNum\":10,\"Path\":\"gruop/list\",\"Icon\":\"team\",\"IsFrame\":1,\"Perms\":\"gruop:list\",\"Visible\":\"0\",\"Component\":\"GruopList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 22:10:12');
INSERT INTO `sys_oper_log` VALUES ('61', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"用户组类型\",\"DictType\":\"sys_gruop_type\",\"Status\":\"0\",\"Remark\":\"用户组类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 22:27:15');
INSERT INTO `sys_oper_log` VALUES ('62', '字典类型删除', '3', '/api/v1/admin/dict/type/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/remove', '[::1]', '内网IP', '[18]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 22:28:05');
INSERT INTO `sys_oper_log` VALUES ('63', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"圈子管理\",\"OrderNum\":10,\"Path\":\"circle/list\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"circle:list\",\"Visible\":\"0\",\"Component\":\"CircleList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 23:42:13');
INSERT INTO `sys_oper_log` VALUES ('64', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1072,\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"圈子列表\",\"OrderNum\":10,\"Path\":\"circle/list\",\"Icon\":\"loading-3-quarters\",\"IsFrame\":1,\"Perms\":\"circle:list\",\"Visible\":\"0\",\"Component\":\"CircleList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-10 23:42:37');
INSERT INTO `sys_oper_log` VALUES ('65', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"圈子权限\",\"DictType\":\"sys_circle_premis\",\"Status\":\"0\",\"Remark\":\"圈子权限列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:33:51');
INSERT INTO `sys_oper_log` VALUES ('66', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"等级限制\",\"DictValue\":\"grade\",\"DictType\":\"sys_circle_premis\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"等级限制\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:43:47');
INSERT INTO `sys_oper_log` VALUES ('67', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"积分限制\",\"DictValue\":\"integral\",\"DictType\":\"sys_circle_premis\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"积分限制\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:44:16');
INSERT INTO `sys_oper_log` VALUES ('68', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":47,\"DictLabel\":\"积分限制\",\"DictValue\":\"integral\",\"DictType\":\"sys_circle_premis\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"积分限制加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:44:23');
INSERT INTO `sys_oper_log` VALUES ('69', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":46,\"DictLabel\":\"等级限制\",\"DictValue\":\"grade\",\"DictType\":\"sys_circle_premis\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"等级限制加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:44:29');
INSERT INTO `sys_oper_log` VALUES ('70', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"付费限制\",\"DictValue\":\"pay\",\"DictType\":\"sys_circle_premis\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"付费加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:47:19');
INSERT INTO `sys_oper_log` VALUES ('71', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"邀请加入\",\"DictValue\":\"invite\",\"DictType\":\"sys_circle_premis\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"邀请加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:57:19');
INSERT INTO `sys_oper_log` VALUES ('72', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"无限制\",\"DictValue\":\"free\",\"DictType\":\"sys_circle_premis\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"无限制加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 12:57:36');
INSERT INTO `sys_oper_log` VALUES ('73', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":0,\"CateName\":\"美食\",\"CateModule\":\"circle\",\"CateSlug\":\"meishi\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-11/c1y6u6alld5gwyuu2c.png\",\"CateSort\":99,\"CateKey\":\"美食\",\"CateDescription\":\"美食分类\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 15:09:11');
INSERT INTO `sys_oper_log` VALUES ('74', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":2,\"CateName\":\"豆腐\",\"CateModule\":\"circle\",\"CateSlug\":\"doufu\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png\",\"CateSort\":12,\"CateKey\":\"豆腐\",\"CateDescription\":\"豆腐\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 15:19:17');
INSERT INTO `sys_oper_log` VALUES ('75', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":3,\"MenuType\":\"C\",\"MenuName\":\"表单生成\",\"OrderNum\":10,\"Path\":\"kform\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"kform\",\"Visible\":\"0\",\"Component\":\"KForm\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-11 21:20:37');
INSERT INTO `sys_oper_log` VALUES ('76', '字典数据删除', '3', '/api/v1/admin/dict/data/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/remove', '[::1]', '内网IP', '[46]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-12 12:22:06');
INSERT INTO `sys_oper_log` VALUES ('77', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":50,\"DictLabel\":\"无限制\",\"DictValue\":\"-1\",\"DictType\":\"sys_circle_premis\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"无限制加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-12 14:34:29');
INSERT INTO `sys_oper_log` VALUES ('78', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":49,\"DictLabel\":\"邀请加入\",\"DictValue\":\"1\",\"DictType\":\"sys_circle_premis\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"邀请加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-12 14:34:39');
INSERT INTO `sys_oper_log` VALUES ('79', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":48,\"DictLabel\":\"付费限制\",\"DictValue\":\"2\",\"DictType\":\"sys_circle_premis\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"付费加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-12 14:34:44');
INSERT INTO `sys_oper_log` VALUES ('80', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":47,\"DictLabel\":\"积分限制\",\"DictValue\":\"3\",\"DictType\":\"sys_circle_premis\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"积分限制加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-12 14:34:49');
INSERT INTO `sys_oper_log` VALUES ('81', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"asdasd\",\"JoinType\":\"2\",\"UserId\":1,\"PostCount\":5,\"JoinCount\":3,\"CircleDesc\":\"啊实打实\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdw1vxhkc8ug5a0g.png\",\"JoinValue\":\"52.11\",\"Status\":\"0\",\"Remark\":\"啊实打实的\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-13 00:53:18');
INSERT INTO `sys_oper_log` VALUES ('82', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"asdasd\",\"JoinType\":\"2\",\"UserId\":1,\"PostCount\":5,\"JoinCount\":3,\"CircleDesc\":\"啊实打实\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdw1vxhkc8ug5a0g.png\",\"JoinValue\":\"52.11\",\"Status\":\"0\",\"Remark\":\"啊实打实的\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 00:54:23');
INSERT INTO `sys_oper_log` VALUES ('83', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":2,\"CircleName\":\"老八美食\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":4,\"JoinCount\":4,\"CircleDesc\":\"啊实打实\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"啊实打实的阿斯顿\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 00:54:55');
INSERT INTO `sys_oper_log` VALUES ('84', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":3,\"CircleName\":\"asdasd\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":100,\"JoinCount\":100,\"CircleDesc\":\"阿斯顿阿斯顿\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"啊实打实\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 02:19:59');
INSERT INTO `sys_oper_log` VALUES ('85', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":2,\"CircleName\":\"车是啊速度\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":100,\"JoinCount\":100,\"CircleDesc\":\"手动阀手动阀\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"从v不错v\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 12:39:42');
INSERT INTO `sys_oper_log` VALUES ('86', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":2,\"CircleName\":\"文人士大夫\",\"JoinType\":\"2\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2.55\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 12:43:06');
INSERT INTO `sys_oper_log` VALUES ('87', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:45:51');
INSERT INTO `sys_oper_log` VALUES ('88', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"车是啊速度阿斯顿\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:46:09');
INSERT INTO `sys_oper_log` VALUES ('89', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:47:17');
INSERT INTO `sys_oper_log` VALUES ('90', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"啊实打实\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:48:04');
INSERT INTO `sys_oper_log` VALUES ('91', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:49:27');
INSERT INTO `sys_oper_log` VALUES ('92', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:50:14');
INSERT INTO `sys_oper_log` VALUES ('93', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"你们，不能\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:50:38');
INSERT INTO `sys_oper_log` VALUES ('94', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:53:50');
INSERT INTO `sys_oper_log` VALUES ('95', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"兼顾以后\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:56:32');
INSERT INTO `sys_oper_log` VALUES ('96', '修改分类', '2', '/api/v1/admin/category/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/edit', '[::1]', '内网IP', '{\"CateId\":3,\"ParentId\":0,\"CateName\":\"豆腐\",\"CateModule\":\"circle\",\"CateSlug\":\"doufu\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png\",\"CateSort\":12,\"CateKey\":\"豆腐\",\"CateDescription\":\"豆腐\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:58:03');
INSERT INTO `sys_oper_log` VALUES ('97', '修改分类', '2', '/api/v1/admin/category/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/edit', '[::1]', '内网IP', '{\"CateId\":3,\"ParentId\":0,\"CateName\":\"豆腐\",\"CateModule\":\"circle\",\"CateSlug\":\"doufu\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png\",\"CateSort\":12,\"CateKey\":\"豆腐\",\"CateDescription\":\"豆腐\",\"Status\":\"0\",\"Remark\":\"v和你们v吧\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:58:14');
INSERT INTO `sys_oper_log` VALUES ('98', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文从v吧\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 15:59:51');
INSERT INTO `sys_oper_log` VALUES ('99', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人和表面经过多次\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:00:36');
INSERT INTO `sys_oper_log` VALUES ('100', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:44:00');
INSERT INTO `sys_oper_log` VALUES ('101', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:44:58');
INSERT INTO `sys_oper_log` VALUES ('102', '修改分类', '2', '/api/v1/admin/category/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/edit', '[::1]', '内网IP', '{\"CateId\":3,\"ParentId\":0,\"CateName\":\"豆腐0.0\",\"CateModule\":\"circle\",\"CateSlug\":\"doufu\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png\",\"CateSort\":12,\"CateKey\":\"豆腐\",\"CateDescription\":\"豆腐\",\"Status\":\"0\",\"Remark\":\"v和你们v吧\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:56:03');
INSERT INTO `sys_oper_log` VALUES ('103', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":2,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人士\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:57:28');
INSERT INTO `sys_oper_log` VALUES ('104', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":6,\"OldCircleName\":\"文人士大夫\",\"CateId\":2,\"CircleName\":\"文人\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5215115,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:58:35');
INSERT INTO `sys_oper_log` VALUES ('105', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":6,\"OldCircleName\":\"文人\",\"CateId\":2,\"CircleName\":\"啊士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 16:59:47');
INSERT INTO `sys_oper_log` VALUES ('106', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":6,\"OldCircleName\":\"啊士大夫\",\"CateId\":2,\"CircleName\":\"啊士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"7\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 17:33:45');
INSERT INTO `sys_oper_log` VALUES ('107', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":6,\"OldCircleName\":\"啊士大夫\",\"CateId\":2,\"CircleName\":\"啊士大夫\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5,\"JoinCount\":1515415415,\"CircleDesc\":\"手机电话费技术的\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"11\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 17:39:48');
INSERT INTO `sys_oper_log` VALUES ('108', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":5,\"OldCircleName\":\"车是啊速度\",\"CateId\":2,\"CircleName\":\"车是啊\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":100,\"JoinCount\":100,\"CircleDesc\":\"手动阀手动阀\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"从v不错v\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 17:40:29');
INSERT INTO `sys_oper_log` VALUES ('109', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":6,\"OldCircleName\":\"啊士大夫\",\"CateId\":2,\"CircleName\":\"啊士大夫吃饭v和\",\"JoinType\":\"3\",\"UserId\":2,\"PostCount\":5,\"JoinCount\":1515,\"CircleDesc\":\"手机\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zszfdfvs8oibwii9.png\",\"JoinValue\":\"721312\",\"Status\":\"0\",\"Remark\":\"撒旦开发\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 17:42:00');
INSERT INTO `sys_oper_log` VALUES ('110', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":5,\"OldCircleName\":\"车是啊速度\",\"CateId\":2,\"CircleName\":\"车是啊速度大\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":100,\"JoinCount\":100,\"CircleDesc\":\"手动阀阿斯顿\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"从v不错v\",\"UpdateBy\":\"admin\",\"UpdateTime\":\"2020-04-13 17:50:10\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 17:50:10');
INSERT INTO `sys_oper_log` VALUES ('111', '修改圈子', '2', '/api/v1/admin/circle/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/edit', '[::1]', '内网IP', '{\"CircleId\":5,\"OldCircleName\":\"车是啊速度大\",\"CateId\":2,\"CircleName\":\"车是啊\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":100,\"JoinCount\":100,\"CircleDesc\":\"手动阀阿斯顿\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"从v不错v\",\"UpdateBy\":\"admin\",\"UpdateTime\":\"2020-04-13 17:50:30\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 17:50:30');
INSERT INTO `sys_oper_log` VALUES ('112', '修改分类', '2', '/api/v1/admin/category/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/edit', '[::1]', '内网IP', '{\"CateId\":3,\"ParentId\":2,\"CateName\":\"豆腐0.0\",\"CateModule\":\"circle\",\"CateSlug\":\"doufu\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-11/c1y71zorut7sytqoyg.png\",\"CateSort\":12,\"CateKey\":\"豆腐\",\"CateDescription\":\"豆腐\",\"Status\":\"0\",\"Remark\":\"v和你们v吧\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:11:41');
INSERT INTO `sys_oper_log` VALUES ('113', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":1,\"CateName\":\"撒旦发射点\",\"CateModule\":\"circle\",\"CateSlug\":\"dsf\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-13/c2006nk5siv0hmt7w6.png\",\"CateSort\":5,\"CateKey\":\"sdfsd\",\"CateDescription\":\"sdfsdfs\",\"Status\":\"0\",\"Remark\":\"dfsdfsdf\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:21:30');
INSERT INTO `sys_oper_log` VALUES ('114', '删除分类', '3', '/api/v1/admin/category/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/remove', '[::1]', '内网IP', '[4]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:21:36');
INSERT INTO `sys_oper_log` VALUES ('115', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[4,1]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:29:51');
INSERT INTO `sys_oper_log` VALUES ('116', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"asdasd\",\"JoinType\":\"3\",\"UserId\":1,\"PostCount\":123,\"JoinCount\":123,\"CircleDesc\":\"123123\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"213\",\"Status\":\"0\",\"Remark\":\"123123\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:31:32');
INSERT INTO `sys_oper_log` VALUES ('117', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[7]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:31:38');
INSERT INTO `sys_oper_log` VALUES ('118', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[3]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:31:47');
INSERT INTO `sys_oper_log` VALUES ('119', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"测试圈子\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":156,\"JoinCount\":544,\"CircleDesc\":\"asdasda\",\"CircleImg\":\"\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"asdasd\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:32:51');
INSERT INTO `sys_oper_log` VALUES ('120', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"撒发生敢死队风格反对和史蒂芬\",\"JoinType\":\"1\",\"UserId\":2,\"PostCount\":12312,\"JoinCount\":312312,\"CircleDesc\":\"豆腐干豆腐干\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"豆腐干士大夫\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:33:10');
INSERT INTO `sys_oper_log` VALUES ('121', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[9]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:33:34');
INSERT INTO `sys_oper_log` VALUES ('122', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[8]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:33:44');
INSERT INTO `sys_oper_log` VALUES ('123', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"asdasd\",\"JoinType\":\"1\",\"UserId\":1,\"PostCount\":2162,\"JoinCount\":545,\"CircleDesc\":\"5445记号记号\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"\",\"Status\":\"0\",\"Remark\":\"1和国际化\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:35:39');
INSERT INTO `sys_oper_log` VALUES ('124', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"变几乎跟\",\"JoinType\":\"3\",\"UserId\":1,\"PostCount\":41554,\"JoinCount\":54455,\"CircleDesc\":\"21虎踞关\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"544\",\"Status\":\"0\",\"Remark\":\"环境规划\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:36:03');
INSERT INTO `sys_oper_log` VALUES ('125', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[11]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:36:28');
INSERT INTO `sys_oper_log` VALUES ('126', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[6,5]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:37:16');
INSERT INTO `sys_oper_log` VALUES ('127', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"对方是个\",\"JoinType\":\"3\",\"UserId\":1,\"PostCount\":3,\"JoinCount\":234,\"CircleDesc\":\"公司发的告诉对方\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"324\",\"Status\":\"0\",\"Remark\":\"给对方是个士大夫敢死队风格\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:39:37');
INSERT INTO `sys_oper_log` VALUES ('128', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[12]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:39:50');
INSERT INTO `sys_oper_log` VALUES ('129', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[10]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:49:08');
INSERT INTO `sys_oper_log` VALUES ('130', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"asdasd\",\"JoinType\":\"3\",\"UserId\":1,\"PostCount\":4,\"JoinCount\":5,\"CircleDesc\":\"撒打算\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"2\",\"Status\":\"0\",\"Remark\":\"啊实打实\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:50:16');
INSERT INTO `sys_oper_log` VALUES ('131', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":2,\"CircleName\":\"相当高v的风格\",\"JoinType\":\"3\",\"UserId\":1,\"PostCount\":2,\"JoinCount\":3,\"CircleDesc\":\"岁的法国撒旦\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"2\",\"Status\":\"1\",\"Remark\":\"士大夫撒旦\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:50:39');
INSERT INTO `sys_oper_log` VALUES ('132', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"非常想办法呢\",\"JoinType\":\"3\",\"UserId\":1,\"PostCount\":1231,\"JoinCount\":21,\"CircleDesc\":\"广泛受到法国\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":\"2\",\"Status\":\"1\",\"Remark\":\"打发时光的ff\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 18:50:54');
INSERT INTO `sys_oper_log` VALUES ('133', '删除圈子', '3', '/api/v1/admin/circle/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/remove', '[::1]', '内网IP', '[15]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-13 20:03:23');
INSERT INTO `sys_oper_log` VALUES ('134', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"用户组类型\",\"DictType\":\"sys_gruop_type\",\"Status\":\"0\",\"Remark\":\"用户组类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 00:01:15');
INSERT INTO `sys_oper_log` VALUES ('135', '字典类型修改', '2', '/api/v1/admin/dict/type/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/edit', '[::1]', '内网IP', '{\"DictId\":20,\"DictName\":\"用户组类型\",\"DictType\":\"sys_gruop_type1\",\"Status\":\"0\",\"Remark\":\"用户组类型列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 00:01:29');
INSERT INTO `sys_oper_log` VALUES ('136', '字典类型修改', '2', '/api/v1/admin/dict/type/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/edit', '[::1]', '内网IP', '{\"DictId\":20,\"DictName\":\"用户组类型\",\"DictType\":\"sys_gruop_type\",\"Status\":\"0\",\"Remark\":\"用户组类型列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 00:01:33');
INSERT INTO `sys_oper_log` VALUES ('137', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"普通用户\",\"DictValue\":\"general\",\"DictType\":\"sys_gruop_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"普通用户\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 00:03:20');
INSERT INTO `sys_oper_log` VALUES ('138', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"会员\",\"DictValue\":\"vip\",\"DictType\":\"sys_gruop_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"会员用户\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 00:03:50');
INSERT INTO `sys_oper_log` VALUES ('139', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":51,\"DictLabel\":\"普通\",\"DictValue\":\"general\",\"DictType\":\"sys_gruop_type\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"普通用户\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 00:03:56');
INSERT INTO `sys_oper_log` VALUES ('140', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"用户组权限\",\"DictType\":\"sys_gruop_auth\",\"Status\":\"0\",\"Remark\":\"用户组权限列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 01:06:54');
INSERT INTO `sys_oper_log` VALUES ('141', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"权限下载\",\"DictValue\":\"1\",\"DictType\":\"sys_gruop_auth\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"是否允许下载所有资源\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 15:18:47');
INSERT INTO `sys_oper_log` VALUES ('142', '字典类型修改', '2', '/api/v1/admin/dict/type/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/edit', '[::1]', '内网IP', '{\"DictId\":17,\"DictName\":\"系统模块\",\"DictType\":\"sys_modules\",\"Status\":\"0\",\"Remark\":\"系统模块列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 16:50:49');
INSERT INTO `sys_oper_log` VALUES ('143', '字典数据删除', '3', '/api/v1/admin/dict/data/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/remove', '[::1]', '内网IP', '[53]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 17:03:22');
INSERT INTO `sys_oper_log` VALUES ('144', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"积分\",\"DictValue\":\"1\",\"DictType\":\"sys_gruop_auth\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"积分开通\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 17:03:43');
INSERT INTO `sys_oper_log` VALUES ('145', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"付费\",\"DictValue\":\"2\",\"DictType\":\"sys_gruop_auth\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"付费开通\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 17:03:55');
INSERT INTO `sys_oper_log` VALUES ('146', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"游客\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"1\",\"OpenValue\":123,\"Validity\":123,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"士大夫士大夫敢死队\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:18:05\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:18:05');
INSERT INTO `sys_oper_log` VALUES ('147', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"游客\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":3123,\"OpenType\":\"1\",\"OpenValue\":1231,\"Validity\":12,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"手动阀手动阀\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:19:58\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:19:58');
INSERT INTO `sys_oper_log` VALUES ('148', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"游客\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"1\",\"OpenValue\":123,\"Validity\":123,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"1123\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:21:55\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:21:55');
INSERT INTO `sys_oper_log` VALUES ('149', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"sdasd\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":2312,\"OpenType\":\"1\",\"OpenValue\":21312,\"Validity\":53123,\"AuthModule\":\"resources,feed\",\"Status\":\"0\",\"Remark\":\"123dsfds\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:24:37\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 22:24:37');
INSERT INTO `sys_oper_log` VALUES ('150', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"岁的法国撒旦\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":12312,\"OpenType\":\"1\",\"OpenValue\":123123,\"Validity\":2131,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"进行处罚v就\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:28:24\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:28:24');
INSERT INTO `sys_oper_log` VALUES ('151', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"asda\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"1\",\"OpenValue\":123,\"Validity\":2131,\"AuthModule\":\"circle,feed\",\"Status\":\"0\",\"Remark\":\"dgvzxv \",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:31:00\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:31:00');
INSERT INTO `sys_oper_log` VALUES ('152', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"十三点\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"1\",\"OpenValue\":1212,\"Validity\":12,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"啊实打实 \",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:45:01\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:45:01');
INSERT INTO `sys_oper_log` VALUES ('153', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"阿松大\",\"GruopType\":\"vip\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":12312,\"OpenType\":\"1\",\"OpenValue\":123,\"Validity\":2131,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"上帝发誓\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:48:24\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:48:24');
INSERT INTO `sys_oper_log` VALUES ('154', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"阿松大\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":3123,\"OpenType\":\"1\",\"OpenValue\":21312,\"Validity\":213,\"AuthModule\":\"circle,resources\",\"Status\":\"1\",\"Remark\":\"是的发展史\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 22:53:27\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 22:53:27');
INSERT INTO `sys_oper_log` VALUES ('155', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"阿松大\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":12312,\"OpenType\":\"1\",\"OpenValue\":123,\"Validity\":21312,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"是打发打发\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 23:08:05\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 23:08:05');
INSERT INTO `sys_oper_log` VALUES ('156', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"的分公司\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":12312,\"OpenType\":\"1\",\"OpenValue\":12312,\"Validity\":23123,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"123123\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 23:13:53\"}', '{\"code\":-19,\"message\":\"记录未找到\"}', '1', '', '2020-04-14 23:13:53');
INSERT INTO `sys_oper_log` VALUES ('157', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"该飞机飞过\",\"JoinType\":\"-1\",\"UserId\":1,\"PostCount\":231,\"JoinCount\":2312,\"CircleDesc\":\"撒地方\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":0,\"Status\":\"0\",\"Remark\":\"是打发打发\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 23:22:19\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-14 23:22:19');
INSERT INTO `sys_oper_log` VALUES ('158', '圈子增加', '1', '/api/v1/admin/circle/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/circle/create', '[::1]', '内网IP', '{\"CateId\":1,\"CircleName\":\"发达的\",\"JoinType\":\"1\",\"UserId\":1,\"PostCount\":123,\"JoinCount\":12312,\"CircleDesc\":\"打发时光的是法国\",\"CircleImg\":\"http://localhost:8199/static/uploads/2020-04-13/c1zdtb01aik0yvtq85.png\",\"JoinValue\":0,\"Status\":\"0\",\"Remark\":\"岁的法国撒旦\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 23:24:01\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 23:24:01');
INSERT INTO `sys_oper_log` VALUES ('159', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"现在发生的\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":32423,\"OpenType\":\"1\",\"OpenValue\":213421,\"Validity\":342,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"豆腐干岁的法国\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-14 23:25:14\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-14 23:25:14');
INSERT INTO `sys_oper_log` VALUES ('160', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"现场v在\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-15/c212n3ule6ow9ojss5.png\",\"DownTimes\":12312,\"OpenType\":\"2\",\"OpenValue\":123,\"Validity\":213,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"士大夫嘎斯的\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-15 00:29:49\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 00:29:49');
INSERT INTO `sys_oper_log` VALUES ('161', '用户组添加', '1', '/api/v1/admin/gruop/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/create', '[::1]', '内网IP', '{\"GruopName\":\"将很快\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"2\",\"OpenValue\":32,\"Validity\":213,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"规划局法规和\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-15 11:49:42\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 11:49:42');
INSERT INTO `sys_oper_log` VALUES ('162', '修改圈子', '2', '/api/v1/admin/gruop/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/edit', '[::1]', '内网IP', '{\"GruopId\":3,\"OldName\":\"将很快\",\"GruopName\":\"将很快\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"2\",\"OpenValue\":32.55,\"Validity\":213,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"规划局法规和\",\"UpdateBy\":\"admin\",\"UpdateTime\":\"2020-04-15 11:57:29\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 11:57:29');
INSERT INTO `sys_oper_log` VALUES ('163', '修改圈子', '2', '/api/v1/admin/gruop/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/edit', '[::1]', '内网IP', '{\"GruopId\":3,\"OldName\":\"将很快\",\"GruopName\":\"将很快\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"2\",\"OpenValue\":32.55,\"Validity\":213,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"规划局法规和\",\"UpdateBy\":\"admin\",\"UpdateTime\":\"2020-04-15 12:00:52\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:00:52');
INSERT INTO `sys_oper_log` VALUES ('164', '修改圈子', '2', '/api/v1/admin/gruop/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/edit', '[::1]', '内网IP', '{\"GruopId\":3,\"OldName\":\"将很快\",\"GruopName\":\"将很快\",\"GruopType\":\"general\",\"GruopImg\":\"http://localhost:8199/static/uploads/2020-04-14/c20xn9z9tlx4uukkfy.png\",\"DownTimes\":123,\"OpenType\":\"2\",\"OpenValue\":32.55,\"Validity\":213,\"AuthModule\":\"circle,resources\",\"Status\":\"0\",\"Remark\":\"规划局法规和\",\"UpdateBy\":\"admin\",\"UpdateTime\":\"2020-04-15 12:01:01\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:01:01');
INSERT INTO `sys_oper_log` VALUES ('165', '删除用户组', '3', '/api/v1/admin/gruop/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/remove', '[::1]', '内网IP', '[3]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:04:18');
INSERT INTO `sys_oper_log` VALUES ('166', '删除用户组', '3', '/api/v1/admin/gruop/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/remove', '[::1]', '内网IP', '[2]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:04:48');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"标签列表\",\"OrderNum\":10,\"Path\":\"tag/lisst\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"tag:lisst\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:41:27');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1074,\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"标签列表\",\"OrderNum\":10,\"Path\":\"tag/lisst\",\"Icon\":\"\",\"IsFrame\":1,\"Perms\":\"tag:lisst\",\"Visible\":\"0\",\"Component\":\"TagList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:45:46');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1074,\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"标签列表\",\"OrderNum\":10,\"Path\":\"tag/lisst\",\"Icon\":\"tags\",\"IsFrame\":1,\"Perms\":\"tag:lisst\",\"Visible\":\"0\",\"Component\":\"TagList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 12:46:32');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1074,\"ParentId\":1069,\"MenuType\":\"C\",\"MenuName\":\"标签列表\",\"OrderNum\":10,\"Path\":\"tag/list\",\"Icon\":\"tags\",\"IsFrame\":1,\"Perms\":\"tag:list\",\"Visible\":\"0\",\"Component\":\"TagList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-15 17:50:30');
INSERT INTO `sys_oper_log` VALUES ('171', '设置推荐标签', '3', '/api/v1/admin/tag/toHot', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/toHot', '[::1]', '内网IP', '[2,1]', '{\"code\":-20,\"message\":\"删除失败\"}', '1', '', '2020-04-16 17:34:58');
INSERT INTO `sys_oper_log` VALUES ('172', '设置推荐标签', '3', '/api/v1/admin/tag/toHot', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/toHot', '[::1]', '内网IP', '[2,1]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 17:36:05');
INSERT INTO `sys_oper_log` VALUES ('173', '设置推荐标签', '3', '/api/v1/admin/tag/toHot', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/toHot', '[::1]', '内网IP', '{\"IsHot\":\"1\",\"TagId\":2}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:43:56');
INSERT INTO `sys_oper_log` VALUES ('174', '设置推荐标签', '3', '/api/v1/admin/tag/toHot', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/toHot', '[::1]', '内网IP', '{\"IsHot\":\"0\",\"TagId\":1}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:44:16');
INSERT INTO `sys_oper_log` VALUES ('175', '设置推荐标签', '3', '/api/v1/admin/tag/toHot', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/toHot', '[::1]', '内网IP', '{\"IsHot\":\"1\",\"TagId\":1}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:44:17');
INSERT INTO `sys_oper_log` VALUES ('176', '设置推荐标签', '3', '/api/v1/admin/tag/toHot', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/toHot', '[::1]', '内网IP', '{\"IsHot\":\"0\",\"TagId\":2}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:44:35');
INSERT INTO `sys_oper_log` VALUES ('177', '删除用户组', '3', '/api/v1/admin/gruop/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/remove', '[::1]', '内网IP', '[2]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:49:42');
INSERT INTO `sys_oper_log` VALUES ('178', '删除用户组', '3', '/api/v1/admin/gruop/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/remove', '[::1]', '内网IP', '[2]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:50:21');
INSERT INTO `sys_oper_log` VALUES ('179', '删除用户组', '3', '/api/v1/admin/gruop/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/gruop/remove', '[::1]', '内网IP', '[2]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:51:36');
INSERT INTO `sys_oper_log` VALUES ('180', '删除标签', '3', '/api/v1/admin/tag/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/tag/remove', '[::1]', '内网IP', '[2]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 18:52:44');
INSERT INTO `sys_oper_log` VALUES ('181', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"resources\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 19:13:32');
INSERT INTO `sys_oper_log` VALUES ('182', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"resources:list\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 19:16:08');
INSERT INTO `sys_oper_log` VALUES ('183', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"resources:list\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 20:50:01');
INSERT INTO `sys_oper_log` VALUES ('184', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1075,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:02:58');
INSERT INTO `sys_oper_log` VALUES ('185', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"resources/list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"resources:list\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:03:20');
INSERT INTO `sys_oper_log` VALUES ('186', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1075,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"resources\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:03:42');
INSERT INTO `sys_oper_log` VALUES ('187', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"/list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"resources:list\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:03:52');
INSERT INTO `sys_oper_log` VALUES ('188', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1075,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"resources\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:04:30');
INSERT INTO `sys_oper_log` VALUES ('189', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"resources:list\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:04:37');
INSERT INTO `sys_oper_log` VALUES ('190', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"resources:list\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:05:29');
INSERT INTO `sys_oper_log` VALUES ('191', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:07:21');
INSERT INTO `sys_oper_log` VALUES ('192', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"res/list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:12:17');
INSERT INTO `sys_oper_log` VALUES ('193', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:13:19');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"res/list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:14:13');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:14:40');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1075,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"/resources\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:30:05');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"/list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:30:14');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1075,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"resources\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:31:48');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:50:25');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1075,\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"资源管理\",\"OrderNum\":10,\"Path\":\"res\",\"Icon\":\"file\",\"IsFrame\":1,\"Perms\":\"\",\"Visible\":\"0\",\"Component\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:52:17');
INSERT INTO `sys_oper_log` VALUES ('201', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1076,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"资源列表\",\"OrderNum\":10,\"Path\":\"list\",\"Icon\":\"bars\",\"IsFrame\":1,\"Perms\":\"res:list\",\"Visible\":\"0\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 21:53:31');
INSERT INTO `sys_oper_log` VALUES ('202', '菜单添加', '1', '/api/v1/admin/menu/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/create', '[::1]', '内网IP', '{\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"创建资源\",\"OrderNum\":10,\"Path\":\"create\",\"Icon\":\"file-add\",\"IsFrame\":1,\"Perms\":\"res:create\",\"Visible\":\"1\",\"Component\":\"ResourcesList\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 22:21:11');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单修改', '2', '/api/v1/admin/menu/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/menu/edit', '[::1]', '内网IP', '{\"MenuId\":1077,\"ParentId\":1075,\"MenuType\":\"C\",\"MenuName\":\"创建资源\",\"OrderNum\":10,\"Path\":\"create\",\"Icon\":\"file-add\",\"IsFrame\":1,\"Perms\":\"res:create\",\"Visible\":\"1\",\"Component\":\"ResourcesAdd\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-16 22:23:34');
INSERT INTO `sys_oper_log` VALUES ('204', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"资源类型\",\"DictType\":\"sys_res_type\",\"Status\":\"0\",\"Remark\":\"资源类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-18 15:38:23');
INSERT INTO `sys_oper_log` VALUES ('205', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"图片\",\"DictValue\":\"img\",\"DictType\":\"sys_res_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"图片 类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-18 15:39:16');
INSERT INTO `sys_oper_log` VALUES ('206', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"音频\",\"DictValue\":\"music\",\"DictType\":\"sys_res_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"音频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-18 15:39:33');
INSERT INTO `sys_oper_log` VALUES ('207', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"视频\",\"DictValue\":\"media\",\"DictType\":\"sys_res_type\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"视频类型\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-18 15:39:49');
INSERT INTO `sys_oper_log` VALUES ('208', '字典类型修改', '2', '/api/v1/admin/dict/type/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/edit', '[::1]', '内网IP', '{\"DictId\":22,\"DictName\":\"资源类型\",\"DictType\":\"sys_res_type1\",\"Status\":\"0\",\"Remark\":\"资源类型列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-18 15:42:39');
INSERT INTO `sys_oper_log` VALUES ('209', '字典类型修改', '2', '/api/v1/admin/dict/type/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/edit', '[::1]', '内网IP', '{\"DictId\":22,\"DictName\":\"资源类型\",\"DictType\":\"sys_res_type\",\"Status\":\"0\",\"Remark\":\"资源类型列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-18 15:42:43');
INSERT INTO `sys_oper_log` VALUES ('210', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":0,\"CateName\":\"测试分类\",\"CateModule\":\"resources\",\"CateSlug\":\"asdz\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-19/c258qzrurltscexvbl.png\",\"CateSort\":1,\"CateKey\":\"测试\",\"CateDescription\":\"撒旦发生\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:07:34');
INSERT INTO `sys_oper_log` VALUES ('211', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":4,\"CateName\":\"小测试\",\"CateModule\":\"resources\",\"CateSlug\":\"sas\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-19/c258rb6b0yrwxzfhuy.png\",\"CateSort\":0,\"CateKey\":\"fdgssa\",\"CateDescription\":\"asdasdas\",\"Status\":\"0\",\"Remark\":\"fsadfasdas\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:07:58');
INSERT INTO `sys_oper_log` VALUES ('212', '分类增加', '1', '/api/v1/admin/category/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/category/create', '[::1]', '内网IP', '{\"ParentId\":0,\"CateName\":\"阿松大阿萨的\",\"CateModule\":\"resources\",\"CateSlug\":\"sdfasdasd\",\"CateImg\":\"http://localhost:8199/static/uploads/2020-04-19/c258ro4i6ckwl8osi3.png\",\"CateSort\":1,\"CateKey\":\"fgsd\",\"CateDescription\":\"dfg\",\"Status\":\"0\",\"Remark\":\"dfgd\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:08:25');
INSERT INTO `sys_oper_log` VALUES ('213', '字典类型创建', '1', '/api/v1/admin/dict/type/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/type/create', '[::1]', '内网IP', '{\"DictName\":\"资源下载权限\",\"DictType\":\"sys_res_auth\",\"Status\":\"0\",\"Remark\":\"资源下载权限列表\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:42:33');
INSERT INTO `sys_oper_log` VALUES ('214', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"无限制\",\"DictValue\":\"-1\",\"DictType\":\"sys_res_auth\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"无限制加入\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:43:37');
INSERT INTO `sys_oper_log` VALUES ('215', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"付费下载\",\"DictValue\":\"1\",\"DictType\":\"sys_res_auth\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"付费下载\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:43:51');
INSERT INTO `sys_oper_log` VALUES ('216', '字典数据创建', '1', '/api/v1/admin/dict/data/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/create', '[::1]', '内网IP', '{\"DictLabel\":\"积分\",\"DictValue\":\"2\",\"DictType\":\"sys_res_auth\",\"DictSort\":99,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"积分下载\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:44:05');
INSERT INTO `sys_oper_log` VALUES ('217', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":60,\"DictLabel\":\"付费\",\"DictValue\":\"1\",\"DictType\":\"sys_res_auth\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"付费下载\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:44:08');
INSERT INTO `sys_oper_log` VALUES ('218', '字典数据删除', '3', '/api/v1/admin/dict/data/remove', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/remove', '[::1]', '内网IP', '[61]', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 22:48:25');
INSERT INTO `sys_oper_log` VALUES ('219', '字典数据修改', '2', '/api/v1/admin/dict/data/edit', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":44,\"DictLabel\":\"资源\",\"DictValue\":\"resource\",\"DictType\":\"sys_modules\",\"DictSort\":0,\"CssClass\":\"\",\"ListClass\":\"\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"资源模块\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-19 23:01:01');
INSERT INTO `sys_oper_log` VALUES ('220', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":13,\"ResourceType\":\"music\",\"ResourceTitle\":\"的身份噶地方\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":[],\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"\",\"Status\":\"\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 00:15:52\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 00:15:52');
INSERT INTO `sys_oper_log` VALUES ('221', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":2,\"ResourceType\":\"music\",\"ResourceTitle\":\"阿斯顿发生\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":[],\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"\",\"Status\":\"\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 00:16:47\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-21 00:16:47');
INSERT INTO `sys_oper_log` VALUES ('222', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":2,\"ResourceType\":\"music\",\"ResourceTitle\":\"会尽快恢复\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":[],\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"\",\"Status\":\"\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 00:17:26\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 00:17:26');
INSERT INTO `sys_oper_log` VALUES ('223', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":4,\"CircleId\":13,\"ResourceType\":\"img\",\"ResourceTitle\":\"阿松大S\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":\"[]\",\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[\"[]\"],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"\",\"Status\":\"\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 00:21:23\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 00:21:23');
INSERT INTO `sys_oper_log` VALUES ('224', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":13,\"ResourceType\":\"music\",\"ResourceTitle\":\"地方撒给\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"http://localhost:8199/static/uploads/2020-04-21/c26698iatvp4zrbozc.png\",\"Customs\":\"[{\\\"key\\\":\\\"aDFas \\\",\\\"value\\\":\\\"asdfASDAs\\\"},{\\\"key\\\":\\\"sdafsdf\\\",\\\"value\\\":\\\"dsawqasd\\\"}]\",\"Demo\":\"[\\\"http://localhost:8199/static/uploads/2020-04-21/c266976vtbq0sordyf.png\\\"]\",\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[\"[\\\"史蒂夫噶\\\",\\\"a阿斯弗\\\"]\"],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"0\",\"Status\":\"0\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 00:23:28\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 00:23:28');
INSERT INTO `sys_oper_log` VALUES ('225', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":4,\"CircleId\":2,\"ResourceType\":\"music\",\"ResourceTitle\":\"阿松大\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":\"[]\",\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[\"[\\\"史蒂夫噶\\\",\\\"阿松大\\\"]\"],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"0\",\"Status\":\"0\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 01:00:28\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 01:00:28');
INSERT INTO `sys_oper_log` VALUES ('226', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":13,\"ResourceType\":\"music\",\"ResourceTitle\":\"阿松大撒地方\",\"Auth\":\"1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":\"[]\",\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[\"史蒂夫噶\",\"规划局法规\"],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"0\",\"Status\":\"0\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 01:02:16\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 01:02:16');
INSERT INTO `sys_oper_log` VALUES ('227', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":2,\"ResourceType\":\"media\",\"ResourceTitle\":\"发的嘎这地方\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":\"[]\",\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[\"史蒂夫噶\",\"撒旦发生\",\"a阿斯弗\"],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"0\",\"Status\":\"0\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 01:20:21\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 01:20:21');
INSERT INTO `sys_oper_log` VALUES ('228', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":4,\"CircleId\":13,\"ResourceType\":\"img\",\"ResourceTitle\":\"阿松大风格的和法规和\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"\",\"Customs\":\"[]\",\"Demo\":\"[]\",\"ResourceDesc\":\"\",\"DownAddress\":\"\",\"DownPass\":\"\",\"DownGet\":\"\",\"ResourceTag\":[\"史蒂夫噶\",\"sdf\",\"wqe\"],\"Price\":0,\"Likes\":0,\"Views\":0,\"Collects\":0,\"IsHot\":\"0\",\"Status\":\"0\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 01:23:20\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 01:23:20');
INSERT INTO `sys_oper_log` VALUES ('229', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":13,\"ResourceType\":\"music\",\"ResourceTitle\":\"啊实打实\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"http://localhost:8199/static/uploads/2020-04-21/c267pvy8gir40uuolw.png\",\"Customs\":\"[]\",\"Demo\":\"[\\\"http://localhost:8199/static/uploads/2020-04-21/c267pu8s43ogcfcwfg.png\\\"]\",\"ResourceDesc\":\"撒旦发射点发射点\",\"DownAddress\":\"啊实打实\",\"DownPass\":\"asdd\",\"DownGet\":\"sdf\",\"ResourceTag\":[\"sdafsad\",\"h和法规和\",\"sdf\"],\"Price\":0,\"Likes\":2131,\"Views\":231,\"Collects\":1231,\"IsHot\":\"true\",\"Status\":\"1\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 01:32:27\"}', '{\"code\":-21,\"message\":\"添加记录失败\"}', '1', '', '2020-04-21 01:32:27');
INSERT INTO `sys_oper_log` VALUES ('230', '岗位创建', '1', '/api/v1/admin/resource/create', 'POST', '1', 'admin', '研发部门', '/api/v1/admin/resource/create', '[::1]', '内网IP', '{\"CateId\":6,\"CircleId\":13,\"ResourceType\":\"img\",\"ResourceTitle\":\"搞定撒分公司\",\"Auth\":\"-1\",\"UserId\":1,\"Cover\":\"http://localhost:8199/static/uploads/2020-04-21/c267rtzl4ntkzcgwdt.png\",\"Customs\":\"[]\",\"Demo\":\"[\\\"http://localhost:8199/static/uploads/2020-04-21/c267rsnaby3wu5pvy1.png\\\"]\",\"ResourceDesc\":\"都发嘎嘎\",\"DownAddress\":\"ddfg\",\"DownPass\":\"sdf\",\"DownGet\":\"sadf\",\"ResourceTag\":[\"suio\",\"wqer\",\"ghs\"],\"Price\":0,\"Likes\":123,\"Views\":123,\"Collects\":213,\"IsHot\":\"1\",\"Status\":\"1\",\"CreateBy\":\"admin\",\"CreateTime\":\"2020-04-21 01:34:45\"}', '{\"code\":1,\"message\":\"操作成功\"}', '0', '', '2020-04-21 01:34:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('8', 'vs', '测试岗位', '3', '1', 'admin', '2020-03-19 21:28:21', 'admin', '2020-03-21 10:48:26', '吃撒');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_title` varchar(50) DEFAULT NULL COMMENT '资源标题',
  `resource_type` char(50) DEFAULT NULL COMMENT '资源类型',
  `user_id` bigint(20) DEFAULT NULL COMMENT '发布用户',
  `cate_id` bigint(20) DEFAULT NULL COMMENT '资源分类',
  `circle_id` bigint(20) DEFAULT NULL COMMENT '所属圈子',
  `down_address` varchar(255) DEFAULT NULL COMMENT '下载地址',
  `down_pass` varchar(50) DEFAULT NULL COMMENT '网盘密码',
  `down_get` varchar(50) DEFAULT NULL COMMENT '提取码',
  `auth` char(50) DEFAULT NULL COMMENT '获取权限',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `demo` varchar(500) DEFAULT NULL COMMENT '演示文件',
  `customs` varchar(500) DEFAULT NULL COMMENT '自定义属性',
  `status` char(1) DEFAULT '1' COMMENT '状态0正常，1未审核 ，2 草稿，3禁用',
  `is_hot` char(1) DEFAULT '0' COMMENT '推荐0为不推荐 1推荐',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `resource_desc` varchar(255) DEFAULT NULL COMMENT '介绍',
  `likes` bigint(10) DEFAULT '0' COMMENT '点赞数',
  `views` bigint(10) DEFAULT '0' COMMENT '阅读数',
  `collects` bigint(10) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('3', '阿松大S', 'img', '1', '4', '13', '', '', '', '-1', '0.00', '', '[]', '[]', '', '', 'admin', '2020-04-21 00:21:23', '', null, '', '0', '0', '0');
INSERT INTO `sys_resource` VALUES ('4', '地方撒给', 'music', '1', '6', '13', '', '', '', '-1', '0.00', 'http://localhost:8199/static/uploads/2020-04-21/c26698iatvp4zrbozc.png', '[\"http://localhost:8199/static/uploads/2020-04-21/c266976vtbq0sordyf.png\"]', '[{\"key\":\"aDFas \",\"value\":\"asdfASDAs\"},{\"key\":\"sdafsdf\",\"value\":\"dsawqasd\"}]', '0', '0', 'admin', '2020-04-21 00:23:28', '', null, '', '0', '0', '0');
INSERT INTO `sys_resource` VALUES ('5', '阿松大', 'music', '1', '4', '2', '', '', '', '-1', '0.00', '', '[]', '[]', '0', '0', 'admin', '2020-04-21 01:00:28', '', null, '', '0', '0', '0');
INSERT INTO `sys_resource` VALUES ('6', '阿松大撒地方', 'music', '1', '6', '13', '', '', '', '1', '0.00', '', '[]', '[]', '0', '0', 'admin', '2020-04-21 01:02:16', '', null, '', '0', '0', '0');
INSERT INTO `sys_resource` VALUES ('7', '发的嘎这地方', 'media', '1', '6', '2', '', '', '', '-1', '0.00', '', '[]', '[]', '0', '0', 'admin', '2020-04-21 01:20:21', '', null, '', '0', '0', '0');
INSERT INTO `sys_resource` VALUES ('8', '阿松大风格的和法规和', 'img', '1', '4', '13', '', '', '', '-1', '0.00', '', '[]', '[]', '0', '0', 'admin', '2020-04-21 01:23:20', '', null, '', '0', '0', '0');
INSERT INTO `sys_resource` VALUES ('9', '搞定撒分公司', 'img', '1', '6', '13', 'ddfg', 'sdf', 'sadf', '-1', '0.00', 'http://localhost:8199/static/uploads/2020-04-21/c267rtzl4ntkzcgwdt.png', '[\"http://localhost:8199/static/uploads/2020-04-21/c267rsnaby3wu5pvy1.png\"]', '[]', '1', '1', 'admin', '2020-04-21 01:34:45', '', null, '都发嘎嘎', '123', '123', '213');

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
-- Table structure for sys_tag
-- ----------------------------
DROP TABLE IF EXISTS `sys_tag`;
CREATE TABLE `sys_tag` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `tag_module` varchar(50) DEFAULT NULL COMMENT '所属模块',
  `is_hot` char(1) DEFAULT NULL COMMENT '是否为推荐标签(0 为 否，1为 是)',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_tag
-- ----------------------------
INSERT INTO `sys_tag` VALUES ('1', '测试标签', 'feed', '1', 'admin', '2020-04-15 17:58:12', null, null);
INSERT INTO `sys_tag` VALUES ('4', '史蒂夫噶', 'resource', '1', 'admin', '2020-04-19 23:00:35', null, null);
INSERT INTO `sys_tag` VALUES ('5', 'a阿斯弗', 'resource', '1', 'admin', '2020-04-19 23:01:49', null, null);
INSERT INTO `sys_tag` VALUES ('9', '撒旦发生', 'resource', '', 'admin', '2020-04-21 01:20:21', '', null);
INSERT INTO `sys_tag` VALUES ('10', 'sdf', 'resource', '', 'admin', '2020-04-21 01:23:20', '', null);
INSERT INTO `sys_tag` VALUES ('11', 'wqe', 'resource', '', 'admin', '2020-04-21 01:23:20', '', null);
INSERT INTO `sys_tag` VALUES ('12', 'suio', 'resource', '', 'admin', '2020-04-21 01:34:45', '', null);
INSERT INTO `sys_tag` VALUES ('13', 'wqer', 'resource', '', 'admin', '2020-04-21 01:34:45', '', null);
INSERT INTO `sys_tag` VALUES ('14', 'ghs', 'resource', '', 'admin', '2020-04-21 01:34:45', '', null);

-- ----------------------------
-- Table structure for sys_tag_related
-- ----------------------------
DROP TABLE IF EXISTS `sys_tag_related`;
CREATE TABLE `sys_tag_related` (
  `tag_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tag_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_tag_related
-- ----------------------------
INSERT INTO `sys_tag_related` VALUES ('4', '7');
INSERT INTO `sys_tag_related` VALUES ('4', '8');
INSERT INTO `sys_tag_related` VALUES ('5', '7');
INSERT INTO `sys_tag_related` VALUES ('9', '7');
INSERT INTO `sys_tag_related` VALUES ('10', '8');
INSERT INTO `sys_tag_related` VALUES ('11', '8');
INSERT INTO `sys_tag_related` VALUES ('12', '9');
INSERT INTO `sys_tag_related` VALUES ('13', '9');
INSERT INTO `sys_tag_related` VALUES ('14', '9');

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
INSERT INTO `sys_user` VALUES ('1', '103', '0', 'admin', '新约谈', '00', 'ry@163.com', '15888888888', '1', '', 'f9609cd9db1529ddb375c7b7f3792e23', 'KavObw', '1', '0', '[::1]', '2020-04-20 22:27:49', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
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
