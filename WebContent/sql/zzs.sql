/*
Navicat MySQL Data Transfer

Source Server         : mysql505
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : zzs

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2020-06-11 10:39:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '留言的商品id',
  `uid` int(10) NOT NULL COMMENT '留言用户id',
  `content` varchar(50) DEFAULT NULL COMMENT '留言的内容',
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '4', '1', '这是我的留言', '2020-03-27 09:03:21');
INSERT INTO `comment` VALUES ('2', '4', '1', '这是第二个留言了', '2020-03-27 09:10:53');
INSERT INTO `comment` VALUES ('3', '4', '1', 'test', '2020-03-27 09:14:18');
INSERT INTO `comment` VALUES ('4', '4', '1', 'test2', '2020-03-27 09:15:54');
INSERT INTO `comment` VALUES ('5', '4', '1', 'test3', '2020-03-27 09:17:00');
INSERT INTO `comment` VALUES ('6', '4', '1', '5.1', '2020-05-01 13:14:41');
INSERT INTO `comment` VALUES ('7', '6', '1', '', '2020-05-01 17:41:16');
INSERT INTO `comment` VALUES ('8', '4', '2', 'hahah', '2020-05-01 17:50:20');
INSERT INTO `comment` VALUES ('9', '5', '2', 'wo shi 4444', '2020-05-03 15:54:18');

-- ----------------------------
-- Table structure for `my_collect`
-- ----------------------------
DROP TABLE IF EXISTS `my_collect`;
CREATE TABLE `my_collect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `pid` int(10) NOT NULL COMMENT '产品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_collect
-- ----------------------------
INSERT INTO `my_collect` VALUES ('11', '1', '2');
INSERT INTO `my_collect` VALUES ('12', '1', '7');
INSERT INTO `my_collect` VALUES ('13', '1', '32');
INSERT INTO `my_collect` VALUES ('14', '1', '4');
INSERT INTO `my_collect` VALUES ('15', '1', '5');
INSERT INTO `my_collect` VALUES ('16', '1', '6');
INSERT INTO `my_collect` VALUES ('17', '1', '13');
INSERT INTO `my_collect` VALUES ('19', '2', '30');
INSERT INTO `my_collect` VALUES ('20', '2', '33');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '购买日期',
  `uid` int(10) NOT NULL COMMENT '买家id',
  `cid` int(10) NOT NULL COMMENT '卖家id',
  `pid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2020-03-25 10:19:44', '1', '1', '3');
INSERT INTO `orders` VALUES ('2', '2020-04-22 14:12:49', '1', '1', '31');
INSERT INTO `orders` VALUES ('3', '2020-05-01 17:38:25', '1', '2', '7');
INSERT INTO `orders` VALUES ('4', '2020-05-01 17:52:09', '2', '1', '4');
INSERT INTO `orders` VALUES ('5', '2020-05-01 18:01:49', '2', '1', '15');
INSERT INTO `orders` VALUES ('6', '2020-05-01 18:57:57', '2', '1', '11');
INSERT INTO `orders` VALUES ('7', '2020-05-01 19:06:46', '2', '1', '24');
INSERT INTO `orders` VALUES ('8', '2020-05-01 19:24:07', '2', '1', '20');
INSERT INTO `orders` VALUES ('9', '2020-05-03 15:43:07', '2', '1', '30');
INSERT INTO `orders` VALUES ('10', '2020-05-05 18:58:58', '2', '1', '25');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '商品详细信息',
  `price` double NOT NULL,
  `sort` int(10) NOT NULL COMMENT '商品类别',
  `uid` int(10) NOT NULL COMMENT '发布用户id',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '商品是否被下架',
  `image` varchar(255) NOT NULL COMMENT '商品图片地址',
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'jerry222', '222', '2222', '22', '1', '0', '2', '2020-03-23 10:45:26');
INSERT INTO `product` VALUES ('2', 'sdgsg', '222', '2222', '1', '1', '0', 'gwgsf', '2020-03-23 11:05:20');
INSERT INTO `product` VALUES ('3', 'myproduct', 'test', '10', '1', '1', '0', 'd', '2020-03-23 11:06:49');
INSERT INTO `product` VALUES ('4', 'myproduct', 'test', '10', '1', '1', '0', 'd', '2020-03-23 11:11:49');
INSERT INTO `product` VALUES ('5', '22222', '2222', '22222', '2', '1', '1', '2', '2020-03-23 11:19:08');
INSERT INTO `product` VALUES ('7', '一个商品', '我是一个测试商品', '40', '2', '2', '0', '444', '2020-03-25 10:55:46');
INSERT INTO `product` VALUES ('8', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:04');
INSERT INTO `product` VALUES ('9', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:08');
INSERT INTO `product` VALUES ('10', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:09');
INSERT INTO `product` VALUES ('11', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:10');
INSERT INTO `product` VALUES ('12', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:10');
INSERT INTO `product` VALUES ('13', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:11');
INSERT INTO `product` VALUES ('14', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:12');
INSERT INTO `product` VALUES ('15', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:13');
INSERT INTO `product` VALUES ('16', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:25');
INSERT INTO `product` VALUES ('17', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:26');
INSERT INTO `product` VALUES ('18', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:27');
INSERT INTO `product` VALUES ('19', 'test', 'test', '10', '1', '1', '0', 'd', '2020-04-21 19:19:27');
INSERT INTO `product` VALUES ('20', 'shangchuan', 'shangchuantup', '500', '1', '1', '0', '77b98dae-21d6-4cb8-92e6-ca8245634cd0.png', '2020-04-21 21:47:04');
INSERT INTO `product` VALUES ('21', 'tpy', '112412412412', '2232', '1', '1', '1', 'fb95cf4c-1c1f-4666-8b64-0d4b1e657a08.png', '2020-04-21 21:48:51');
INSERT INTO `product` VALUES ('22', 'test', '', '11', '1', '1', '0', 'a835c4bb-fc48-40e9-bdc1-bbb384572ab9.png', '2020-04-21 21:51:47');
INSERT INTO `product` VALUES ('23', 'test', '1213412', '20', '1', '1', '0', '6af943e7-0920-4300-9124-b1955bd1e143.png', '2020-04-21 21:55:09');
INSERT INTO `product` VALUES ('24', 'test', '21231', '11', '1', '1', '0', 'd2a80128-960c-4e51-a696-bb1ce1872bb1.png', '2020-04-21 21:56:08');
INSERT INTO `product` VALUES ('25', '12414', '', '11', '1', '1', '0', '41557f40-f716-408c-b344-df61a0700840.png', '2020-04-21 21:58:10');
INSERT INTO `product` VALUES ('26', 'test', '', '20', '2', '1', '1', 'fd2e6250-8f30-4e95-8e85-104fac16c292.png', '2020-04-21 21:58:56');
INSERT INTO `product` VALUES ('27', 'test', '', '20', '1', '1', '1', '4c5fa3c5-7dbd-43ab-916d-d330cb3d31e6.jpg', '2020-04-21 22:10:27');
INSERT INTO `product` VALUES ('28', 'test', '', '20', '1', '1', '1', '6c2104f6-9077-46b4-baaa-361c3e963a5d.png', '2020-04-21 22:23:22');
INSERT INTO `product` VALUES ('29', 'test', '', '20', '1', '1', '1', '21366aef-25c1-4c72-82d1-9c33fb42fae6.png', '2020-04-21 22:25:18');
INSERT INTO `product` VALUES ('30', 'test', '', '20', '1', '1', '0', '3f9dac88-6e5d-4855-9d64-504f87be95c7.png', '2020-04-21 22:30:53');
INSERT INTO `product` VALUES ('31', 'tpy', '1111', '10000', '3', '1', '0', '61f3ee95-ad05-419f-8f83-60c00aa0e2db.png', '2020-04-22 14:10:33');
INSERT INTO `product` VALUES ('32', 'hhahahah', 'gagagaga', '2222', '1', '1', '1', '01ccf7a5-bcaf-4eaa-8418-743138d0b554.png', '2020-04-22 14:15:23');
INSERT INTO `product` VALUES ('33', '测试商品', '我的测试商品', '50', '4', '2', '1', 'd6051e22-fc20-4bf7-8a8e-cadeaa564331.png', '2020-05-03 16:29:50');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sno` varchar(20) NOT NULL COMMENT '学号',
  `password` varchar(20) NOT NULL,
  `clazz` varchar(20) DEFAULT NULL COMMENT '班级',
  `address` varchar(20) DEFAULT NULL COMMENT '地址',
  `username` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `question` varchar(50) NOT NULL COMMENT '安全问题',
  `answer` varchar(50) NOT NULL COMMENT '安全问题的答案',
  `balance` double(10,2) DEFAULT NULL COMMENT '账号余额',
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2220162025', '123', '1', 'yinghu5', '张三', '1', '11', '22', '1531.00', '2020-05-01 18:00:30');
INSERT INTO `user` VALUES ('2', '444', '666', '111', 'ga', '李四', '1', '11', '22', '1489.00', '2020-05-01 18:00:30');
INSERT INTO `user` VALUES ('3', '', '', '', '', '', '', '', '', '5000.00', '2020-06-02 09:40:01');
INSERT INTO `user` VALUES ('5', 'asfasf', 'sa', '', '', '', '', '', '', '5000.00', '2020-06-02 09:51:14');
INSERT INTO `user` VALUES ('6', 'afaf', 'sa', '', '', '', '', '', '', '5000.00', '2020-06-02 09:51:48');
