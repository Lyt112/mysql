/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.31 : Database - students
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`students` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `students`;

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `classid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级编号',
  `studentid` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生id',
  `time` date DEFAULT NULL COMMENT '进入班级的时间',
  KEY `studentid` (`studentid`),
  CONSTRAINT `studentid` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `class` */

insert  into `class`(`classid`,`studentid`,`time`) values 
('1','11','2023-01-12'),
('2','12','2023-01-11'),
('1','123','2023-01-12'),
('2','124','2023-01-11'),
('1','13','2023-01-12'),
('1','14','2023-01-12');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `studentid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `name` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `sex` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student` */

insert  into `student`(`studentid`,`name`,`sex`,`age`) values 
('11','lucy','男',18),
('12','李四','女',19),
('123','张三','男',18),
('124','dan','女',19),
('13','王五','男',20),
('14','王六','男',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
