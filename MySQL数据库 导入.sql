/*
MySQL Backup
Source Server Version: 5.5.47
Source Database: novel
Date: 2018/6/10 12:00:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `hitmoney`
-- ----------------------------
DROP TABLE IF EXISTS `hitmoney`;
CREATE TABLE `hitmoney` (
  `username` varchar(255) DEFAULT NULL,
  `bookID` varchar(255) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `month` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `novels`
-- ----------------------------
DROP TABLE IF EXISTS `novels`;
CREATE TABLE `novels` (
  `bookID` varchar(255) NOT NULL,
  `bookName` varchar(255) DEFAULT NULL,
  `bookWriter` varchar(255) DEFAULT NULL,
  `bookStatic` int(11) DEFAULT NULL,
  `bookZan` int(11) DEFAULT NULL,
  `bookInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `shelfs`
-- ----------------------------
DROP TABLE IF EXISTS `shelfs`;
CREATE TABLE `shelfs` (
  `userID` varchar(255) DEFAULT NULL,
  `bookID` varchar(255) DEFAULT NULL,
  `capture` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sortcount`
-- ----------------------------
DROP TABLE IF EXISTS `sortcount`;
CREATE TABLE `sortcount` (
  `kindName` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `money` double DEFAULT '0',
  `shelf` longtext,
  `zan` int(11) DEFAULT '10',
  `isWriter` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=gbk;

-- ----------------------------
--  Table structure for `zans`
-- ----------------------------
DROP TABLE IF EXISTS `zans`;
CREATE TABLE `zans` (
  `bookID` varchar(255) DEFAULT NULL,
  `zan` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `hitmoney` VALUES ('123','1011959522','34','1'), ('123','1011959522','6','2'), ('123','1011959522','67','1'), ('123','1011959522','6','2'), ('123','1011959522','563','1'), ('123','1011959522','3','2'), ('123','1011959522','12','1'), ('123','1011959522','234','2');
INSERT INTO `sortcount` VALUES ('xuanhuan','7'), ('qihuan','2'), ('wuxia','0'), ('xianxia','3'), ('dushi','6'), ('xianshi','3'), ('junshi','0'), ('lishi','3'), ('youxi','1'), ('tiyu','0'), ('kehuan','1'), ('lingyi','1');
INSERT INTO `users` VALUES ('21',NULL,'123','123','','','20',NULL,'4',NULL), ('22',NULL,'hhhhhhhh',NULL,NULL,NULL,'0',NULL,'10',NULL), ('23',NULL,'123123','','','','0',NULL,'10',NULL);
INSERT INTO `zans` VALUES ('1011959522','10'), ('1011976405','30'), ('1004608738','2'), ('1010734492','3');
