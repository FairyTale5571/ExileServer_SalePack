/*
Navicat MySQL Data Transfer

Source Server         : exile
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : exile_forsale

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-11-30 03:47:23
*/

-- Dumping database structure for exile
CREATE DATABASE IF NOT EXISTS `exile` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `exile`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `uid` varchar(32) NOT NULL,
  `clan_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) unsigned NOT NULL DEFAULT '0',
  `deaths` int(11) unsigned NOT NULL DEFAULT '0',
  `locker` int(11) NOT NULL DEFAULT '0',
  `first_connect_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_connect_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_disconnect_at` datetime DEFAULT NULL,
  `last_reward_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `total_connections` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  KEY `clan_id` (`clan_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `bounties`
-- ----------------------------
DROP TABLE IF EXISTS `bounties`;
CREATE TABLE `bounties` (
  `uid` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `bounty` text NOT NULL,
  `bountyLock` int(1) NOT NULL DEFAULT '0',
  `bountyContract` text NOT NULL,
  `bountyContractCompleted` text NOT NULL,
  `friends` text NOT NULL,
  `friend_last_reset_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_immunity_applied_at` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `clan`
-- ----------------------------
DROP TABLE IF EXISTS `clan`;
CREATE TABLE `clan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `leader_uid` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `leader_uid` (`leader_uid`),
  CONSTRAINT `clan_ibfk_1` FOREIGN KEY (`leader_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clan
-- ----------------------------

-- ----------------------------
-- Table structure for `clan_map_marker`
-- ----------------------------
DROP TABLE IF EXISTS `clan_map_marker`;
CREATE TABLE `clan_map_marker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clan_id` int(11) unsigned NOT NULL,
  `markerType` tinyint(4) NOT NULL DEFAULT '-1',
  `positionArr` text NOT NULL,
  `color` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `iconSize` float unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `labelSize` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clan_id` (`clan_id`),
  CONSTRAINT `clan_map_marker_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clan_map_marker
-- ----------------------------

-- ----------------------------
-- Table structure for `construction`
-- ----------------------------
DROP TABLE IF EXISTS `construction`;
CREATE TABLE `construction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `damage` tinyint(1) unsigned DEFAULT '0',
  `territory_id` int(11) unsigned DEFAULT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `texture` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `territory_id` (`territory_id`),
  CONSTRAINT `construction_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `construction_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of construction
-- ----------------------------

-- ----------------------------
-- Table structure for `container`
-- ----------------------------
DROP TABLE IF EXISTS `container`;
CREATE TABLE `container` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '1',
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `territory_id` int(11) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `abandoned` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `territory_id` (`territory_id`),
  CONSTRAINT `container_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `container_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of container
-- ----------------------------
INSERT INTO `container` VALUES ('1', 'Exile_Container_Safe', '2017-10-17 01:52:00', '76561198055124016', '0', '16347.0703125', '18346.00390625', '-0.0112705', '-0.00183019', '-0.999998', '0', '0', '0', '1', '[[],[]]', '[]', '[]', '[]', '2017-11-08 20:09:52', '0000', null, null, '0', '2017-11-08 20:09:52');

-- ----------------------------
-- Table structure for `marxet`
-- ----------------------------
DROP TABLE IF EXISTS `marxet`;
CREATE TABLE `marxet` (
  `listingID` varchar(8) NOT NULL,
  `itemAvailable` tinyint(1) NOT NULL DEFAULT '1',
  `itemArray` text NOT NULL,
  `price` double NOT NULL,
  `sellerUID` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`listingID`),
  KEY `listingID` (`listingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marxet
-- ----------------------------

-- ----------------------------
-- Table structure for `player`
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hunger` double unsigned NOT NULL DEFAULT '100',
  `thirst` double unsigned NOT NULL DEFAULT '100',
  `alcohol` double unsigned NOT NULL DEFAULT '0',
  `temperature` double NOT NULL DEFAULT '37',
  `wetness` double unsigned NOT NULL DEFAULT '0',
  `oxygen_remaining` double unsigned NOT NULL DEFAULT '1',
  `bleeding_remaining` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` varchar(1024) NOT NULL DEFAULT '[]',
  `direction` double NOT NULL DEFAULT '0',
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_items` text NOT NULL,
  `backpack` varchar(64) NOT NULL,
  `backpack_items` text NOT NULL,
  `backpack_magazines` text NOT NULL,
  `backpack_weapons` text NOT NULL,
  `current_weapon` varchar(64) NOT NULL,
  `goggles` varchar(64) NOT NULL,
  `handgun_items` text NOT NULL,
  `handgun_weapon` varchar(64) NOT NULL,
  `headgear` varchar(64) NOT NULL,
  `binocular` varchar(64) NOT NULL,
  `loaded_magazines` text NOT NULL,
  `primary_weapon` varchar(64) NOT NULL,
  `primary_weapon_items` text NOT NULL,
  `secondary_weapon` varchar(64) NOT NULL,
  `secondary_weapon_items` text NOT NULL,
  `uniform` varchar(64) NOT NULL,
  `uniform_items` text NOT NULL,
  `uniform_magazines` text NOT NULL,
  `uniform_weapons` text NOT NULL,
  `vest` varchar(64) NOT NULL,
  `vest_items` text NOT NULL,
  `vest_magazines` text NOT NULL,
  `vest_weapons` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_uid` (`account_uid`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `player_history`
-- ----------------------------
DROP TABLE IF EXISTS `player_history`;
CREATE TABLE `player_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `died_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `positionKiller` double NOT NULL,
  `positionVictim` double NOT NULL,
  `killer` varchar(64) NOT NULL,
  `kUID` varchar(32) NOT NULL,
  `distance` int(11) NOT NULL,
  `weapon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `territory`
-- ----------------------------
DROP TABLE IF EXISTS `territory`;
CREATE TABLE `territory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `position_x` double NOT NULL,
  `position_y` double NOT NULL,
  `position_z` double NOT NULL,
  `radius` double NOT NULL,
  `level` int(11) NOT NULL,
  `flag_texture` varchar(255) NOT NULL,
  `flag_stolen` tinyint(1) NOT NULL DEFAULT '0',
  `flag_stolen_by_uid` varchar(32) DEFAULT NULL,
  `flag_stolen_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_paid_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `xm8_protectionmoney_notified` tinyint(1) NOT NULL DEFAULT '0',
  `build_rights` varchar(640) NOT NULL DEFAULT '0',
  `moderators` varchar(320) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_uid` (`owner_uid`),
  KEY `flag_stolen_by_uid` (`flag_stolen_by_uid`),
  CONSTRAINT `territory_ibfk_1` FOREIGN KEY (`owner_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `territory_ibfk_2` FOREIGN KEY (`flag_stolen_by_uid`) REFERENCES `account` (`uid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of territory
-- ----------------------------

-- ----------------------------
-- Table structure for `vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `fuel` double unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` text NOT NULL,
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '1',
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `vehicle_texture` text NOT NULL,
  `territory_id` int(11) unsigned DEFAULT NULL,
  `ammo` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `vehicle_ibfk_2` (`territory_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `virtualgarage`
-- ----------------------------
DROP TABLE IF EXISTS `virtualgarage`;
CREATE TABLE `virtualgarage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `puid` varchar(32) NOT NULL,
  `owner_uid` varchar(32) NOT NULL,
  `textures` text NOT NULL,
  `poptabs` text NOT NULL,
  `pincode` varchar(6) NOT NULL DEFAULT '[]',
  `damage` text NOT NULL,
  `hitpoints` varchar(1024) NOT NULL DEFAULT '[]',
  `fuel` double NOT NULL,
  `items` text NOT NULL,
  `magazines` text NOT NULL,
  `weapons` text NOT NULL,
  `cargo` text NOT NULL,
  `ammo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of virtualgarage
-- ----------------------------
