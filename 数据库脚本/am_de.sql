/*
SQLyog Ultimate v12.2.6 (64 bit)
MySQL - 5.5.53 : Database - am_de
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`am_de` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `am_de`;

/*Table structure for table `t_function` */

DROP TABLE IF EXISTS `t_function`;

CREATE TABLE `t_function` (
  `functionId` int(11) NOT NULL AUTO_INCREMENT,
  `functionParentId` int(11) DEFAULT NULL COMMENT '父功能Id',
  `functionName` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `functionUrl` varchar(1000) DEFAULT NULL COMMENT '功能URL',
  `functionIsParent` tinyint(1) DEFAULT NULL COMMENT '是否父节点',
  PRIMARY KEY (`functionId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='功能列表';

/*Data for the table `t_function` */

insert  into `t_function`(`functionId`,`functionParentId`,`functionName`,`functionUrl`,`functionIsParent`) values 
(2,0,'系统管理',NULL,1),
(3,5,'车辆类型管理','vehicle_type',1),
(5,0,'车源管理',NULL,1),
(8,0,'配货管理',NULL,1),
(9,8,'发货管理','order_manager',1),
(10,5,'车辆信息管理','vehicle_manager',1),
(11,5,'行车路线管理','route_manager',1),
(12,8,'车源路线管理','orderapply_manager',1),
(13,8,'订单确认','order_finish',1),
(29,2,'角色管理','role_manager',1),
(30,2,'用户信息管理','user',1),
(31,2,'库存分类管理','species',1),
(32,2,'库存信息管理','item',1),
(33,2,'汇总统计','sumorder',1);

/*Table structure for table `t_item` */

DROP TABLE IF EXISTS `t_item`;

CREATE TABLE `t_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `price` bigint(20) NOT NULL COMMENT '商品价格，单位为：分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '单位重量',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表';

/*Data for the table `t_item` */

insert  into `t_item`(`id`,`title`,`price`,`num`,`weight`,`cid`,`status`,`created`,`updated`) values 
(1,'夏普电视',77777,123,50.55,69,1,'2020-06-14 00:00:00','2020-06-14 13:54:09'),
(2,'华为手机',999,555,2.00,81,1,'2020-06-14 00:00:00','2020-06-14 13:54:00'),
(3,'三星手机',9999,664,5.00,81,1,'2020-06-14 00:00:00','2020-06-14 13:54:15'),
(4,'康佳电视',9999,100,7.00,69,1,'2020-06-14 00:00:00','2020-06-14 13:54:21'),
(5,'小说择天记2',88,188,0.55,109,1,'2020-06-14 00:00:00','2020-06-14 13:55:25'),
(6,'歌手专辑',100,100,2.00,111,3,'2020-06-14 00:00:00','2020-06-14 13:55:36'),
(7,'vivo手机 x9',1999,200,3.00,81,1,'2020-06-14 00:00:00','2020-06-14 13:55:44'),
(8,'华硕笔记本',99999,90,20.00,12,1,'2020-06-14 00:00:00','2020-06-14 13:55:51'),
(9,'薯片',1000,2222,12.00,76,1,'2020-06-14 00:00:00','2020-06-14 13:55:51'),
(10,'植物油',555,19999,2.00,79,1,'2020-06-14 00:00:00','2020-06-14 13:55:51'),
(11,'乐高汽车玩具',9999,1000,30.00,107,1,'2020-06-14 00:00:00','2020-06-14 13:55:51'),
(12,'华为P10',5999,100,10.00,81,3,'2020-06-14 00:00:00','2020-06-14 19:02:57'),
(13,'众泰汽车1',888888,12,1000.00,133,3,'2020-06-14 00:00:00','2020-06-14 19:28:53'),
(14,'苹果笔记本',9999,100,2.50,135,3,'2020-06-14 00:00:00','2020-06-14 14:47:13'),
(15,'苹果笔记本',10000,11,1.10,135,1,'2020-06-14 00:00:00',NULL);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderNum` varchar(255) DEFAULT NULL COMMENT '订单号',
  `orderOwer` varchar(255) DEFAULT NULL COMMENT '下单人',
  `orerOwerContact` varchar(255) DEFAULT NULL COMMENT '下单人联系方式',
  `orderOwerAddress` varchar(2048) DEFAULT NULL COMMENT '下单地址',
  `orderWeight` decimal(10,2) DEFAULT NULL COMMENT '订单总重',
  `orderCurrency` decimal(10,2) DEFAULT NULL COMMENT '订单总价',
  `orderCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `orderStatus` varchar(255) DEFAULT NULL COMMENT '1-等待发货 2-运输中 3-已完成',
  `vehicleId` int(11) DEFAULT NULL COMMENT '车辆ID',
  `routeId` int(11) DEFAULT NULL COMMENT '线路ID',
  PRIMARY KEY (`orderId`),
  KEY `orderNum` (`orderNum`) COMMENT '订单号索引'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `t_order` */

insert  into `t_order`(`orderId`,`orderNum`,`orderOwer`,`orerOwerContact`,`orderOwerAddress`,`orderWeight`,`orderCurrency`,`orderCreate`,`orderStatus`,`vehicleId`,`routeId`) values 
(5,'AiMyUdQHjVCTwpX','23423','547567567','sdfw',141.10,355552.00,'2020-06-14 00:00:00',NULL,NULL,2),
(6,'ZLF1LHvheoViZRZ','校长','125676575','郭德纲梵蒂冈的',1056.00,1625533.00,'2020-06-14 00:00:00','1',NULL,NULL),
(7,'OiAAVxqK4aXlXIA','asds','12323','3345',60.00,299997.00,'2020-06-14 00:00:00','1',NULL,NULL),
(8,'MssfwCnRtJvUxJM','dsad','2324345','dfsdfdsfsd',30.00,19990.00,'2020-06-14 00:00:00','3',1,1),
(9,'tw1QJjGXl9Ue7NK','都是','123243453','测试的佛挡杀佛',550.00,122765.00,'2020-06-14 16:22:22','1',NULL,NULL),
(10,'GklUYkdARVvnTKq','小吴','1895465464','上海市浦东新区1001',210.55,597770.00,'2020-06-14 19:11:45','3',4,3),
(12,'houZUhQtHqENxfg','小葛','15212345678','沭阳',31.10,19999.00,'2020-06-14 15:35:50','3',1,4),
(13,'eaVv7UwEZFo6Unp','abc','15288888888','沭阳路',5.00,9999.00,'2020-06-14 15:43:17','1',NULL,NULL),
(14,'zBXXPJr1gbFm8Vk','22','15212341234','沭阳花园',1.65,10088.00,'2020-06-14 15:43:55','1',NULL,NULL);

/*Table structure for table `t_orderdetail` */

DROP TABLE IF EXISTS `t_orderdetail`;

CREATE TABLE `t_orderdetail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderNum` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `itemId` int(11) DEFAULT NULL COMMENT '商品id',
  `itemNum` int(11) DEFAULT NULL COMMENT '数量',
  `orderCurrency` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `orderWeight` decimal(10,2) DEFAULT NULL COMMENT '订单重量',
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

/*Data for the table `t_orderdetail` */

insert  into `t_orderdetail`(`orderDetailId`,`orderNum`,`itemId`,`itemNum`,`orderCurrency`,`orderWeight`) values 
(11,'AiMyUdQHjVCTwpX',1,2,155554.00,101.10),
(12,'AiMyUdQHjVCTwpX',8,2,199998.00,40.00),
(13,'ZLF1LHvheoViZRZ',3,2,19998.00,10.00),
(14,'ZLF1LHvheoViZRZ',4,5,49995.00,35.00),
(15,'ZLF1LHvheoViZRZ',1,20,1555540.00,1011.00),
(16,'OiAAVxqK4aXlXIA',8,3,299997.00,60.00),
(17,'MssfwCnRtJvUxJM',7,10,19990.00,30.00),
(18,'tw1QJjGXl9Ue7NK',9,20,20000.00,240.00),
(19,'tw1QJjGXl9Ue7NK',11,10,99990.00,300.00),
(20,'tw1QJjGXl9Ue7NK',10,5,2775.00,10.00),
(21,'GklUYkdARVvnTKq',1,1,77777.00,50.55),
(22,'GklUYkdARVvnTKq',11,2,19998.00,60.00),
(23,'GklUYkdARVvnTKq',8,5,499995.00,100.00),
(24,'houZUhQtHqENxfg',15,1,10000.00,1.10),
(25,'houZUhQtHqENxfg',11,1,9999.00,30.00),
(26,'eaVv7UwEZFo6Unp',3,1,9999.00,5.00),
(27,'zBXXPJr1gbFm8Vk',15,1,10000.00,1.10),
(28,'zBXXPJr1gbFm8Vk',5,1,88.00,0.55);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleName` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `roleCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `t_role` */

insert  into `t_role`(`roleId`,`roleName`,`roleCreate`) values 
(1,'管理员','2020-06-14 00:00:00'),
(2,'订单管理员','2020-06-14 00:00:00'),
(3,'车辆管理员','2020-06-14 00:00:00'),
(4,'普通角色','2020-06-14 09:47:42'),
(5,'新角色1','2020-06-14 00:00:00'),
(6,'新角色2','2020-06-14 00:00:00'),
(7,'角色3','2020-06-14 19:26:18'),
(9,'角色1','2020-06-14 14:35:50'),
(11,'角色4','2020-06-14 00:00:00');

/*Table structure for table `t_role_function` */

DROP TABLE IF EXISTS `t_role_function`;

CREATE TABLE `t_role_function` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL COMMENT '角色Id',
  `functionId` int(11) DEFAULT NULL COMMENT '功能Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COMMENT='用户功能记录表';

/*Data for the table `t_role_function` */

insert  into `t_role_function`(`Id`,`roleId`,`functionId`) values 
(125,4,32),
(126,4,2),
(133,5,33),
(134,5,10),
(135,5,9),
(136,5,2),
(137,5,5),
(138,5,8),
(139,1,29),
(140,1,30),
(141,1,31),
(142,1,32),
(143,1,33),
(144,1,3),
(145,1,10),
(146,1,11),
(147,1,9),
(148,1,12),
(149,1,13),
(150,1,2),
(151,1,5),
(152,1,8),
(153,1,0),
(154,1,2),
(155,1,5),
(156,1,8),
(181,6,33),
(182,6,3),
(183,6,10),
(184,6,11),
(185,6,5),
(186,6,0),
(187,6,2),
(188,6,5),
(189,2,9),
(190,2,12),
(191,2,13),
(192,2,8),
(193,2,0),
(194,2,8),
(195,7,33),
(196,7,2),
(208,9,5),
(209,9,3),
(210,9,10),
(211,9,11),
(212,9,8),
(213,9,9),
(214,9,12),
(215,9,13),
(216,9,0),
(217,9,5),
(218,9,8),
(241,11,3),
(242,11,9),
(243,11,5),
(244,11,8);

/*Table structure for table `t_route` */

DROP TABLE IF EXISTS `t_route`;

CREATE TABLE `t_route` (
  `routeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `routeName` varchar(255) DEFAULT NULL COMMENT '路线名称',
  `routeDesc` varchar(2048) DEFAULT NULL COMMENT '路线描述',
  `routeCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`routeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='路线表';

/*Data for the table `t_route` */

insert  into `t_route`(`routeId`,`routeName`,`routeDesc`,`routeCreate`) values 
(1,'上海线路','上海-北京','2020-06-14 10:51:49'),
(2,'沪深线路','上海-深圳','2020-06-14 00:00:00'),
(3,'广州路线2','上海到广州','2017-04-26 00:00:00'),
(4,'沭阳路线','沭阳->宿迁','2020-06-14 15:20:22');

/*Table structure for table `t_species` */

DROP TABLE IF EXISTS `t_species`;

CREATE TABLE `t_species` (
  `speciesId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `speciesParentId` int(11) DEFAULT NULL COMMENT '父节点Id',
  `speciesName` varchar(255) DEFAULT NULL COMMENT '种类名称',
  `speciesTime` datetime DEFAULT NULL COMMENT '创建时间',
  `isParent` tinyint(1) DEFAULT NULL COMMENT '是否为父节点 0 否 1 是',
  PRIMARY KEY (`speciesId`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='类别表';

/*Data for the table `t_species` */

insert  into `t_species`(`speciesId`,`speciesParentId`,`speciesName`,`speciesTime`,`isParent`) values 
(6,0,'商品类别','2020-06-14 00:00:00',1),
(7,6,'图书、音像、电子书刊','2020-06-14 00:00:00',1),
(8,6,'家用电器','2020-06-14 00:00:00',1),
(9,6,'电脑、办公','2020-06-14 00:00:00',1),
(11,8,'大 家 电','2020-06-14 00:00:00',0),
(12,9,'电脑整机','2020-06-14 00:00:00',0),
(20,9,'电脑配件','2020-06-14 14:00:42',0),
(35,7,'英文原版','2020-06-14 14:00:42',0),
(39,6,'个护化妆','2020-06-14 14:00:42',1),
(60,6,'钟表','2020-06-14 14:44:25',1),
(62,39,'面部护肤','2020-06-14 14:53:38',0),
(63,39,'身体护肤','2020-06-14 14:53:47',0),
(64,39,'口腔护理','2020-06-14 14:53:52',0),
(65,8,'生活电器','2020-06-14 14:54:11',0),
(66,8,'厨房电器','2020-06-14 14:54:27',0),
(67,8,'个护健康','2020-06-14 14:54:35',0),
(68,60,'腕表','2020-06-14 15:00:44',0),
(69,8,'平板电视','2020-06-14 09:27:22',0),
(70,6,'母婴','2020-06-14 10:48:38',1),
(71,70,'奶粉','2020-06-14 10:48:49',0),
(72,70,'营养辅食','2020-06-14 10:49:01',0),
(73,70,'尿裤湿巾','2020-06-14 10:49:13',0),
(74,70,'喂养用品','2020-06-14 10:49:21',0),
(75,6,'食品饮料、保健食品','2020-06-14 15:26:33',1),
(76,75,'进口食品','2020-06-14 15:26:40',0),
(77,75,'地方特产','2020-06-14 15:26:47',0),
(78,75,'休闲食品','2020-06-14 15:27:00',0),
(79,75,'粮油调味','2020-06-14 15:27:06',0),
(80,6,'手机','2020-06-14 17:48:57',1),
(81,80,'手机通讯','2020-06-14 17:49:16',0),
(82,8,'空调','2020-06-14 17:51:03',0),
(83,80,'运营商','2020-06-14 18:54:23',0),
(84,6,'玩具乐器','2020-06-14 20:10:17',1),
(85,84,'娃娃玩具','2020-06-14 20:10:22',0),
(86,84,'模型玩具','2020-06-14 20:10:35',0),
(87,8,'冰箱','2020-06-14 20:18:03',0),
(88,39,'女性护理','2020-06-14 20:30:33',0),
(89,8,'洗衣机','2020-06-14 21:03:32',0),
(90,9,'外设产品','2020-06-14 21:13:07',0),
(91,9,'网络产品','2020-06-14 21:13:14',0),
(92,9,'办公设备','2020-06-14 21:13:20',0),
(93,9,'文具/耗材','2020-06-14 21:13:26',0),
(94,9,'服务产品','2020-06-14 21:13:34',0),
(95,39,'洗发护发','2020-06-14 21:14:17',0),
(96,39,'香水彩妆','2020-06-14 21:14:23',0),
(98,60,'摆钟','2020-06-14 21:19:30',0),
(99,70,'洗护用品','2020-06-14 21:20:15',0),
(100,70,'童车童床','2020-06-14 21:20:22',0),
(101,75,'饮料冲调','2020-06-14 21:21:13',0),
(102,75,'食品礼券','2020-06-14 21:21:19',0),
(103,75,'茗茶','2020-06-14 21:21:24',0),
(105,84,'健身玩具','2020-06-14 21:22:37',0),
(106,84,'动漫玩具','2020-06-14 21:22:42',0),
(107,84,'益智玩具','2020-06-14 21:22:47',0),
(108,84,'DIY玩具','2020-06-14 21:22:53',0),
(109,7,'电子书','2020-06-14 17:59:50',0),
(111,7,'音像','2020-06-14 18:18:12',0),
(112,6,'汽车','2020-06-14 18:36:46',1),
(118,112,'大众','2020-06-14 18:38:17',0),
(130,112,'奔驰2','2020-06-14 19:01:25',0),
(133,112,'众泰','2020-06-14 19:28:10',0),
(134,6,'类别1','2020-06-14 14:45:13',1),
(135,134,'类别1-11','2020-06-14 14:45:22',0);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userLoginId` varchar(255) DEFAULT NULL COMMENT '登录名称',
  `userLoginPasswd` varchar(255) DEFAULT NULL COMMENT '用户登录密码',
  `userSex` char(1) DEFAULT NULL COMMENT '用户性别',
  `userContact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `userEmail` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `CreateTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`userLoginId`,`userLoginPasswd`,`userSex`,`userContact`,`userEmail`,`CreateTime`) values 
(1,'admin111','admin111',NULL,'123456','123456@qq.com','2020-06-14 14:46:20'),
(3,'admin','123456',NULL,'18919901234','21321@qq.com','2020-06-14 14:46:20'),
(4,'user1','123',NULL,'18919901234','213@qq.com','2020-06-14 15:03:29'),
(5,'aaa','123',NULL,'18919901234','11@qq.com','2020-06-14 18:41:18'),
(7,'tom','123456',NULL,'18966876543','213423@dfjfl.com','2020-06-14 22:01:30'),
(8,'www','www',NULL,'18919901234','123@qq.com','2020-06-14 13:26:28'),
(9,'admin1','111',NULL,'1111','11','2020-06-14 00:00:00'),
(10,'0001','123',NULL,'18919901234','99@qq.com','2020-06-14 00:00:00'),
(12,'0002','456',NULL,'18919901234','999@qq.com','2020-06-14 17:59:31'),
(13,'0003','456',NULL,'18919901234','99@qq.com','2020-06-14 18:04:33'),
(14,'0004','456',NULL,'18919901234','1@qq.com','2020-06-14 18:10:26'),
(15,'0005','123',NULL,'3345346546','345435','2020-06-14 00:00:00'),
(16,'0006','456',NULL,'18919002131','34234@qq.com','2020-06-14 18:27:49'),
(17,'0007','456',NULL,'18919901234','1234234@qq.com','2020-06-14 18:54:20'),
(18,'0008','456',NULL,'18919901234','234234！@qqc.om','2020-06-14 19:19:54'),
(20,'user4','123456',NULL,'15244444444','44444@qq.com','2020-06-14 00:00:00');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `roleId` int(11) DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`Id`,`userId`,`roleId`) values 
(1,3,1),
(2,5,2),
(4,13,3),
(6,14,4),
(7,15,5),
(8,16,5),
(10,1,4),
(13,18,6),
(14,7,2),
(15,17,7),
(16,19,9),
(17,20,11);

/*Table structure for table `t_vehicle` */

DROP TABLE IF EXISTS `t_vehicle`;

CREATE TABLE `t_vehicle` (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicleOwerName` varchar(255) DEFAULT NULL COMMENT '车主姓名',
  `vehicleNum` varchar(512) DEFAULT NULL COMMENT '车牌号',
  `vehicleOwerContact` varchar(255) DEFAULT NULL COMMENT '车主联系方式',
  `vehicleOwerID` varchar(512) DEFAULT NULL COMMENT '证件号码',
  `vehicleDriverName` varchar(255) DEFAULT NULL COMMENT '司机姓名',
  `vehicleDriverID` varchar(512) DEFAULT NULL COMMENT '司机证件号',
  `vehicleTypeId` int(11) DEFAULT NULL COMMENT '车辆类型ID',
  `vehicleLoad` decimal(10,2) DEFAULT '0.00' COMMENT '载重',
  `vehicleStatus` varchar(255) DEFAULT NULL COMMENT '车辆状态 1-正常 2-维修中',
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='车辆基本信息';

/*Data for the table `t_vehicle` */

insert  into `t_vehicle`(`vehicleId`,`vehicleOwerName`,`vehicleNum`,`vehicleOwerContact`,`vehicleOwerID`,`vehicleDriverName`,`vehicleDriverID`,`vehicleTypeId`,`vehicleLoad`,`vehicleStatus`) values 
(1,'小李','沪123456','123982923','1313121312321','小王','765432234567887',3,55.00,'1'),
(2,'张三','2343543','18929311232','27664832472879','李四','67853223434663',5,100.00,'2'),
(3,'王五','2343242','1891999012312','23456765432345677','小李','3456432655',4,80.00,'1'),
(4,'小小','Mh987677','3546656767','2343756786867867','lili','56863456345345',3,2000.00,'1'),
(5,'user4','苏A-001','15244444444','4444444444444','小4','444444444444',6,44.00,'1');

/*Table structure for table `t_vehicletype` */

DROP TABLE IF EXISTS `t_vehicletype`;

CREATE TABLE `t_vehicletype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typeName` varchar(255) DEFAULT NULL COMMENT '车辆型号名称',
  `typeCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='车辆型号';

/*Data for the table `t_vehicletype` */

insert  into `t_vehicletype`(`typeId`,`typeName`,`typeCreate`) values 
(1,'奥迪','2020-06-14 16:22:36'),
(2,'一汽大众','2020-06-14 00:00:00'),
(3,'广汽丰田','2020-06-14 16:22:55'),
(4,'五菱宏光','2020-06-14 10:58:12'),
(5,'大型货车','2020-06-14 10:58:25'),
(6,'奔驰','2020-06-14 15:19:10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
