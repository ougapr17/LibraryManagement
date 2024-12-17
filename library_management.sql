/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : library_management

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 17/12/2024 09:25:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `categoryid` int(11) NOT NULL,
  `booklink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deadline` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '水浒传', 26.00, '施耐庵', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-10-16 09:24:43');
INSERT INTO `book` VALUES (2, '西游记', 25.00, '吴承恩', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-05-15 09:23:19');
INSERT INTO `book` VALUES (3, '红楼梦', 35.10, '曹雪芹', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 20:56:17');
INSERT INTO `book` VALUES (4, '三国演义', 28.00, '罗贯中', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 20:56:15');
INSERT INTO `book` VALUES (6, '6', 6.00, '6', '6', 6, '6', '2024-12-15 19:15:21');
INSERT INTO `book` VALUES (27, 'JUnit Book', 29.99, 'Author', 'Publisher', 1, 'http://link.to/book', '2024-12-03 14:35:13');

-- ----------------------------
-- Table structure for bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf`;
CREATE TABLE `bookshelf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `booklink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adddate` datetime(0) NULL DEFAULT NULL,
  `removedate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookshelf
-- ----------------------------
INSERT INTO `bookshelf` VALUES (13, 1, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:10', NULL);
INSERT INTO `bookshelf` VALUES (14, 1, 4, '三国演义', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:41', NULL);
INSERT INTO `bookshelf` VALUES (15, 1, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:58', NULL);
INSERT INTO `bookshelf` VALUES (31, 2, 4, '三国演义', NULL, '2024-12-15 22:51:57', NULL);
INSERT INTO `bookshelf` VALUES (32, 2, 27, 'JUnit Book', NULL, '2024-12-15 22:51:59', NULL);
INSERT INTO `bookshelf` VALUES (38, 2, 3, '红楼梦', NULL, '2024-12-16 16:24:36', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`commentid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (6, 1, '2001', 4, '三国演义', '非常好', '2021-05-22 20:35:58');
INSERT INTO `comment` VALUES (7, 1, '2001', 1, '水浒传', '值得一看！', '2021-05-23 08:50:35');
INSERT INTO `comment` VALUES (8, 201720732, '123456', 1, '水浒传', '测试', '2024-01-26 17:04:47');
INSERT INTO `comment` VALUES (9, 2, '123456', 1, '水浒传', '非常好', '2024-01-26 17:40:23');
INSERT INTO `comment` VALUES (10, 2, '123456', 4, '三国演义', '很好的书', '2024-12-03 00:01:29');
INSERT INTO `comment` VALUES (11, 2, '123456', 4, '三国演义', '很好的书', '2024-12-03 00:01:29');
INSERT INTO `comment` VALUES (12, 2, '123456', 4, '三国演义', '很好看', '2024-12-03 00:01:40');
INSERT INTO `comment` VALUES (13, 2, '123456', 3, '红楼梦', '1111', '2024-12-15 21:04:18');
INSERT INTO `comment` VALUES (14, 2, '123456', 3, '红楼梦', '很好看', '2024-12-16 16:26:10');
INSERT INTO `comment` VALUES (15, 2, '123456', 3, '红楼梦', '很好看', '2024-12-16 16:26:19');
INSERT INTO `comment` VALUES (16, 2, '123456', 3, '红楼梦', '很好看', '2024-12-16 16:27:13');
INSERT INTO `comment` VALUES (17, 2, '123456', 3, '红楼梦', '很好看', '2024-12-16 16:27:38');
INSERT INTO `comment` VALUES (18, 1, 'admin', 3, '红楼梦', '很好看', '2024-12-16 21:13:00');
INSERT INTO `comment` VALUES (19, 1, 'admin', 3, '红楼梦', '很好看', '2024-12-16 22:29:55');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `borrowid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `booklink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `borrowtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`borrowid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (4, 1, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:58');
INSERT INTO `record` VALUES (7, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-25 23:55:36');
INSERT INTO `record` VALUES (8, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:03:20');
INSERT INTO `record` VALUES (9, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:11:57');
INSERT INTO `record` VALUES (10, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:12:28');
INSERT INTO `record` VALUES (11, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:16:32');
INSERT INTO `record` VALUES (12, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:16:38');
INSERT INTO `record` VALUES (13, 201720732, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:16:49');
INSERT INTO `record` VALUES (14, 201720732, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 00:16:53');
INSERT INTO `record` VALUES (15, 2, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-01-26 17:39:26');
INSERT INTO `record` VALUES (16, 2, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-02 22:30:53');
INSERT INTO `record` VALUES (17, 2, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-15 21:00:30');
INSERT INTO `record` VALUES (18, 2, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-15 21:02:37');
INSERT INTO `record` VALUES (19, 2, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-15 22:51:54');
INSERT INTO `record` VALUES (20, 2, 4, '三国演义', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-15 22:51:57');
INSERT INTO `record` VALUES (24, 2, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-16 16:23:56');
INSERT INTO `record` VALUES (27, 2, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-16 16:24:36');
INSERT INTO `record` VALUES (28, 1, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-16 21:12:56');
INSERT INTO `record` VALUES (29, 1, 3, '红楼梦', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2024-12-16 22:29:52');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isadmin` int(1) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '123456@qq.com', '15220232665', 1);
INSERT INTO `user` VALUES (2, '123456', '123456', '186412@qq.com', '13333333333', 0);
INSERT INTO `user` VALUES (4, 'testUser', 'password', 'test@example.com', '1234567890', 0);
INSERT INTO `user` VALUES (6, '///***', '123', '222', '111', 0);
INSERT INTO `user` VALUES (7, 'testUser', 'password', 'test@example.com', '1234567890', 0);
INSERT INTO `user` VALUES (51, '1', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (52, '2', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (53, '3', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (54, '4', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (55, '5', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (56, '6', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (57, '7', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (58, '8', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (59, '9', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (60, '10', '1', NULL, NULL, 0);
INSERT INTO `user` VALUES (666, '123', '253', '123@163.com', '12312312312', 0);
INSERT INTO `user` VALUES (1022, '555222', '555222', '123@163.com', '12312312312', 0);
INSERT INTO `user` VALUES (1023, '666222', '666222', '', '12312312312', 0);
INSERT INTO `user` VALUES (1024, '444222', '444222', '123@163.com', '', 0);

SET FOREIGN_KEY_CHECKS = 1;
