/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - skyblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`skyblog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `skyblog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` varchar(40) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `catatgory_id` varchar(40) NOT NULL,
  `readcount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_article` (`catatgory_id`),
  CONSTRAINT `FK_article` FOREIGN KEY (`catatgory_id`) REFERENCES `catagory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article` */

/*Table structure for table `article_tag` */

DROP TABLE IF EXISTS `article_tag`;

CREATE TABLE `article_tag` (
  `id` varchar(40) NOT NULL,
  `article_id` varchar(40) NOT NULL,
  `tag_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `article_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article_tag` */

/*Table structure for table `catagory` */

DROP TABLE IF EXISTS `catagory`;

CREATE TABLE `catagory` (
  `id` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `catagory` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `guestname` varchar(30) NOT NULL,
  `article_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tag` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(40) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`nickname`,`email`,`telephone`,`image`) values ('1','900324','900324','nl',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
