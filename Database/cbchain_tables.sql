/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - secureblckcloud
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `secureblckcloud`;

USE `secureblckcloud`;

/*Table structure for table `blockchain` */

DROP TABLE IF EXISTS `blockchain`;

CREATE TABLE `blockchain` (
  `id` int(11) NOT NULL auto_increment,
  `loginuser` varchar(100) NOT NULL,
  `currenthash` varchar(1000) NOT NULL,
  `previoushash` varchar(1000) NOT NULL,
  `data` varchar(100) NOT NULL,
  `trnstimestamp` mediumtext,
  `nonce` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cloudfiles` */

DROP TABLE IF EXISTS `cloudfiles`;

CREATE TABLE `cloudfiles` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(100) NOT NULL,
  `filetype` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `filezie` mediumtext,
  `originalname` varchar(100) NOT NULL,
  `filedata` longblob,
  `cdate` date default NULL,
  `price` float default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `registrations` */

DROP TABLE IF EXISTS `registrations`;

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL auto_increment,
  `custname` varchar(100) NOT NULL,
  `loginid` varchar(100) NOT NULL,
  `pswd` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `loginid` (`loginid`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `loginid_2` (`loginid`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `trnxdetails` */

DROP TABLE IF EXISTS `trnxdetails`;

CREATE TABLE `trnxdetails` (
  `id` int(11) NOT NULL auto_increment,
  `loginuser` varchar(100) NOT NULL,
  `fileid` int(11) default NULL,
  `nameoncard` varchar(100) NOT NULL,
  `price` float default NULL,
  `cardnumber` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `cardexpiry` varchar(100) NOT NULL,
  `blkplatform` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `fileid` (`fileid`,`loginuser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
