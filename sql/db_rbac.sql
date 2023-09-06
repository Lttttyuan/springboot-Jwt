/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719 (5.7.19-log)
 Source Host           : localhost:3306
 Source Schema         : db_rbac

 Target Server Type    : MySQL
 Target Server Version : 50719 (5.7.19-log)
 File Encoding         : 65001

 Date: 06/09/2023 11:03:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '书籍名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作者',
  `create_time` date NULL DEFAULT NULL COMMENT '出版时间',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '封面地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (19, 'xu814', 64.66, '许秀英', '2011-08-12', NULL);
INSERT INTO `book` VALUES (20, 'lilan9', 27.19, '黎岚', '2013-09-03', NULL);
INSERT INTO `book` VALUES (21, 'cuizitao8', 92.52, '崔子韬', '2021-01-19', NULL);
INSERT INTO `book` VALUES (22, 'shao46', 78.96, '邵秀英', '2011-12-21', NULL);
INSERT INTO `book` VALUES (23, 'yunins06', 51.24, '邵宇宁', '2012-04-22', NULL);
INSERT INTO `book` VALUES (24, 'lanjiang', 42.69, '江岚', '2010-12-05', NULL);
INSERT INTO `book` VALUES (25, 'yunxi301', 20.67, '方云熙', '2010-08-10', NULL);
INSERT INTO `book` VALUES (26, 'yunxi46', 39.56, '顾云熙', '2017-01-17', NULL);
INSERT INTO `book` VALUES (27, 'zouyunxi10', 15.36, '邹云熙', '2019-10-03', NULL);
INSERT INTO `book` VALUES (28, 'lu3', 99.54, '秦璐', '2010-11-24', NULL);
INSERT INTO `book` VALUES (29, 'anqilu', 54.54, '罗安琪', '2016-08-22', NULL);
INSERT INTO `book` VALUES (30, 'cuizhiyuan1002', 75.33, '崔致远', '2019-12-10', NULL);
INSERT INTO `book` VALUES (31, 'han7', 22.72, '韩致远', '2012-03-27', NULL);
INSERT INTO `book` VALUES (32, 'luya327', 23.40, '杨璐', '2019-05-20', NULL);
INSERT INTO `book` VALUES (33, 'xiuyingfang', 74.71, '方秀英', '2016-06-03', NULL);
INSERT INTO `book` VALUES (34, 'yunxix', 11.15, '徐云熙', '2022-04-15', NULL);
INSERT INTO `book` VALUES (35, 'zhanla', 66.43, '张岚', '2014-06-15', NULL);
INSERT INTO `book` VALUES (36, 'yanxi', 52.58, '严秀英', '2020-08-17', NULL);
INSERT INTO `book` VALUES (37, 'lumao', 99.86, '毛璐', '2023-02-03', NULL);
INSERT INTO `book` VALUES (38, 'harui1', 60.34, '韩睿', '2014-08-28', NULL);
INSERT INTO `book` VALUES (39, 'qj1985', 32.68, '钱杰宏', '2012-05-01', NULL);
INSERT INTO `book` VALUES (40, 'tan9', 82.77, '谭晓明', '2021-06-27', NULL);
INSERT INTO `book` VALUES (41, 'lduan', 78.48, '段璐', '2019-04-07', NULL);
INSERT INTO `book` VALUES (42, 'lanqin921', 13.46, '秦岚', '2020-02-28', NULL);
INSERT INTO `book` VALUES (43, 'zitao409', 63.90, '汪子韬', '2014-02-18', NULL);
INSERT INTO `book` VALUES (44, 'liaanqi527', 53.93, '廖安琪', '2013-02-09', NULL);
INSERT INTO `book` VALUES (45, 'jialunj5', 13.07, '金嘉伦', '2015-03-21', NULL);
INSERT INTO `book` VALUES (46, 'zhiyfan', 28.74, '范致远', '2011-12-04', NULL);
INSERT INTO `book` VALUES (47, 'ym8', 86.60, '孟云熙', '2010-12-24', NULL);
INSERT INTO `book` VALUES (48, 'duayun117', 31.67, '段云熙', '2013-11-07', NULL);
INSERT INTO `book` VALUES (49, 'liangzhennan', 92.29, '梁震南', '2011-04-07', NULL);
INSERT INTO `book` VALUES (50, 'shihan7', 90.24, '梁詩涵', '2017-11-06', NULL);
INSERT INTO `book` VALUES (51, 'shihan17', 54.98, '苏詩涵', '2011-08-29', NULL);
INSERT INTO `book` VALUES (52, 'fuxiuyi', 27.24, '傅秀英', '2014-06-02', NULL);
INSERT INTO `book` VALUES (53, 'jiehong1', 54.83, '刘杰宏', '2017-11-03', NULL);
INSERT INTO `book` VALUES (54, 'xzit9', 32.36, '许子韬', '2018-04-26', NULL);
INSERT INTO `book` VALUES (55, 'renjialun6', 60.30, '任嘉伦', '2021-06-10', NULL);
INSERT INTO `book` VALUES (56, 'lush', 20.48, '沈璐', '2011-03-16', NULL);
INSERT INTO `book` VALUES (57, 'xu6', 90.72, '徐璐', '2010-04-17', NULL);
INSERT INTO `book` VALUES (58, 'axi', 79.04, '夏安琪', '2013-12-13', NULL);
INSERT INTO `book` VALUES (59, 'zhiyuanxu', 57.64, '许致远', '2020-05-05', NULL);
INSERT INTO `book` VALUES (60, 'xj98', 38.71, '夏杰宏', '2021-08-29', NULL);
INSERT INTO `book` VALUES (61, 'xiaominghao', 52.08, '郝晓明', '2015-10-28', NULL);
INSERT INTO `book` VALUES (62, 'rui92', 98.25, '唐睿', '2015-11-06', NULL);
INSERT INTO `book` VALUES (63, 'xiaoming904', 92.48, '郭晓明', '2014-02-24', NULL);
INSERT INTO `book` VALUES (64, 'zt702', 94.15, '陶子韬', '2018-04-10', NULL);
INSERT INTO `book` VALUES (65, 'yan76', 64.08, '阎云熙', '2022-09-26', NULL);
INSERT INTO `book` VALUES (66, 'zitayu', 88.51, '余子韬', '2021-01-31', NULL);
INSERT INTO `book` VALUES (67, 'jies', 35.17, '孙杰宏', '2017-08-09', NULL);
INSERT INTO `book` VALUES (68, 'xuzitao', 33.69, '薛子韬', '2014-11-18', NULL);
INSERT INTO `book` VALUES (69, 'chengxiuyi', 81.60, '程秀英', '2015-05-26', NULL);
INSERT INTO `book` VALUES (70, 'ziyicai15', 63.79, '蔡子异', '2018-03-08', NULL);
INSERT INTO `book` VALUES (71, 'jiangzhiyuan97', 94.38, '蒋致远', '2013-07-20', NULL);
INSERT INTO `book` VALUES (72, 'dxia8', 55.58, '董晓明', '2020-09-05', NULL);
INSERT INTO `book` VALUES (73, 'lafan', 66.18, '范岚', '2018-05-01', NULL);
INSERT INTO `book` VALUES (74, 'cuianq3', 66.19, '崔安琪', '2019-07-14', NULL);
INSERT INTO `book` VALUES (75, 'jialunj', 59.55, '贾嘉伦', '2019-08-05', NULL);
INSERT INTO `book` VALUES (76, 'wezhiyuan', 43.65, '魏致远', '2019-10-22', NULL);
INSERT INTO `book` VALUES (77, 'kong16', 51.81, '孔璐', '2017-12-29', NULL);
INSERT INTO `book` VALUES (78, 'anqin', 24.92, '秦安琪', '2019-06-25', NULL);
INSERT INTO `book` VALUES (79, 'xiaomsong', 85.16, '宋晓明', '2011-09-20', NULL);
INSERT INTO `book` VALUES (80, 'yunxdai', 61.78, '戴云熙', '2011-01-07', NULL);
INSERT INTO `book` VALUES (81, 'js95', 13.48, '邵杰宏', '2011-12-02', NULL);
INSERT INTO `book` VALUES (82, 'yjia1022', 51.95, '姜宇宁', '2020-11-02', NULL);
INSERT INTO `book` VALUES (83, 'yaoru62', 45.74, '姚睿', '2019-12-02', NULL);
INSERT INTO `book` VALUES (84, 'xulan', 56.43, '许岚', '2020-08-09', NULL);
INSERT INTO `book` VALUES (85, 'zitaolu703', 96.48, '吕子韬', '2016-04-10', NULL);
INSERT INTO `book` VALUES (86, 'hez94', 42.50, '何子异', '2011-01-29', NULL);
INSERT INTO `book` VALUES (87, 'jiehliu', 54.08, '刘杰宏', '2011-03-18', NULL);
INSERT INTO `book` VALUES (88, 'shjialun', 60.83, '邵嘉伦', '2012-05-10', NULL);
INSERT INTO `book` VALUES (89, 'xiaomingqin613', 37.98, '秦晓明', '2010-11-17', NULL);
INSERT INTO `book` VALUES (90, 'anqid91', 85.69, '董安琪', '2010-04-05', NULL);
INSERT INTO `book` VALUES (91, 'anqi8', 56.13, '曹安琪', '2011-02-09', NULL);
INSERT INTO `book` VALUES (92, 'ancheng', 91.07, '程安琪', '2016-06-04', NULL);
INSERT INTO `book` VALUES (93, 'duanjialun', 61.35, '段嘉伦', '2010-12-25', NULL);
INSERT INTO `book` VALUES (94, 'lij829', 57.66, '廖杰宏', '2023-01-26', NULL);
INSERT INTO `book` VALUES (95, 'xiuyingtan10', 61.99, '谭秀英', '2013-04-08', NULL);
INSERT INTO `book` VALUES (96, 'rui4', 74.99, '熊睿', '2019-08-17', NULL);
INSERT INTO `book` VALUES (97, 'yunxi914', 32.66, '莫云熙', '2021-04-08', NULL);
INSERT INTO `book` VALUES (98, 'janqi', 21.26, '姜安琪', '2013-05-23', NULL);
INSERT INTO `book` VALUES (99, 'ziyifu', 49.14, '傅子异', '2011-10-27', NULL);
INSERT INTO `book` VALUES (100, 'yeyuning', 50.64, '叶宇宁', '2019-11-21', NULL);
INSERT INTO `book` VALUES (101, '111', 22.00, '1010', NULL, NULL);
INSERT INTO `book` VALUES (102, '11', 11.00, '11', '2023-07-04', NULL);
INSERT INTO `book` VALUES (103, '55', 225.00, '55', '2023-07-06', NULL);
INSERT INTO `book` VALUES (104, '33', 33.00, '33', NULL, NULL);
INSERT INTO `book` VALUES (105, '00001', NULL, NULL, NULL, 'http://localhost:8081/files/2feccbe88e8b418f87d93bd08d15a994');
INSERT INTO `book` VALUES (106, '000002', NULL, NULL, NULL, NULL);
INSERT INTO `book` VALUES (107, '22', 2222.00, '22', NULL, NULL);
INSERT INTO `book` VALUES (108, NULL, NULL, '01', NULL, NULL);
INSERT INTO `book` VALUES (109, 'author', NULL, NULL, NULL, NULL);
INSERT INTO `book` VALUES (110, 'lushi614', 27.81, '吕詩涵', '2018-12-20', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作者',
  `time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (5, '777888999', '<p>模拟 Ajax 异步设置内容7222222</p>', 'author', '2023-07-05 22:07:37');
INSERT INTO `news` VALUES (6, '888999888', '<p>模拟 Ajax 异步设置内容888854443333</p>', 'author', '2023-07-05 02:00:00');
INSERT INTO `news` VALUES (8, '12345688899', '<p>模拟 Ajax 异步设置内容1235555</p>', 'author02', '2023-07-05 20:52:09');
INSERT INTO `news` VALUES (9, '3211233210122', '<p>模拟 Ajax 异步设置内容321123</p>', '010000000', '2023-07-04 20:54:56');
INSERT INTO `news` VALUES (10, '1111222', '<p>模拟 Ajax 异步设置内容2222</p>', '01', '2023-07-05 21:50:12');
INSERT INTO `news` VALUES (12, '0000000000000000000', '<p>0000000000000000000</p>', '10102222222222222', '2023-07-12 14:43:48');
INSERT INTO `news` VALUES (13, '10101010', '<p>1010101010</p>', '10', '2023-07-12 14:52:48');
INSERT INTO `news` VALUES (19, '777777', '<p>模拟 Ajax 异步设置内容</p>', '10', '2023-07-12 15:52:16');
INSERT INTO `news` VALUES (23, '111111000000001111111', '<p>11111111110000000000000011</p>', '10', '2023-07-12 17:02:25');
INSERT INTO `news` VALUES (29, '1111111111100000000000000000', '<p>11111111111111110000000000000</p>', '10', '2023-07-13 14:36:07');
INSERT INTO `news` VALUES (30, '101010', '<p>101010</p>', '10', '2023-07-13 15:19:36');
INSERT INTO `news` VALUES (35, '1111111111111166666', '<p>1111111111111111111666666</p>', '10000', '2023-08-05 21:35:35');
INSERT INTO `news` VALUES (36, '22222222222', '<p>22222222222222222222222</p>', '10000', '2023-08-05 21:37:33');
INSERT INTO `news` VALUES (37, '5555555555555', '<p>55555555555555555555</p>', '10000', '2023-08-05 21:38:12');
INSERT INTO `news` VALUES (38, '11111111111', '<p>11111111111111111</p>', '10000', '2023-08-05 22:50:16');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `permission_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '资源路径',
  `permission_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'Home', '/home', '主页', 'House');
INSERT INTO `permission` VALUES (2, 'User', '/user', '用户管理', 'User');
INSERT INTO `permission` VALUES (3, 'Book', '/book', '书籍管理', 'Reading');
INSERT INTO `permission` VALUES (4, 'News', '/news', '新闻管理', 'Notification');
INSERT INTO `permission` VALUES (6, 'Person', '/person', '个人信息', 'ChatLineSquare');
INSERT INTO `permission` VALUES (7, 'MyEditor', '/myEditor', '新闻添加', 'Edit');
INSERT INTO `permission` VALUES (8, 'Permission', '/permission', '权限菜单', 'Setting');
INSERT INTO `permission` VALUES (9, 'Role', '/role', '角色菜单', 'SetUp');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `role_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '管理系统');
INSERT INTO `role` VALUES (2, '普通用户', '用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `role_permission关联permission中id`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permission关联permission中id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission关联role表中id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (2, 3);
INSERT INTO `role_permission` VALUES (2, 4);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (2, 7);
INSERT INTO `role_permission` VALUES (1, 8);
INSERT INTO `role_permission` VALUES (1, 9);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '10', '管理员', '$2a$10$2WLeVG6BVLzrcbbe3TqfguKl1jttVsOAJZCfLtDw0cRZLbh5kN3O.', NULL, NULL, '男', '北京');
INSERT INTO `user` VALUES (2, '01', '普通用户', '$2a$10$2WLeVG6BVLzrcbbe3TqfguKl1jttVsOAJZCfLtDw0cRZLbh5kN3O.', NULL, NULL, '女', '上海');
INSERT INTO `user` VALUES (3, '10000', '管理员,普通用户', '$2a$10$2WLeVG6BVLzrcbbe3TqfguKl1jttVsOAJZCfLtDw0cRZLbh5kN3O.', '00000', NULL, '男', '广州');
INSERT INTO `user` VALUES (18, '11111111', '普通用户', '111', '11111', NULL, '男', NULL);
INSERT INTO `user` VALUES (20, '111', '普通用户', '$2a$2a$10$2WLeVG6BVLzrcbbe3TqfguKl1jttVsOAJZCfLtDw0cRZLbh5kN3O.', NULL, NULL, '男', NULL);
INSERT INTO `user` VALUES (28, '11111', '普通用户,管理员', '123456', '000000', 0, NULL, NULL);
INSERT INTO `user` VALUES (29, '00001', '管理员', '123456', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role关联role表中id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role关联user表中id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 1);
INSERT INTO `user_role` VALUES (3, 2);
INSERT INTO `user_role` VALUES (20, 2);
INSERT INTO `user_role` VALUES (28, 1);
INSERT INTO `user_role` VALUES (28, 2);

-- ----------------------------
-- View structure for role_permission_rbac
-- ----------------------------
DROP VIEW IF EXISTS `role_permission_rbac`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `role_permission_rbac` AS select `r`.`id` AS `rid`,`r`.`role_name` AS `role_name`,`r`.`role_comment` AS `role_comment`,`p`.`id` AS `pid`,`p`.`permission_name` AS `permission_name`,`p`.`permission_path` AS `permission_path`,`p`.`permission_comment` AS `permission_comment`,`p`.`icon` AS `icon` from ((`role` `r` join `permission` `p`) join `role_permission` `rp`) where ((`r`.`id` = `rp`.`role_id`) and (`p`.`id` = `rp`.`permission_id`)) order by `r`.`id`,`p`.`id`;

-- ----------------------------
-- View structure for user_role_rbac
-- ----------------------------
DROP VIEW IF EXISTS `user_role_rbac`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_role_rbac` AS select `u`.`id` AS `uid`,`u`.`username` AS `username`,`u`.`role` AS `role`,`r`.`id` AS `rid`,`r`.`role_name` AS `role_name`,`r`.`role_comment` AS `role_comment` from ((`user` `u` join `role` `r`) join `user_role` `ur`) where ((`u`.`id` = `ur`.`user_id`) and (`r`.`id` = `ur`.`role_id`)) group by `r`.`role_name`,`uid` order by `uid`;

-- ----------------------------
-- View structure for u_name_role
-- ----------------------------
DROP VIEW IF EXISTS `u_name_role`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `u_name_role` AS select `user`.`id` AS `id`,`user`.`username` AS `username`,`user`.`role` AS `role` from `user`;

SET FOREIGN_KEY_CHECKS = 1;
