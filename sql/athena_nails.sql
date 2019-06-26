/*
Navicat MySQL Data Transfer

Source Server         : athena_nails
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : athena_nails

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-06-26 12:29:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'trieunq', '123', 'Nguyễn Quang Triệu', 'nguyenquangtrieu02071998@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/icar-12b9f.appspot.com/o/trieu.png?alt=media&token=1b265917-2fb6-49f4-95c5-37070884c50a', null, null);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'Nguyễn Đình Quốc Hiếu', '0282828282882', null, null);
INSERT INTO `customers` VALUES ('2', 'Nguyễn Quang Triệu', '8389382389389', null, null);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `cellphone` bigint(15) DEFAULT NULL,
  `comission` bigint(10) DEFAULT NULL,
  `splitcash` bigint(10) DEFAULT NULL,
  `splitcheck` bigint(10) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', '	Hien Xuan', 'Do', 'Thomas', '1989-01-28', 'M', '8322068931', '60', '60', '40', '', '', null, null);
INSERT INTO `employees` VALUES ('2', 'Katie Phuong', 'Nguyen', 'Katie', '1986-11-24', 'F', '8322894870', '60', '60', '40', '', '', null, null);
INSERT INTO `employees` VALUES ('3', 'Vu Duc', 'Tran', 'Victor', null, 'M', null, '60', '60', '40', '', null, null, null);
INSERT INTO `employees` VALUES ('4', 'Linh My Thi', 'Tran', 'Linh', null, 'F', null, '60', '60', '40', '', null, null, null);
INSERT INTO `employees` VALUES ('5', 'Don Thi', 'Vu', 'Don', null, 'F', null, '100', '100', null, '', null, null, null);

-- ----------------------------
-- Table structure for list_services
-- ----------------------------
DROP TABLE IF EXISTS `list_services`;
CREATE TABLE `list_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `services_name` varchar(255) NOT NULL,
  `image_service` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of list_services
-- ----------------------------
INSERT INTO `list_services` VALUES ('1', 'ARTIFICIAL', '', '2019-05-12 16:56:36', '0000-00-00 00:00:00');
INSERT INTO `list_services` VALUES ('2', 'A-LA-CARTE', '', '2019-05-12 16:56:42', null);
INSERT INTO `list_services` VALUES ('3', 'PRINCESS MENU', '', '2019-05-12 16:56:46', null);
INSERT INTO `list_services` VALUES ('4', 'HAIR REMOVAL', '', '2019-05-12 16:56:50', null);
INSERT INTO `list_services` VALUES ('5', 'EYELASH', '', '2019-05-12 16:57:24', null);
INSERT INTO `list_services` VALUES ('6', 'PEDICURES/MANICURES', '', '2019-05-12 16:58:12', null);

-- ----------------------------
-- Table structure for schedule_booking
-- ----------------------------
DROP TABLE IF EXISTS `schedule_booking`;
CREATE TABLE `schedule_booking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `employee_id` bigint(10) NOT NULL,
  `service_id` bigint(10) NOT NULL,
  `schedule_booking` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE,
  KEY `service_id` (`service_id`) USING BTREE,
  CONSTRAINT `schedule_booking_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `schedule_booking_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `list_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of schedule_booking
-- ----------------------------

-- ----------------------------
-- Table structure for service_detail
-- ----------------------------
DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE `service_detail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `id_services` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(15,0) NOT NULL,
  `price2` double(15,0) DEFAULT NULL,
  `discount_percent` bigint(10) DEFAULT NULL,
  `discount` double(15,0) DEFAULT NULL,
  `description` varchar(2000) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `service_detail_ibfk_1` (`id_services`) USING BTREE,
  CONSTRAINT `service_detail_ibfk_1` FOREIGN KEY (`id_services`) REFERENCES `list_services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of service_detail
-- ----------------------------
INSERT INTO `service_detail` VALUES ('1', '1', 'SOLAR FULL SET', '', '30', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('2', '1', 'PINK REFILL', '', '23', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('3', '1', 'NEW SET COLOR POWDER', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('4', '1', 'NEW SET WITH SHELLAC', '', '50', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('5', '1', 'REFILL WITH SHELLAC', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('6', '1', 'NEW SET OMBRE', '', '55', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('7', '1', 'REFILL OMBRE', '', '45', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('8', '1', 'NEW SET PINK & WHITE', '', '55', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('9', '1', 'REFILL PINK & WHITE', '', '45', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('10', '1', 'NEW SET TOES', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('11', '1', 'REFILL TOES', '', '33', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('12', '1', 'NEXGEN OVERLAY', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('13', '1', 'NEXGEN OMBRE', '', '55', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('14', '2', 'NAILS DESIGN', '', '5', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('15', '2', 'NAILS REPAIR', '', '5', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('16', '2', 'HAND/TOES POLISH CHANGE', '', '10', '12', null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('17', '2', 'HAND/TOES POLISH CHANGE WITH SHELLAC', '', '20', '25', null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('18', '2', '2 NEW BIG TOE/FILL', '', '10', '7', null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('19', '2', 'NAIL REMOVAL', '', '10', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('20', '2', 'DIP REMOVAL', '', '5', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('21', '2', 'SHELLAC SOAK-OFF', '', '5', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('22', '2', 'NAIL REMOVAL WITH SERVICE', '', '5', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('23', '2', 'FRENCH ADD-ON', '', '5', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('24', '2', 'SHELLAC ADD-ON', '', '20', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('25', '2', 'PARAFIN WAX HANDS/TOES', '', '5', '7', null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('26', '2', 'EXTRA MASSAGE 10 MIN', '', '10', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('27', '3', 'BASIC MANICURE', '', '14', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('28', '3', 'BASIC PEDICURE', '', '22', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('29', '3', 'SHELLAC ADD-ON', '', '15', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('30', '3', 'POLISH CHANGE HAND/TOES', '', '6', '8', null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('31', '3', 'SHELLAC POLISH CHANGE', '', '20', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('32', '4', 'EYEBROWS', '', '10', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('33', '4', 'LIP', '', '7', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('34', '4', 'CHIN', '', '8', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('35', '4', 'FULL FACE', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('36', '4', 'HALF ARMS', '', '25', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('37', '4', 'FULL ARMS', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('38', '4', 'UNDER ARMS', '', '20', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('39', '4', 'HALF LEG', '', '40', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('40', '4', 'FULL LEG', '', '70', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('41', '4', 'BACK', '', '50', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('42', '4', 'CHEST', '', '35', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('43', '4', 'STOMACH', '', '20', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('44', '4', 'BIKINI', '', '35', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('45', '4', 'BRAZILIAN', '', '50', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('46', '5', 'FLARE', '', '45', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('47', '5', 'INDIVIDUALS', '', '120', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('48', '5', 'REFILL INDIVIDUAL', '', '60', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('49', '5', 'VOLUME', '', '160', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('50', '5', 'REFILL VOLUME', '', '80', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('51', '6', 'BASIC', '', '30', '16', null, null, 'Even though consider our basic pedicure it is still a step above the rest. This pedicure include nail trimming, shape, cuticle grooming, callus treatment, exfoliation of dead skin, extensive leg and foot massage, and finish with your choice of polish.', null, null);
INSERT INTO `service_detail` VALUES ('52', '6', 'BASIC COMBO', '', '43', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('53', '6', 'MOJOTOES CUCUMBER', '', '45', '25', null, null, 'The Isle delight will have your feet refresh. The aromas of fresh cucumbers, will wake up your senses. Our cucumber scrub preps your tootsies for the invigorating cooling treatment from the creamy mask & fresh cucumber slices. ', null, null);
INSERT INTO `service_detail` VALUES ('54', '6', 'MOJOTOES CUCUMBER COMBO', '', '67', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('55', '6', 'FUJI-JUICE', '', '50', '30', null, null, 'Everything in the cucumber plus paraffin wax. A delicious paraffin treatment and massage will start off your weekend Miami mood.', null, null);
INSERT INTO `service_detail` VALUES ('56', '6', 'FUJI-JUICE COMBO', '', '76', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('57', '6', 'SPORT', '', '50', '30', null, null, 'Everything samething the Fuji-Juice but different smell (coffee). The sport pedicure is a man Pedicure', null, null);
INSERT INTO `service_detail` VALUES ('58', '6', 'SPORT COMBO', '', '76', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('59', '6', 'NU-SKIN  ', '', '50', '30', null, null, 'Indulge in this guilty pleasure without the guilt. The Nu-skin will leave your feet and legs feeling amazing. Using Herbal Mineral Bath, a blend of Grapefruit Body Bar and Walnut Body Lufra Exfoliating and top it off with the Revitalizing Ice Dance leg massage and hot tower wrap to bring your pedicure experience to a whole new level. Along with our most famous Sole Solution heel treatment, finger pressure massage techniques using Firewalker Cream will take all the tiredness away. Finish with the ultimate soft Baobab Body Butter.', null, null);
INSERT INTO `service_detail` VALUES ('60', '6', 'NU-SKIN COMBO', '', '76', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('61', '6', 'MILK AND HONEY', '', '55', '35', null, null, 'Menu Submerge your soles in our warm milk foot bath filled Our real honey sugar scrub will slough and buff the dead skin away, unveiling new healthy skin. Honey mask containing vitamins, minerals, and amino acids is applied below the knees to the ankles to help combat the free radicals which damage cells. Protein in the milk is a natural moisturizer while the honey creates a watertight film that helps skin retain moisture and is thereby rejuvenating and softening. It doesn\'t get any sweeter than this.', null, null);
INSERT INTO `service_detail` VALUES ('62', '6', 'MILK AND HONEY COMBO', '', '85', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('63', '6', 'HERBAL', '', '60', '40', null, null, 'Includes your choice of custom made herbal products from our menu of botanical herbs for a relaxing sensory experience. Take an hour long journey back to the ancient times of the Far East, the land of herbal remedies, and experience absolute nirvana for your feet. The aromas of this foot bath will open your sinuses and clear your head for total pampering. Our crystal gel treatment, which contains seven potent Chinese herbs, helps increase blood circulation while protecting and restoring moisture and adding vitamins back into your feet. The green tea soufflé mask is full of antioxidants that will leave your skin feeling soft and supple. Light are turned off so can closed your eyes and rest while our tech perform a blissful, therapeutic massage to help ease stress throughout your entire body. Lastly, nail polish of the customer\'s choice is applied to finish.', null, null);
INSERT INTO `service_detail` VALUES ('64', '6', 'HERBAL COMBO', '', '95', null, null, null, '', null, null);
INSERT INTO `service_detail` VALUES ('65', '6', 'ATHENA', '', '70', '40', null, null, 'Material in season. We make fresh in store. Can you talk with nail tech for this pedicure.', null, null);
INSERT INTO `service_detail` VALUES ('66', '6', 'ATHENA COMBO', '', '100', null, null, null, '', null, null);
