# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 11.0.5-MariaDB-1:11.0.5+maria~ubu2204)
# Database: zabbix
# Generation Time: 2025-03-25 02:22:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `surname` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(60) NOT NULL DEFAULT '',
  `url` varchar(2048) NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT 0,
  `autologout` varchar(32) NOT NULL DEFAULT '15m',
  `lang` varchar(7) NOT NULL DEFAULT 'default',
  `refresh` varchar(32) NOT NULL DEFAULT '30s',
  `theme` varchar(128) NOT NULL DEFAULT 'default',
  `attempt_failed` int(11) NOT NULL DEFAULT 0,
  `attempt_ip` varchar(39) NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT 0,
  `rows_per_page` int(11) NOT NULL DEFAULT 50,
  `timezone` varchar(50) NOT NULL DEFAULT 'default',
  `roleid` bigint(20) unsigned DEFAULT NULL,
  `userdirectoryid` bigint(20) unsigned DEFAULT NULL,
  `ts_provisioned` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `users_1` (`username`),
  KEY `users_2` (`userdirectoryid`),
  KEY `users_3` (`roleid`),
  CONSTRAINT `c_users_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE CASCADE,
  CONSTRAINT `c_users_2` FOREIGN KEY (`userdirectoryid`) REFERENCES `userdirectory` (`userdirectoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`userid`, `username`, `name`, `surname`, `passwd`, `url`, `autologin`, `autologout`, `lang`, `refresh`, `theme`, `attempt_failed`, `attempt_ip`, `attempt_clock`, `rows_per_page`, `timezone`, `roleid`, `userdirectoryid`, `ts_provisioned`)
VALUES
	(1,'Admin','Zabbix','Administrator','$2y$10$92nDno4n0Zm7Ej7Jfsz8WukBfgSS/U0QkIuu8WkJPihXBb2A1UrEK','',1,'0','default','30s','default',0,'',0,50,'default',3,NULL,0),
	(2,'guest','','','$2y$10$89otZrRNmde97rIyzclecuk6LwKAsHN0BcvoOKGjbT.BwMBfm7G06','',0,'15m','default','30s','default',0,'',0,50,'default',4,NULL,0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
