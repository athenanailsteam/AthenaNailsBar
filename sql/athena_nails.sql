/*
 Navicat Premium Data Transfer

 Source Server         : AthenaNails
 Source Server Type    : MySQL
 Source Server Version : 100309
 Source Host           : localhost:3306
 Source Schema         : athena_nails

 Target Server Type    : MySQL
 Target Server Version : 100309
 File Encoding         : 65001

 Date: 01/06/2019 22:45:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'trieunq', '123', 'Nguyễn Quang Triệu', 'nguyenquangtrieu02071998@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/icar-12b9f.appspot.com/o/trieu.png?alt=media&token=1b265917-2fb6-49f4-95c5-37070884c50a', NULL, NULL);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'Nguyễn Đình Quốc Hiếu', '0282828282882', NULL, NULL);
INSERT INTO `customers` VALUES (2, 'Nguyễn Quang Triệu', '8389382389389', NULL, NULL);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `facebook` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 'Đỗ Xuân Hiển', 'sfssdfsdfds', 'ấdzgsdgdsgds', NULL, NULL);
INSERT INTO `employees` VALUES (2, 'hédhfjsdkfhjsdfh', 'àd', 'fsdfd', NULL, NULL);

-- ----------------------------
-- Table structure for list_services
-- ----------------------------
DROP TABLE IF EXISTS `list_services`;
CREATE TABLE `list_services`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `services_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of list_services
-- ----------------------------
INSERT INTO `list_services` VALUES (1, 'ORI NALE CARE', '', '2019-05-12 16:56:36', '0000-00-00 00:00:00');
INSERT INTO `list_services` VALUES (2, 'GEL NAIL', '', '2019-05-12 16:56:42', NULL);
INSERT INTO `list_services` VALUES (3, 'SNS DIPPING POWDER', '', '2019-05-12 16:56:46', NULL);
INSERT INTO `list_services` VALUES (4, 'ADDITION SERVICE', '', '2019-05-12 16:56:50', NULL);
INSERT INTO `list_services` VALUES (5, 'HEAD SHAMPOO', '', '2019-05-12 16:57:24', NULL);
INSERT INTO `list_services` VALUES (6, 'FACIAL – BODY CARE', '', '2019-05-12 16:58:12', NULL);

-- ----------------------------
-- Table structure for schedule_booking
-- ----------------------------
DROP TABLE IF EXISTS `schedule_booking`;
CREATE TABLE `schedule_booking`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_id` bigint(10) NOT NULL,
  `service_id` bigint(10) NOT NULL,
  `schedule_booking` datetime(0) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `schedule_booking_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `schedule_booking_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `list_services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for service_detail
-- ----------------------------
DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE `service_detail`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `id_services` bigint(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(15, 0) NOT NULL,
  `discount_percent` bigint(10) NULL DEFAULT NULL,
  `discount` double(15, 0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service_detail_ibfk_1`(`id_services`) USING BTREE,
  CONSTRAINT `service_detail_ibfk_1` FOREIGN KEY (`id_services`) REFERENCES `list_services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service_detail
-- ----------------------------
INSERT INTO `service_detail` VALUES (1, 1, 'Polish Change', '', 90000, 0, 0, 'Cut, shape and  Regular Polish', '2019-05-12 16:59:28', NULL);
INSERT INTO `service_detail` VALUES (2, 1, 'Nail Care', '', 120000, NULL, NULL, 'Cut, Shape, Cuticle Care + OPI, Cuccio, Essie and DND reg polish', '2019-05-12 17:03:46', NULL);
INSERT INTO `service_detail` VALUES (3, 1, 'Regular Manicure', '', 320000, NULL, NULL, 'Foot Soak, Cut, Shape, Heels work w pumice stone, Massage with creaming lotion + reg polish.', '2019-05-12 17:04:41', NULL);
INSERT INTO `service_detail` VALUES (4, 1, 'COMBO MANIURE & PEDICURE', '', 500000, NULL, NULL, 'Foot soak, cut, shape, cuticle care, heels work w pumice stone  soothing massage w creaming lotion, nail polish with OPI, Essie, DND and Cuccio', '2019-05-12 17:06:59', NULL);
INSERT INTO `service_detail` VALUES (5, 1, 'Spa Package', '', 450000, NULL, NULL, 'Cut, Shape, Cuticle Care, Callus Removal, Paraffin hot wax, Soothing massage with creaming lotion, ( hand, neck & shoulder massage) + polish.', '2019-05-12 17:07:49', NULL);
INSERT INTO `service_detail` VALUES (6, 2, 'Gel Color Hands or Feet\r\n', '', 350000, NULL, NULL, 'Cut, Shape gel colors', '2019-05-12 17:09:11', NULL);
INSERT INTO `service_detail` VALUES (7, 2, 'Gel Design Mani or Pedi', '', 580000, NULL, NULL, '', '2019-05-12 17:09:40', NULL);
INSERT INTO `service_detail` VALUES (8, 2, 'French Gel w Mani or Pedi', '', 480000, NULL, NULL, '', '2019-05-12 17:10:31', NULL);
INSERT INTO `service_detail` VALUES (9, 2, 'Gel with Mani or Pedi', '', 450000, NULL, NULL, 'Cut, Shape, Cuticle care, heels work and gel colors', '2019-05-12 17:11:19', NULL);
INSERT INTO `service_detail` VALUES (10, 3, 'With hand massage and Cuticle Care.', '', 550000, NULL, NULL, 'With hand massage and Cuticle Care.', '2019-05-12 17:15:38', NULL);
INSERT INTO `service_detail` VALUES (11, 3, 'Solar Pink & White', '', 500000, NULL, NULL, '', '2019-05-12 17:17:12', NULL);
INSERT INTO `service_detail` VALUES (12, 3, 'Refill ( IBD gel or Acrylic)', '', 420000, NULL, NULL, '', '2019-05-12 17:17:54', NULL);
INSERT INTO `service_detail` VALUES (13, 4, 'French Nail Polish', '', 100000, NULL, NULL, '', '2019-05-12 17:18:32', NULL);
INSERT INTO `service_detail` VALUES (14, 4, 'Ombre or Gradation design', '', 420000, NULL, NULL, '', '2019-05-12 17:19:02', NULL);
INSERT INTO `service_detail` VALUES (15, 4, '3D Nail Art', '', 300000, NULL, NULL, '', '2019-05-12 17:19:25', NULL);
INSERT INTO `service_detail` VALUES (16, 5, 'Regular shampoo, face cleasing with fresh milk wash and back shoulder massage with reg dry.', '', 350000, NULL, NULL, 'Regular shampoo, face cleasing with fresh milk wash and back shoulder massage with reg dry.', '2019-05-12 17:22:02', NULL);
INSERT INTO `service_detail` VALUES (17, 5, 'Deluxe Shampoo', '', 580000, NULL, NULL, 'Star with free mini facial. Moisturize with top of the line from professional shampoo from CHI, Paul Michell, Kendra Platinum + exfoliate and moisturize with ole henrisen walnut complexion scrub. 70min ', '2019-05-12 17:22:38', NULL);
INSERT INTO `service_detail` VALUES (18, 5, 'Hair Treatment', '', 600000, NULL, NULL, 'Joico K-Pak deep penetrating reconstructor this powerful combination of amino acids rebuilds and refortifies stressed strands.\r\n\r\nChi Keratin treatment highly sophisticated compound replenishes and protects hair\'s natural keratin protein.\r\n\r\nBioSilk Thera', '2019-05-12 17:23:20', NULL);
INSERT INTO `service_detail` VALUES (19, 6, 'BODY MASSAGE WITH HOT STONE', '', 850000, NULL, NULL, '', '2019-05-12 17:26:07', NULL);
INSERT INTO `service_detail` VALUES (20, 6, 'FOOT or NECK - SHOULDER MASSAGE', '', 410000, NULL, NULL, 'FREE HOT STONE', '2019-05-12 17:26:52', NULL);

SET FOREIGN_KEY_CHECKS = 1;
