ALTER TABLE `account`
ADD COLUMN `donor_level`  enum('0','1','2','3','4','5') NOT NULL DEFAULT '0' AFTER `total_connections`,
ADD COLUMN `donor_timeOut`  datetime NULL AFTER `donor_level`;

CREATE TABLE IF NOT EXISTS `rewards` (
  `uid` varchar(32) NOT NULL,
  `rewards_player` varchar(1024) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;