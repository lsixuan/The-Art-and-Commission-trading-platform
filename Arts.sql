/*
 Navicat Premium Data Transfer

 Source Server         : Local link
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:3306
 Source Schema         : Arts

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 16/07/2024 21:11:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album_images
-- ----------------------------
DROP TABLE IF EXISTS `album_images`;
CREATE TABLE `album_images`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'images ID',
  `album_id` bigint(20) NULL DEFAULT NULL COMMENT 'Belonging works ID',
  `image_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'image URL',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'Upload User ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Work Chart' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album_images
-- ----------------------------
INSERT INTO `album_images` VALUES (1, 1, 'http://localhost:8082/img/hs2.2ee950dc.png', 1);
INSERT INTO `album_images` VALUES (2, 2, 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', 1);
INSERT INTO `album_images` VALUES (3, 2, 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163126121.png', 1);
INSERT INTO `album_images` VALUES (4, 5, 'http://localhost:8080/springbootiymihuashi/api/files/preview/show3_20240715164654376.png', 1);
INSERT INTO `album_images` VALUES (5, 5, 'http://localhost:8080/springbootiymihuashi/api/files/preview/1659087098571_20240715164746129.jpg', 1);
INSERT INTO `album_images` VALUES (6, 6, 'http://localhost:8080/springbootiymihuashi/api/files/preview/1655090890230_20240715170606139.png', 1);
INSERT INTO `album_images` VALUES (7, 18, 'http://localhost:8080/springbootiymihuashi/api/files/preview/5X9jTYZmKY0Ldfb81225d5ed6712573b449f88d218ee_20240715192235542.jpg', 7);
INSERT INTO `album_images` VALUES (11, 2, 'http://localhost:8080/springbootiymihuashi/api/files/preview/Bc1r3duqR7LZf3f938781f363f9f40959a82efe2a399_20240715225854958.jpg', 1);
INSERT INTO `album_images` VALUES (12, 5, 'http://localhost:8080/springbootiymihuashi/api/files/preview/aa00257d-c50f-4481-bc84-b53e8408612c_20240715225907581.webp', 1);
INSERT INTO `album_images` VALUES (13, 18, 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715230256088.png', 7);
INSERT INTO `album_images` VALUES (14, 19, 'http://localhost:8080/springbootiymihuashi/api/files/preview/1659087098571_20240715230319921.jpg', 7);
INSERT INTO `album_images` VALUES (15, 19, 'http://localhost:8080/springbootiymihuashi/api/files/preview/logo1_20240715230639065.png', 7);
INSERT INTO `album_images` VALUES (16, 19, 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E7%8C%AB%E5%A4%B4%E9%B9%B0_20240715230646262.jpeg', 7);
INSERT INTO `album_images` VALUES (17, 20, 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E4%BA%91%E6%B5%B7_20240715231324431.jpeg', 2);
INSERT INTO `album_images` VALUES (18, 21, 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E7%BE%A4%E5%B1%B1_20240715231349049.jpeg', 2);
INSERT INTO `album_images` VALUES (19, 22, 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E7%8C%AB%E5%A4%B4%E9%B9%B0_20240715234923252.jpeg', 9);
INSERT INTO `album_images` VALUES (20, 22, 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E4%BA%91%E6%B5%B7_20240715234938658.jpeg', 9);
INSERT INTO `album_images` VALUES (21, 22, 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E6%97%A5%E5%87%BA_20240715234942515.jpeg', 9);
INSERT INTO `album_images` VALUES (22, 23, 'http://localhost:8080/springbootiymihuashi/api/files/preview/7YS6oObzVMEUdfb81225d5ed6712573b449f88d218ee_20240716192000404.jpg', 8);

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'works ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'title of a work',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cover image URL',
  `count` int(11) NULL DEFAULT 0 COMMENT 'Number of images',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'user id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Works List' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of albums
-- ----------------------------
INSERT INTO `albums` VALUES (1, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/class_03871408ef90dc0c4b3023609710_20240715153402544.png', 1, NULL, NULL, 1);
INSERT INTO `albums` VALUES (2, '333', 'http://localhost:8080/springbootiymihuashi/api/files/preview/logo1_20240715152119496.png', 3, NULL, NULL, 1);
INSERT INTO `albums` VALUES (4, '777', 'http://localhost:8080/springbootiymihuashi/api/files/preview/aa00257d-c50f-4481-bc84-b53e8408612c_20240715153627825.webp', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (5, '123', 'http://localhost:8082/img/hs1.89cbb63d.png', 3, NULL, NULL, 1);
INSERT INTO `albums` VALUES (6, '12334', 'http://localhost:8080/springbootiymihuashi/api/files/preview/show4_20240715152130575.jpg', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (7, 'asd', 'http://localhost:8080/springbootiymihuashi/api/files/preview/Bc1r3duqR7LZf3f938781f363f9f40959a82efe2a399_20240715152139229.jpg', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (8, '444', 'http://localhost:8080/springbootiymihuashi/api/files/preview/hRAWQjaHtT1013a7017aa90601f7cfb37fdd4363512a_20240715153415214.png', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (9, '555', 'http://localhost:8082/img/hs1.89cbb63d.png', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (10, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/d6bf17d4-ccaa-439f-a329-07aad43ff3fc_20240715153649798.webp', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (11, '123', 'http://localhost:8082/img/hs1.89cbb63d.png', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (12, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/7YS6oObzVMEUdfb81225d5ed6712573b449f88d218ee_20240715153632973.jpg', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (13, '123', 'http://localhost:8082/img/hs1.89cbb63d.png', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (14, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/dXeXDrzMW6Mqdfb81225d5ed6712573b449f88d218ee_20240715151921337.jpg', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (15, '123123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715152037259.png', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (16, '123123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/d6bf17d4-ccaa-439f-a329-07aad43ff3fc_20240715152050868.webp', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (17, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/7YS6oObzVMEUdfb81225d5ed6712573b449f88d218ee_20240715153032343.jpg', 0, NULL, NULL, 1);
INSERT INTO `albums` VALUES (18, 'test', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715192225538.png', 2, NULL, NULL, 7);
INSERT INTO `albums` VALUES (19, 'test', 'http://localhost:8080/springbootiymihuashi/api/files/preview/1655090890230_20240715230306721.png', 3, NULL, NULL, 7);
INSERT INTO `albums` VALUES (20, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E7%8C%AB%E5%A4%B4%E9%B9%B0_20240715231302280.jpeg', 1, NULL, NULL, 2);
INSERT INTO `albums` VALUES (21, '123', 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E4%BA%91%E6%B5%B7_20240715231319639.jpeg', 1, NULL, NULL, 2);
INSERT INTO `albums` VALUES (22, 'test', 'http://localhost:8080/springbootiymihuashi/api/files/preview/%E9%9B%BE%E6%9D%BE_20240715234910008.jpeg', 3, NULL, NULL, 9);
INSERT INTO `albums` VALUES (23, 'ceshi', 'http://localhost:8080/springbootiymihuashi/api/files/preview/DqgNYRqRxlp3a3e3c8f61be1f6d840bd6be4d1e95451_20240716191953939.jpg', 1, NULL, NULL, 8);
INSERT INTO `albums` VALUES (24, 'test', 'http://localhost:8080/springbootiymihuashi/api/files/preview/1d898f13-940d-4270-941a-d7152337e867_20240716194654555.webp', 0, NULL, NULL, 8);

-- ----------------------------
-- Table structure for artist_collection
-- ----------------------------
DROP TABLE IF EXISTS `artist_collection`;
CREATE TABLE `artist_collection`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT 'user ID',
  `artist_id` bigint(20) NOT NULL COMMENT 'artist ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update time',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_artist_id`(`artist_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'artist Collection' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artist_collection
-- ----------------------------
INSERT INTO `artist_collection` VALUES (1, 7, 7, '2024-07-16 11:42:02', '2024-07-16 11:42:02');
INSERT INTO `artist_collection` VALUES (2, 7, 9, '2024-07-16 12:22:53', '2024-07-16 12:22:53');
INSERT INTO `artist_collection` VALUES (3, 1, 7, '2024-07-16 19:13:24', '2024-07-16 19:13:24');
INSERT INTO `artist_collection` VALUES (4, 7, 2, '2024-07-16 19:18:14', '2024-07-16 19:18:14');
INSERT INTO `artist_collection` VALUES (5, 10, 7, '2024-07-16 20:46:46', '2024-07-16 20:46:46');

-- ----------------------------
-- Table structure for artist_no_date
-- ----------------------------
DROP TABLE IF EXISTS `artist_no_date`;
CREATE TABLE `artist_no_date`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT 'user ID',
  `no_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'artist date' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `userid` bigint(20) NOT NULL COMMENT 'userid',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'username',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'role',
  `addtime` datetime NULL DEFAULT NULL,
  `expiratedtime` datetime NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (2, 1, '123123', '1', NULL, '2024-07-14 23:56:03', '6jlekkwm6w4gxcgfl42re9qk5vqox6uq');
INSERT INTO `token` VALUES (3, 1, '123123', '0', NULL, '2024-07-16 21:37:57', '2z50c7oeqt464kc0vd5x6f9j4ey1yhcn');
INSERT INTO `token` VALUES (4, 4, 'xvs', '1', NULL, '2024-07-15 10:13:29', 'bcaqwm1hcwb3git1hg9d2z7b95de1i9e');
INSERT INTO `token` VALUES (5, 8, '1444', '2', NULL, '2024-07-16 20:18:43', 'z98w4lo8yzipd176u2xk3urf65473r7p');
INSERT INTO `token` VALUES (6, 9, '1528asd6368', '1', NULL, '2024-07-16 00:48:59', 'w8os3w6wulz6h1ua4ye1c0hlrweg865j');
INSERT INTO `token` VALUES (7, 7, '12', '1', NULL, '2024-07-16 20:18:01', 'z263x0x4r4vkg4biscp43tlnpwvqc2an');
INSERT INTO `token` VALUES (8, 2, '15288966368', '1', NULL, '2024-07-16 00:12:55', 'h3lsvalcbucuw1w0bivmshnxuew9uqap');
INSERT INTO `token` VALUES (9, 10, 'qwe', '1', NULL, '2024-07-16 21:42:31', '3chvdt2zckjrl1cgsjmr3vjspusrie3i');
INSERT INTO `token` VALUES (10, 7, '12', '2', NULL, '2024-07-16 21:42:47', 'n6l8szgg32hq3dsy2mabfwlo8fm2f6pb');

-- ----------------------------
-- Table structure for user_verifications
-- ----------------------------
DROP TABLE IF EXISTS `user_verifications`;
CREATE TABLE `user_verifications`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ExamineID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UserName',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Password',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'role 0 admin 1 customer 2 artist',
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Surname',
  `sign_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SignName',
  `bank_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BankNumber',
  `service_bank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ServiceBank',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BankName',
  `national_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'NationalId',
  `portfolio_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PortfolioLink',
  `create_time` datetime NOT NULL COMMENT 'CreateTime',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'UpdateTime',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT 'Audit status 0 Unaudited 1 Already passed  2 Rejected',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Avatar',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'User Review Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_verifications
-- ----------------------------
INSERT INTO `user_verifications` VALUES (2, '15288966368', '123', 'haier1234', '1', '123', '123', '123', '123', '123', '123', '123', '2024-07-14 17:55:07', '2024-07-14 17:55:07', 1, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (3, '15288962222', '1233', 'haier1234', '1', '1233', '1233', '1233', '1233', '1233', '1233', '1233', '2024-07-14 17:55:07', '2024-07-14 17:55:07', 2, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (4, '1528896sdf68', '45', 'haier1234', '1', '64564', '56', '4564', '5', '56664', '5', '56456', '2024-07-14 17:55:07', '2024-07-14 17:55:07', 1, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (5, 'xvs', '123123', '123123', '1', '123123', '123123', '123123123123', '123123', '123123', '123123', '123123', '2024-07-15 09:11:56', '2024-07-15 09:11:56', 1, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (6, 'asdasd', 'asdasd', 'asdasd', '1', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '2024-07-15 09:13:04', '2024-07-15 09:13:04', 2, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (7, 'xvs1', '123', '123123', '2', '123', '123', '312', '3123', '123', '123', '123', '2024-07-15 09:22:55', '2024-07-15 09:22:55', 0, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (8, '1528asd6368', '12', 'haier1234', '1', '312', '23', '123', '1', '23', '312', '3123', '2024-07-15 17:20:00', '2024-07-15 17:20:00', 1, 'http://localhost:8082/img/user.f00823e5.png');
INSERT INTO `user_verifications` VALUES (9, 'qwe', '123', '123123', '1', '12', '312', '312', '312', '31', '23', '123', '2024-07-16 20:38:18', '2024-07-16 20:38:18', 1, 'http://localhost:8082/img/user.f00823e5.png');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'UserID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UserName',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Password',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'role 0 admin 1 customer 2 artist',
  `homepage_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'homepage background URL',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'avatar URL',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Surname',
  `sign_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Sign Name',
  `bank_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Bank number',
  `service_bank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ervice bank',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'bank name',
  `national_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'national id',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'introduction',
  `portfolio_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'portfolio link',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'User table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123123', '123123', '0', 'http://localhost:8080/springbootiymihuashi/api/files/preview/1655090890230_20240715181540423.png', 'http://localhost:8080/springbootiymihuashi/api/files/preview/7YS6oObzVMEUdfb81225d5ed6712573b449f88d218ee_20240715181704145.jpg', '33233', '33', '33', '11', '11', '11', '11', '你好', '12');
INSERT INTO `users` VALUES (2, '15288966368', '123123', '2', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', '123123', '123', '123', '123', '123', '123', '123', '123', '123');
INSERT INTO `users` VALUES (6, '123', '123456', '0', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', '1231', '23', '12', '231', '23', '23', '12', '3123', '123111');
INSERT INTO `users` VALUES (7, '12', '123456', '2', 'http://localhost:8080/springbootiymihuashi/api/files/preview/1659087098571_20240716204601852.jpg', 'http://localhost:8080/springbootiymihuashi/api/files/preview/show2_20240716204624478.png', '123', '12', '312', '312', '3123', '123', '123', '123', '12312');
INSERT INTO `users` VALUES (8, '1444', '123456', '2', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', 'http://localhost:8080/springbootiymihuashi/api/files/preview/454V6tRKpngz13a7017aa90601f7cfb37fdd4363512a_20240715163103900.png', '44', '4', '44', '44', '4', '4', '4', '44', '444');
INSERT INTO `users` VALUES (9, '1528asd6368', '123123', '2', 'http://localhost:8080/springbootiymihuashi/api/files/preview/1659087098571_20240715182309310.jpg', 'http://localhost:8080/springbootiymihuashi/api/files/preview/dXeXDrzMW6Mqdfb81225d5ed6712573b449f88d218ee_20240715182627980.jpg', '12312', '312', '23', '123', '1', '23', '312', '123123123', '3123');
INSERT INTO `users` VALUES (10, 'qwe', '123123', '1', NULL, 'http://localhost:8082/img/user.f00823e5.png', NULL, '12', '312', '312', '312', '31', '23', NULL, '123');

SET FOREIGN_KEY_CHECKS = 1;
