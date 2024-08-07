/*
 Navicat Premium Data Transfer

 Source Server         : 本地链接
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:3306
 Source Schema         : mihuashi

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 19/07/2024 10:54:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for artist_no_date
-- ----------------------------
DROP TABLE IF EXISTS `artist_no_date`;
CREATE TABLE `artist_no_date`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `no_date` date NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '艺术家非时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artist_no_date
-- ----------------------------
INSERT INTO `artist_no_date` VALUES (45, 8, '2024-08-02');
INSERT INTO `artist_no_date` VALUES (46, 8, '2024-08-23');
INSERT INTO `artist_no_date` VALUES (47, 8, '2024-08-24');
INSERT INTO `artist_no_date` VALUES (48, 8, '2024-08-25');
INSERT INTO `artist_no_date` VALUES (49, 8, '2024-08-18');
INSERT INTO `artist_no_date` VALUES (50, 8, '2024-08-17');
INSERT INTO `artist_no_date` VALUES (55, 7, '2024-07-28');
INSERT INTO `artist_no_date` VALUES (56, 7, '2024-07-20');
INSERT INTO `artist_no_date` VALUES (57, 7, '2024-07-27');
INSERT INTO `artist_no_date` VALUES (58, 7, '2024-07-21');
INSERT INTO `artist_no_date` VALUES (59, 7, '2024-07-26');
INSERT INTO `artist_no_date` VALUES (60, 7, '2024-07-19');

SET FOREIGN_KEY_CHECKS = 1;
