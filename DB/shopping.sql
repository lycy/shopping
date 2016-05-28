/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-28 10:37:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categroy`
-- ----------------------------
DROP TABLE IF EXISTS `categroy`;
CREATE TABLE `categroy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CC` (`pid`) USING BTREE,
  CONSTRAINT `FK_CC` FOREIGN KEY (`pid`) REFERENCES `categroy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categroy
-- ----------------------------
INSERT INTO `categroy` VALUES ('0', '0', '0', null, '0');
INSERT INTO `categroy` VALUES ('4', '家用电器', '加用电器描述', '0', '1');
INSERT INTO `categroy` VALUES ('7', '手机/数码', '手机/数码描述', '0', '1');
INSERT INTO `categroy` VALUES ('9', '手机配件', '手机配件描述', '7', '2');
INSERT INTO `categroy` VALUES ('10', '电池/移动电源', '电池/移动电源描述', '9', '3');
INSERT INTO `categroy` VALUES ('11', '电脑办公', '电脑/办公描述', '0', '1');
INSERT INTO `categroy` VALUES ('12', '家居', '家居描述', '0', '1');
INSERT INTO `categroy` VALUES ('13', '服饰', '服饰描述', '0', '1');
INSERT INTO `categroy` VALUES ('14', '食品', '食品描述', '0', '1');
INSERT INTO `categroy` VALUES ('15', '图书', '图书描述', '0', '1');
INSERT INTO `categroy` VALUES ('16', '运动', '运动描述', '0', '1');
INSERT INTO `categroy` VALUES ('17', '医药保健', '医药保健描述', '0', '1');
INSERT INTO `categroy` VALUES ('18', '摄影摄像', '摄影摄像描述', '7', '2');
INSERT INTO `categroy` VALUES ('19', '数码配件', '数码配件', '7', '2');
INSERT INTO `categroy` VALUES ('20', '智能设备', '智能设备', '7', '2');
INSERT INTO `categroy` VALUES ('21', '影音娱乐', '影音娱乐', '7', '2');
INSERT INTO `categroy` VALUES ('23', '充电器/数据线', '充电器/数据线描述', '9', '3');
INSERT INTO `categroy` VALUES ('24', '电脑配件', '电脑配件描述', '11', '2');
INSERT INTO `categroy` VALUES ('25', '大家电', '大家电描述', '4', '2');
INSERT INTO `categroy` VALUES ('26', '厨卫大电', '厨卫大电描述', '4', '2');
INSERT INTO `categroy` VALUES ('27', '女装', '女装描述', '13', '2');
INSERT INTO `categroy` VALUES ('29', '平板电视', '平板电视描述', '25', '3');
INSERT INTO `categroy` VALUES ('30', '冰箱', '冰箱描述', '25', '3');
INSERT INTO `categroy` VALUES ('31', '燃气灶', '燃气灶描述', '26', '3');
INSERT INTO `categroy` VALUES ('38', '休闲食品', '休闲食品描述', '14', '2');
INSERT INTO `categroy` VALUES ('40', '人文社科', '人文社科描述', '15', '2');
INSERT INTO `categroy` VALUES ('41', '家用空调', '家用空调描述', '25', '3');
INSERT INTO `categroy` VALUES ('45', '手机通讯', '手机通讯描述', '7', '2');
INSERT INTO `categroy` VALUES ('46', '手机', '手机描述', '45', '3');
INSERT INTO `categroy` VALUES ('48', '对讲机', '对讲机描述', '45', '3');
INSERT INTO `categroy` VALUES ('49', '数码相机', '数码相机描述', '18', '3');
INSERT INTO `categroy` VALUES ('52', '单反相机', '单反相机', '18', '3');
INSERT INTO `categroy` VALUES ('53', '摄像机', '摄像机', '18', '3');
INSERT INTO `categroy` VALUES ('55', '贴膜', '贴膜描述', '9', '3');
INSERT INTO `categroy` VALUES ('56', '手机耳机', '手机耳机描述', '9', '3');
INSERT INTO `categroy` VALUES ('57', '厨房小电', '厨房小电描述', '4', '2');
INSERT INTO `categroy` VALUES ('58', '生活电器', '生活电器描述', '4', '2');
INSERT INTO `categroy` VALUES ('59', '五金家装', '五金家装描述', '4', '2');
INSERT INTO `categroy` VALUES ('60', '个护健康', '个护健康描述', '4', '2');
INSERT INTO `categroy` VALUES ('61', '电脑整件', '电脑整件描述', '11', '2');
INSERT INTO `categroy` VALUES ('62', '外设产品', '外设产品描述', '11', '2');
INSERT INTO `categroy` VALUES ('63', '游戏设备', '游戏设备描述', '11', '2');
INSERT INTO `categroy` VALUES ('64', '办公设备', '办公设备描述', '11', '2');
INSERT INTO `categroy` VALUES ('65', '文具耗材', '文具耗材描述', '11', '2');
INSERT INTO `categroy` VALUES ('66', '家具', '家具描述', '12', '2');
INSERT INTO `categroy` VALUES ('67', '水果', '水果描述', '14', '2');
INSERT INTO `categroy` VALUES ('77', '运动鞋包', '运动鞋包描述', '16', '2');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `marketprice` double(255,0) DEFAULT NULL,
  `pdate` varchar(255) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `promote` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CP` (`categoryID`) USING BTREE,
  CONSTRAINT `FK_CP` FOREIGN KEY (`categoryID`) REFERENCES `categroy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小米红米3', '10', '小米 红米Note3 全网通版 2GB+16GB 金色 移动联通电信4G手机 双卡双待', '900', '2016-5-10 20:26:59', '46', 'front/pImage/56a641b2N51ff0d1e.jpg', '是');
INSERT INTO `product` VALUES ('2', '小米Note', '10', '小米Note描述', '1400', '2016-5-10 20:31:11', '46', 'front/pImage/572b2ad8Nee2e7494.jpg', '否');
INSERT INTO `product` VALUES ('3', 'OPPOR9', '10', 'OPPOR9描述', '2800', '2016-5-10 20:34:56', '46', 'front/pImage/56e987efN32aa204c.jpg', '是');
INSERT INTO `product` VALUES ('4', '魅蓝metal', '55', '魅族 魅蓝metal 16GB 白色 移动联通双4G手机 双卡双待', '1000', '2016-5-11 10:51:00', '46', 'front/pImage/56554e8dNd4550125.jpg', '否');
INSERT INTO `product` VALUES ('5', '宝锋BF-888S', '44', '宝锋BF-888S 描述', '100', '2016-5-11 10:51:11', '48', 'front/pImage/566903d7N17e9c54c.jpg', '是');
INSERT INTO `product` VALUES ('8', '美的(Midea) BCD-206TM(E)', '55', '美的(Midea) BCD-206TM(E) 206升 三门冰箱 节能保鲜 闪白银', '1300', '2016-5-11 11:28:38', '30', 'front/pImage/573ab168N7e05c4ee.jpg', '否');
INSERT INTO `product` VALUES ('9', 'vivo X6S', '50', 'vivoX6S全网通4GB+64GB移动联通电信4G手机双卡双待金色', '2498', '2016-5-11 19:05:15', '46', 'front/pImage/56e62743N67900eb3.jpg', '否');
INSERT INTO `product` VALUES ('10', '万华 HTD ', '20', '万华 HTD 专业商用手台民用对讲机 WH36实惠版(火爆促销)\r\n  \r\n', '250', '2016-5-12 16:13:14', '48', 'front/pImage/5599e538N73d24dbc.jpg', '否');
INSERT INTO `product` VALUES ('11', 'Apple iPhone 6s ', '23', 'Apple iPhone 6s (A1700) 64G 深空灰色 移动联通电信4G手机', '5688', '2016-5-14 14:26:49', '46', 'front/pImage/56374dd5Nacbe7098.jpg', '是');
INSERT INTO `product` VALUES ('12', '乐视X620', '234', '乐视（Le）乐2（X620）32GB 金色 移动联通电信4G手机 双卡双待', '1099', '2016-5-14 14:27:34', '46', 'front/pImage/12.jpg', '是');
INSERT INTO `product` VALUES ('13', '华为荣耀6 Plus', '24', '荣耀 6 Plus (PE-TL20) 3GB+16GB内存版 黑色 移动4G手机 双卡双待双通', '1399', '2016-5-14 14:28:53', '46', 'front/pImage/554c7629Nc668fc70.jpg', '否');
INSERT INTO `product` VALUES ('14', '华为畅享5S', '54', '华为 畅享5S 金色 移动联通电信4G手机 双卡双待', '1199', '2016-5-14 14:30:56', '46', 'front/pImage/5680a02dN848c1634.jpg', '是');
INSERT INTO `product` VALUES ('15', '三星Galaxy S7 edge', '32', '三星 Galaxy S7 edge（G9350）32G版 铂光金移动联通电信4G手机 双卡双待 骁龙820手机', '5688', '2016-5-14 14:31:53', '46', 'front/pImage/56d51a42Nd86f1c8e.jpg', '是');
INSERT INTO `product` VALUES ('16', '华为Mate8', '234', '华为 Mate 8 4GB+128GB版 香槟金 移动联通电信4G手机 双卡双待', '4399', '2016-5-14 14:33:08', '46', 'front/pImage/565567eaN532f2fda.jpg', '否');
INSERT INTO `product` VALUES ('17', '摩托罗拉T50', '23', '摩托罗拉T50免执照公众对讲机 两只装 情侣设计款', '499', '2016-5-22 20:40:00', '48', 'front/pImage/551b4940Nc4b1fb39.jpg', '否');
INSERT INTO `product` VALUES ('18', 'TET6800 户外专业对讲机', '12', 'TET6800 户外专业对讲机 精英版', '298', '2016-5-24 20:55:59', '48', 'front/pImage/55366e2bN042d4196.png', '否');
INSERT INTO `product` VALUES ('19', 'TCLBCD-118KA9', '44', 'TCL BCD-118KA9 118升 双门冰箱 LED照明 金属面板（芭蕾白）', '699', '2016-5-26 16:28:15', '30', 'front/pImage/571f2100N012fdbf4.jpg', '是');
INSERT INTO `product` VALUES ('20', ' 樱花(sakura)BCD-98', '32', '樱花(sakura)BCD-98 98升 双门 迷你 小冰箱 家用 冷藏冷冻小型电冰箱', '23', '2016-5-26 20:10:59', '30', 'front/pImage/5559a4eaN26a507aa.jpg', '否');

-- ----------------------------
-- Table structure for `salesitem`
-- ----------------------------
DROP TABLE IF EXISTS `salesitem`;
CREATE TABLE `salesitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `unitprice` double(255,0) DEFAULT NULL,
  `pnumber` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PS` (`productId`) USING BTREE,
  KEY `FK_OS` (`orderId`) USING BTREE,
  CONSTRAINT `FK_OS` FOREIGN KEY (`orderId`) REFERENCES `salesorder` (`id`),
  CONSTRAINT `FK_PS` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salesitem
-- ----------------------------
INSERT INTO `salesitem` VALUES ('1', '2', '1400', '1', '1');
INSERT INTO `salesitem` VALUES ('2', '2', '1400', '3', '2');
INSERT INTO `salesitem` VALUES ('3', '10', '250', '2', '2');
INSERT INTO `salesitem` VALUES ('4', '4', '1000', '1', '3');
INSERT INTO `salesitem` VALUES ('5', '13', '1399', '2', '3');
INSERT INTO `salesitem` VALUES ('6', '5', '100', '1', '4');
INSERT INTO `salesitem` VALUES ('7', '1', '900', '1', '5');
INSERT INTO `salesitem` VALUES ('8', '3', '2800', '1', '6');

-- ----------------------------
-- Table structure for `salesorder`
-- ----------------------------
DROP TABLE IF EXISTS `salesorder`;
CREATE TABLE `salesorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `totals` double(255,0) DEFAULT NULL,
  `odate` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_US` (`userId`) USING BTREE,
  CONSTRAINT `FK_US` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salesorder
-- ----------------------------
INSERT INTO `salesorder` VALUES ('1', '1', '重庆', '1400', '2016-5-19 17:15:43', '0');
INSERT INTO `salesorder` VALUES ('2', '13', '重庆', '4700', '2016-5-19 17:20:56', '0');
INSERT INTO `salesorder` VALUES ('3', '1', '重庆', '3798', '2016-5-20 16:39:32', '0');
INSERT INTO `salesorder` VALUES ('4', '1', '重庆', '100', '2016-5-20 17:20:01', '0');
INSERT INTO `salesorder` VALUES ('5', '1', '重庆', '900', '2016-5-22 18:42:00', '0');
INSERT INTO `salesorder` VALUES ('6', '12', '重庆', '2800', '2016-5-26 9:28:13', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `rdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '123', '男', '123445', '重庆', '2016-04-13 00:00:00');
INSERT INTO `user` VALUES ('7', 'Tom', '12qazwsx', '男', '12239434', '上海', '2016-4-18 20:37:00');
INSERT INTO `user` VALUES ('8', '赵氏', '222222', '女', '12239434', '上海', '2016-4-18 20:37:57');
INSERT INTO `user` VALUES ('9', '赵四', '111111', '女', '17285434872', '重庆', '2016-4-18 20:37:57');
INSERT INTO `user` VALUES ('10', '张伟', '123qwe', '男', '1242346565', '重庆', '2016-4-21 16:02:40');
INSERT INTO `user` VALUES ('12', '樊飞', '222222', '男', '2356246332', '北京', '2016-4-22 16:23:01');
INSERT INTO `user` VALUES ('13', '王敏', '111111', '女', '13647593844', '重庆北碚', '2016-4-24 23:12:55');
INSERT INTO `user` VALUES ('14', '张敏', 'ssssssss', '女', '1234578224', '重庆北碚', '2016-4-25 9:34:13');
INSERT INTO `user` VALUES ('16', '赵丁山', '1111111', '男', '18547295432', '重庆綦江', '2016-04-13 00:00:00');
INSERT INTO `user` VALUES ('17', '杨洋', '1111111', '男', '18547295432', '重庆綦江', '2016-04-13 00:00:00');
INSERT INTO `user` VALUES ('18', '李伟', '111111', '男', '1232344773', '重庆北碚', '2016-5-5 10:59:38');
INSERT INTO `user` VALUES ('21', '张阳', 'ssssss', '男', '13647593844', '重庆北碚', '2016-5-21 13:09:48');
INSERT INTO `user` VALUES ('22', '李世东', 'aaaaaa', '男', '18863578433', '北京', '2016-5-21 13:16:00');
