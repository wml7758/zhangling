/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : xscj_database

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2015-04-26 00:44:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bj
-- ----------------------------
DROP TABLE IF EXISTS `bj`;
CREATE TABLE `bj` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bh` varchar(50) DEFAULT NULL COMMENT '编号',
  `bjm` varchar(50) DEFAULT NULL COMMENT '班级名',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bj
-- ----------------------------
INSERT INTO `bj` VALUES ('16', '01', '计算机(1)');
INSERT INTO `bj` VALUES ('17', '02', '计算机(2)');
INSERT INTO `bj` VALUES ('18', '03', '计算机(3)');
INSERT INTO `bj` VALUES ('19', '04', '软件(1)');
INSERT INTO `bj` VALUES ('20', '05', '软件(2)');
INSERT INTO `bj` VALUES ('21', '06', '计算机(4)');
INSERT INTO `bj` VALUES ('22', '10', '软件3班');

-- ----------------------------
-- Table structure for cj
-- ----------------------------
DROP TABLE IF EXISTS `cj`;
CREATE TABLE `cj` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `xh` varchar(50) DEFAULT NULL COMMENT '学号',
  `xm` varchar(50) DEFAULT NULL COMMENT '姓名',
  `kcm` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `cj` varchar(50) DEFAULT NULL COMMENT '成绩',
  `nf` varchar(50) DEFAULT NULL COMMENT '年份',
  `xq` varchar(50) DEFAULT NULL COMMENT '学期',
  `lb` varchar(50) DEFAULT NULL COMMENT '成绩类别',
  `bj` varchar(50) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cj
-- ----------------------------
INSERT INTO `cj` VALUES ('433', 'xs1234', 'ssss', 'DOS操作系统', '98', '2015', '上学期', '期中', '计算机(2)');
INSERT INTO `cj` VALUES ('434', 'B001', '张明', 'DOS操作系统', '67', '2015', '上学期', '期中', '计算机(2)');
INSERT INTO `cj` VALUES ('435', 'B002', '李林', 'DOS操作系统', '88', '2015', '上学期', '期中', '计算机(2)');
INSERT INTO `cj` VALUES ('436', 'B003', '张三', 'DOS操作系统', '56', '2015', '上学期', '期中', '计算机(2)');
INSERT INTO `cj` VALUES ('437', 'B004', '李四', 'DOS操作系统', '78', '2015', '上学期', '期中', '计算机(2)');
INSERT INTO `cj` VALUES ('438', 'A001', '张好', 'DOS操作系统', '99', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('439', 'A002', '李领导', 'DOS操作系统', '67', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('440', 'A003', '张大案', 'DOS操作系统', '88', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('441', 'A004', '李红', '-', 'DOS操作系统', '-', '上学期', '期中', '-');
INSERT INTO `cj` VALUES ('442', 'A001', '张好', 'asp编程', '98', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('443', 'A002', '李领导', 'asp编程', '100', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('444', 'A003', '张大案', 'asp编程', '78', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('445', 'A004', '李红', 'asp编程', '67', '2015', '上学期', '期中', '计算机(1)');
INSERT INTO `cj` VALUES ('446', '2010001', '王菲', 'J2EE开发', '95', '2015', '上学期', '期中', '软件3班');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `homeworkid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `starttime` varchar(50) DEFAULT NULL,
  `endtime` varchar(50) DEFAULT NULL,
  `notice` longtext,
  `fj` varchar(50) DEFAULT NULL,
  `klassid` varchar(50) DEFAULT NULL,
  `teacherid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`homeworkid`),
  KEY `homeworkid` (`homeworkid`),
  KEY `klassid` (`klassid`),
  KEY `teacherid` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', 'asp jsp技术资料', '2015-05-03 ', '2010-05-19 ', 'hhhhhhhhhhhhhhhhhhh\r\nhhhhhhhhhhhhhhhhhhhhhh', '2015-5-3-20-51-0.txt', '-', '李红');
INSERT INTO `homework` VALUES ('2', 'eeeeeeeeeeeeeeee', '2015-05-03 ', '2010-05-12 ', 'fffffffffffffffffffff\r\nffffffffffffffffff', '-', '计算机(1)', '李红');
INSERT INTO `homework` VALUES ('3', 'java作业', '2015-05-04 ', '2010-05-07 ', 'ssssssssssssssssssssssssssssssss', '2015-5-4-8-37-0.txt', '计算机(1)', '诚平');
INSERT INTO `homework` VALUES ('4', 'sssssssssssssssssssssssss', '2015-05-04 ', '2010-05-14 ', 'dddddddddddddddddddddd\r\nddddddddddddddddddddd', '2015-5-4-9-16-0.txt', '计算机(4)', '李红');

-- ----------------------------
-- Table structure for kc
-- ----------------------------
DROP TABLE IF EXISTS `kc`;
CREATE TABLE `kc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `kch` varchar(50) DEFAULT NULL,
  `kcbj` varchar(50) DEFAULT NULL,
  `rkjs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of kc
-- ----------------------------
INSERT INTO `kc` VALUES ('33', 'DOS操作系统', '计算机(1)', '李红');
INSERT INTO `kc` VALUES ('34', '数据库原理', '计算机(1)', '张立');
INSERT INTO `kc` VALUES ('35', 'asp编程', '计算机(1)', '林亮');
INSERT INTO `kc` VALUES ('36', 'C++与编程技术', '计算机(1)', '陈龙');
INSERT INTO `kc` VALUES ('37', '算法及数据库', '计算机(1)', '李红');
INSERT INTO `kc` VALUES ('38', 'DOS操作系统', '计算机(1)', '李红');
INSERT INTO `kc` VALUES ('39', 'J2EE开发', '软件3班', '王玲');

-- ----------------------------
-- Table structure for kcpz
-- ----------------------------
DROP TABLE IF EXISTS `kcpz`;
CREATE TABLE `kcpz` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bh` varchar(50) DEFAULT NULL COMMENT '课程编号',
  `kcm` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `xf` varchar(50) DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of kcpz
-- ----------------------------
INSERT INTO `kcpz` VALUES ('10', '01', 'DOS操作系统', '10');
INSERT INTO `kcpz` VALUES ('11', '02', '数据库原理', '10');
INSERT INTO `kcpz` VALUES ('12', '03', 'asp编程', '10');
INSERT INTO `kcpz` VALUES ('13', '04', 'C++与编程技术', '10');
INSERT INTO `kcpz` VALUES ('14', '05', '网络基础', '10');
INSERT INTO `kcpz` VALUES ('15', '06', '算法及数据库', '8');
INSERT INTO `kcpz` VALUES ('16', '07', 'java开发', '10');
INSERT INTO `kcpz` VALUES ('17', '08', 'basic基础', '10');
INSERT INTO `kcpz` VALUES ('18', '11', 'J2EE开发', '4');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `xh` varchar(50) DEFAULT NULL COMMENT '学号',
  `bj` varchar(50) DEFAULT NULL COMMENT '班级',
  `xm` varchar(50) DEFAULT NULL COMMENT '姓名',
  `xb` varchar(50) DEFAULT NULL COMMENT '性别',
  `mz` varchar(50) DEFAULT NULL COMMENT '民族',
  `jg` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `zzmm` varchar(50) DEFAULT NULL COMMENT '政治面貌',
  `csny` varchar(50) DEFAULT NULL COMMENT '出生年月',
  `rxrq` varchar(50) DEFAULT NULL COMMENT '入学日期',
  `jzxm` varchar(50) DEFAULT NULL COMMENT '家长姓名',
  `lxdh` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `jtzz` varchar(50) DEFAULT NULL COMMENT '家庭住址',
  `zt` varchar(50) DEFAULT NULL COMMENT '是否毕业',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'A001', '计算机(1)', '张好', '女', '男', '福州', 'OK', '1998年', '2015年', '成龙', '13135654444', '福州市', '-');
INSERT INTO `student` VALUES ('2', 'A002', '计算机(1)', '李领导', '汉', '女', '福州', 'OK', '1998年', '2015年', '林好', 's812345677', '福州市', '-');
INSERT INTO `student` VALUES ('3', 'A003', '计算机(1)', '张大案', '汉', '男', '福州', 'OK', '1998年', '2015年', '张了', 's138xxxxxx', '福州市', '-');
INSERT INTO `student` VALUES ('4', 'A004', '计算机(1)', '李红', '汉', '男', '福州', 'OK', '1998年', '2015年', '陈很', 's139344444', '福州市', '-');
INSERT INTO `student` VALUES ('5', '2015002', '计算机(1)', '李常委', '男', '汉', '河南', '党员', '1998年', '2015年', null, '13888888888', null, null);
INSERT INTO `student` VALUES ('6', 'A011', '计算机(1)', '王伟', '汉', '男', '福州', '团员', '1998年', '2015年', '王工', '021-85698956', '福州市', '-');
INSERT INTO `student` VALUES ('7', 'A012', '计算机(1)', '张氏', '汉', '女', '福州', '党员', '1998年', '2015年', '张峰', '021-85698956', '福州市', '-');
INSERT INTO `student` VALUES ('9', '2015001', '软件3班', '王菲', '女', '汉', '北京', '群众', '1998年', '2015年', null, '13813812345', null, null);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jsh` varchar(50) DEFAULT NULL,
  `xm` varchar(50) DEFAULT NULL,
  `xb` varchar(50) DEFAULT NULL,
  `zc` varchar(50) DEFAULT NULL,
  `zz` varchar(50) DEFAULT NULL,
  `lxfs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'JS001', '李红', '2', '教授', '福州', '1340000xxxx');
INSERT INTO `teacher` VALUES ('2', 'JS002', '张立', '1', '教授', '福州', '1350xxxxxxx');
INSERT INTO `teacher` VALUES ('3', 'JS003', '王玲', '2', '教授', '福州', '1350xxxxxxx');
INSERT INTO `teacher` VALUES ('4', 'JS004', '张牙舞爪', '1', '教授', '福州', '1350xxxxxxx');
INSERT INTO `teacher` VALUES ('5', 'JS005', '林亮', '1', '教授', '福州', '1350xxxxxxx');
INSERT INTO `teacher` VALUES ('6', 'JS006', '张冠李戴', '1', '教授', '福州', '1350xxxxxxx');
INSERT INTO `teacher` VALUES ('7', 'JS007', '陈不样', '1', '教授', '福州', '1350xxxxxxx');
INSERT INTO `teacher` VALUES ('8', 'js008', '陈龙', '1', '教授', '福州市', '123456778');
INSERT INTO `teacher` VALUES ('9', 'JS009', '诚平', '1', '教授', '福州市', '123456778');
INSERT INTO `teacher` VALUES ('10', 'js0909', 'aaa', '1', '4', 'aaadfdf', 'aaadfdfdfdf');
INSERT INTO `teacher` VALUES ('11', '45677', 'dfdf', '1', '教授', 'dfdf', 'dfdfdf');
INSERT INTO `teacher` VALUES ('12', 'k99', 'yyy', '1', '教授', 'yryryrtttttttttttttttt', 'ryrtrtrtttttttttttttttt');

-- ----------------------------
-- Table structure for yh
-- ----------------------------
DROP TABLE IF EXISTS `yh`;
CREATE TABLE `yh` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dlm` varchar(50) DEFAULT NULL COMMENT '用户登录名',
  `name` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `sf` varchar(50) DEFAULT NULL COMMENT '所属单位',
  `password` varchar(50) DEFAULT NULL COMMENT '用户登录密码',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh
-- ----------------------------
INSERT INTO `yh` VALUES ('10', 'admin', '管理员', '管理员', '111111');
INSERT INTO `yh` VALUES ('14', 'lihong', '李红', '教师', '111111');
INSERT INTO `yh` VALUES ('15', 'user1', 'user1', '教师', '888888');
INSERT INTO `yh` VALUES ('19', 'bulan', '布朗', '学生', '888888');
INSERT INTO `yh` VALUES ('20', 'zhangming', '张敏', '学生', '111111');
INSERT INTO `yh` VALUES ('21', 'huanhui', '黄慧', '学生', '888888');
INSERT INTO `yh` VALUES ('22', 'user2', '王亮', '学生', '888888');
INSERT INTO `yh` VALUES ('23', 'user3', '林明亮', '教师', '888888');
INSERT INTO `yh` VALUES ('24', 'linyou', '林名', '管理员', '1111');
INSERT INTO `yh` VALUES ('25', 'user1', '林大亮', '学生', '888888');
INSERT INTO `yh` VALUES ('26', 'sos', '李大妈', '教师', '111111');
INSERT INTO `yh` VALUES ('27', 'user100', '程前', '学生', '111111');
INSERT INTO `yh` VALUES ('28', 'jj', 'jjjj', '教师', '111111');
INSERT INTO `yh` VALUES ('29', 'root', 'ROOT', '管理员', 'root');
