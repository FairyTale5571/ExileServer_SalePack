
<<<<<<< HEAD
-- Дамп структуры базы данных exile_napf
CREATE DATABASE IF NOT EXISTS `exile` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `exile`;

=======
>>>>>>> 6a12dc92e2e7ff6ecf8141e5d0ee24912988e365
-- Дамп структуры для таблица exile_napf.account
CREATE TABLE IF NOT EXISTS `account` (
  `uid` varchar(32) NOT NULL,
  `clan_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `kills` int(11) unsigned NOT NULL DEFAULT 0,
  `deaths` int(11) unsigned NOT NULL DEFAULT 0,
  `locker` int(11) NOT NULL DEFAULT 0,
  `vg_slots` int(11) NOT NULL DEFAULT 1,
  `first_connect_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_connect_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_disconnect_at` datetime DEFAULT NULL,
  `last_reward_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `total_connections` int(11) unsigned NOT NULL DEFAULT 1,
  `donor_level` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donor_timeOut` datetime DEFAULT NULL,
  `whitelisted` int(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `clan_id` (`clan_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.account: ~0 rows (приблизительно)
DELETE FROM `account`;

-- Дамп структуры для таблица exile_napf.atlas_virtualgarage
CREATE TABLE IF NOT EXISTS `atlas_virtualgarage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `class` varchar(64) NOT NULL,
  `puid` varchar(32) NOT NULL,
  `owner_uid` varchar(32) NOT NULL,
  `textures` text NOT NULL,
  `poptabs` text NOT NULL,
  `pincode` varchar(6) NOT NULL DEFAULT '[]',
  `damage` text NOT NULL,
  `hitpoints` varchar(2048) NOT NULL DEFAULT '[]',
  `fuel` double NOT NULL,
  `items` text NOT NULL,
  `magazines` text NOT NULL,
  `weapons` text NOT NULL,
  `cargo` text NOT NULL,
  `ammo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.atlas_virtualgarage: ~0 rows (приблизительно)
DELETE FROM `atlas_virtualgarage`;

-- Дамп структуры для таблица exile_napf.bounties
CREATE TABLE IF NOT EXISTS `bounties` (
  `uid` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `bounty` text NOT NULL,
  `bountyLock` int(1) NOT NULL DEFAULT 0,
  `bountyContract` text NOT NULL,
  `bountyContractCompleted` text NOT NULL,
  `friends` text NOT NULL,
  `friend_last_reset_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_immunity_applied_at` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.bounties: ~0 rows (приблизительно)
DELETE FROM `bounties`;

-- Дамп структуры для таблица exile_napf.clan
CREATE TABLE IF NOT EXISTS `clan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `leader_uid` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `leader_uid` (`leader_uid`),
  CONSTRAINT `clan_ibfk_1` FOREIGN KEY (`leader_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.clan: ~0 rows (приблизительно)
DELETE FROM `clan`;

-- Дамп структуры для таблица exile_napf.clan_map_marker
CREATE TABLE IF NOT EXISTS `clan_map_marker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clan_id` int(11) unsigned NOT NULL,
  `markerType` tinyint(4) NOT NULL DEFAULT -1,
  `positionArr` text NOT NULL,
  `color` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `iconSize` float unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `labelSize` float unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clan_id` (`clan_id`),
  CONSTRAINT `clan_map_marker_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.clan_map_marker: ~0 rows (приблизительно)
DELETE FROM `clan_map_marker`;

-- Дамп структуры для таблица exile_napf.construction
CREATE TABLE IF NOT EXISTS `construction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `direction_x` double NOT NULL DEFAULT 0,
  `direction_y` double NOT NULL DEFAULT 0,
  `direction_z` double NOT NULL DEFAULT 0,
  `up_x` double NOT NULL DEFAULT 0,
  `up_y` double NOT NULL DEFAULT 0,
  `up_z` double NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `damage` tinyint(1) unsigned DEFAULT 0,
  `territory_id` int(11) unsigned DEFAULT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `texture` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  CONSTRAINT `construction_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.construction: ~0 rows (приблизительно)
DELETE FROM `construction`;

-- Дамп структуры для таблица exile_napf.container
CREATE TABLE IF NOT EXISTS `container` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `direction_x` double NOT NULL DEFAULT 0,
  `direction_y` double NOT NULL DEFAULT 0,
  `direction_z` double NOT NULL DEFAULT 0,
  `up_x` double NOT NULL DEFAULT 0,
  `up_y` double NOT NULL DEFAULT 0,
  `up_z` double NOT NULL DEFAULT 1,
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `territory_id` int(11) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT 0,
  `abandoned` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  CONSTRAINT `container_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы exile_napf.container: ~0 rows (приблизительно)
DELETE FROM `container`;

-- Дамп структуры для таблица exile_napf.infistar_logs
CREATE TABLE IF NOT EXISTS `infistar_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logname` char(50) NOT NULL,
  `logentry` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы exile_napf.infistar_logs: ~0 rows (приблизительно)
DELETE FROM `infistar_logs`;

-- Дамп структуры для таблица exile_napf.marxet
CREATE TABLE IF NOT EXISTS `marxet` (
  `listingID` varchar(8) NOT NULL,
  `itemAvailable` tinyint(1) NOT NULL DEFAULT 1,
  `itemArray` text NOT NULL,
  `price` double NOT NULL,
  `sellerUID` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`listingID`),
  KEY `listingID` (`listingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.marxet: ~0 rows (приблизительно)
DELETE FROM `marxet`;

-- Дамп структуры для таблица exile_napf.player
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `account_uid` varchar(32) NOT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT 0,
  `damage` double unsigned NOT NULL DEFAULT 0,
  `hunger` double unsigned NOT NULL DEFAULT 100,
  `thirst` double unsigned NOT NULL DEFAULT 100,
  `alcohol` double unsigned NOT NULL DEFAULT 0,
  `temperature` double NOT NULL DEFAULT 37,
  `wetness` double unsigned NOT NULL DEFAULT 0,
  `oxygen_remaining` double unsigned NOT NULL DEFAULT 1,
  `bleeding_remaining` double unsigned NOT NULL DEFAULT 0,
  `hitpoints` varchar(1024) NOT NULL DEFAULT '[]',
  `direction` double NOT NULL DEFAULT 0,
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
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
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `player_uid` (`account_uid`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.player: ~0 rows (приблизительно)
DELETE FROM `player`;

-- Дамп структуры для таблица exile_napf.player_history
CREATE TABLE IF NOT EXISTS `player_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `died_at` datetime NOT NULL DEFAULT current_timestamp(),
  `positionKiller` double NOT NULL,
  `positionVictim` double NOT NULL,
  `killer` varchar(64) NOT NULL,
  `kUID` varchar(32) NOT NULL,
  `distance` int(11) NOT NULL,
  `weapon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.player_history: ~0 rows (приблизительно)
DELETE FROM `player_history`;

-- Дамп структуры для таблица exile_napf.rewards
CREATE TABLE IF NOT EXISTS `rewards` (
  `uid` varchar(32) NOT NULL,
  `rewards_player` varchar(1024) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.rewards: ~0 rows (приблизительно)
DELETE FROM `rewards`;

-- Дамп структуры для таблица exile_napf.territory
CREATE TABLE IF NOT EXISTS `territory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `position_x` double NOT NULL,
  `position_y` double NOT NULL,
  `position_z` double NOT NULL,
  `radius` double NOT NULL,
  `level` int(11) NOT NULL,
  `flag_texture` varchar(255) NOT NULL,
  `flag_stolen` tinyint(1) NOT NULL DEFAULT 0,
  `flag_stolen_by_uid` varchar(32) DEFAULT NULL,
  `flag_stolen_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_paid_at` datetime DEFAULT current_timestamp(),
  `xm8_protectionmoney_notified` tinyint(1) NOT NULL DEFAULT 0,
  `build_rights` varchar(640) NOT NULL DEFAULT '0',
  `moderators` varchar(320) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_uid` (`owner_uid`),
  CONSTRAINT `territory_ibfk_1` FOREIGN KEY (`owner_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.territory: ~0 rows (приблизительно)
DELETE FROM `territory`;

-- Дамп структуры для таблица exile_napf.tree
CREATE TABLE IF NOT EXISTS `tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` double DEFAULT NULL,
  `position_y` double DEFAULT NULL,
  `position_z` double DEFAULT NULL,
  `regrow` int(1) NOT NULL DEFAULT 0,
  `added` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы exile_napf.tree: ~0 rows (приблизительно)
DELETE FROM `tree`;

-- Дамп структуры для таблица exile_napf.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT current_timestamp(),
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `fuel` double unsigned NOT NULL DEFAULT 0,
  `damage` double unsigned NOT NULL DEFAULT 0,
  `hitpoints` text NOT NULL,
  `position_x` double NOT NULL DEFAULT 0,
  `position_y` double NOT NULL DEFAULT 0,
  `position_z` double NOT NULL DEFAULT 0,
  `direction_x` double NOT NULL DEFAULT 0,
  `direction_y` double NOT NULL DEFAULT 0,
  `direction_z` double NOT NULL DEFAULT 0,
  `up_x` double NOT NULL DEFAULT 0,
  `up_y` double NOT NULL DEFAULT 0,
  `up_z` double NOT NULL DEFAULT 1,
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT 0,
  `vehicle_texture` text NOT NULL,
  `territory_id` int(11) unsigned DEFAULT NULL,
  `nickname` varchar(64) NOT NULL DEFAULT '',
  `ammo` text NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `vehicle_ibfk_2` (`territory_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.vehicle: ~0 rows (приблизительно)
DELETE FROM `vehicle`;

-- Дамп структуры для таблица exile_napf.virtualgarage
CREATE TABLE IF NOT EXISTS `virtualgarage` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы exile_napf.virtualgarage: ~0 rows (приблизительно)
DELETE FROM `virtualgarage`;
