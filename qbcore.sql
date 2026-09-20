CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `license` VARCHAR(50) DEFAULT (NULL),
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `vehicle` VARCHAR(50) DEFAULT (NULL),
  `hash` VARCHAR(50) DEFAULT (NULL),
  `mods` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT (NULL),
  `plate` VARCHAR(8) NOT NULL,
  `fakeplate` VARCHAR(8) DEFAULT (NULL),
  `garage` VARCHAR(50) DEFAULT (NULL),
  `fuel` INT(11) DEFAULT 100,
  `engine` FLOAT DEFAULT 1000,
  `body` FLOAT DEFAULT 1000,
  `state` INT(11) DEFAULT 1,
  `depotprice` INT(11) NOT NULL DEFAULT 0,
  `drivingdistance` INT(50) DEFAULT (NULL),
  `status` TEXT DEFAULT (NULL),
  `balance` INT(11) NOT NULL DEFAULT 0,
  `paymentamount` INT(11) NOT NULL DEFAULT 0,
  `paymentsleft` INT(11) NOT NULL DEFAULT 0,
  `financetime` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

ALTER TABLE player_vehicles ADD COLUMN IF NOT EXISTS `type` varchar(32) NOT NULL DEFAULT 'vehicle';