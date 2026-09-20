CREATE TABLE
    `owned_vehicles` IF NOT EXISTS (
        `owner` varchar(60) DEFAULT NULL,
        `plate` varchar(12) NOT NULL,
        `vehicle` longtext DEFAULT NULL,
        `type` varchar(20) NOT NULL DEFAULT 'car',
        `job` varchar(20) DEFAULT NULL,
        `stored` tinyint (4) NOT NULL DEFAULT 0,
        `parking` VARCHAR(60) DEFAULT NULL,
        `pound` VARCHAR(60) DEFAULT NULL
    ) ENGINE = InnoDB;

COLLATE = 'utf8mb4_bin' ENGINE = InnoDB;