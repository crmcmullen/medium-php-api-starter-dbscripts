
USE api_starter;

-- ---------------------------------------------------------------------------------------------
-- Drop all the views
DROP VIEW IF EXISTS `vw_app_api_key`;

-- ---------------------------------------------------------------------------------------------
-- Drop tables
DROP TABLE IF EXISTS `app_api_key`;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table structure for table `app_api_key`
CREATE TABLE `app_api_key` (
    `id` BINARY(16) NOT NULL COMMENT 'Record ID',
    `site_name` VARCHAR(128) NOT NULL COMMENT 'Site name',
    `api_key` CHAR(16) NOT NULL COMMENT 'API Key',
    `api_secret_key` VARCHAR(128) NOT NULL COMMENT 'API Secret Key',
    `create_timestamp` DATETIME(3) NOT NULL COMMENT 'Data creation timestamp',
    `status_flag` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '-1=Deleted, 0=Disabled, 1=Active',
    PRIMARY KEY (`id`),
    INDEX (`api_key`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='App API authentication keys';

--
-- Dumping data for table `app_api_key`
--
INSERT INTO `app_api_key` 
	(id, site_name, api_key, api_secret_key, create_timestamp, status_flag) 
VALUES 
	(UNHEX('11EA6C5219446DA58B8B0242AC120002'), 'API Starter Client', 'd7e1a3d7dd2a43a4', '80ed01f7ef2e4e538a6d24e50088495f', (SELECT utc_timestamp), 1);

-- ---------------------------------------------------------------------------------------------
-- Create View for `app_api_key`
CREATE 
	DEFINER = `apistarter`@`%` 
    SQL SECURITY DEFINER 
VIEW vw_app_api_key AS 
	SELECT 
        HEX(id) AS id,
		site_name,
        api_key, 
        api_secret_key, 
        create_timestamp, 
        status_flag   
	FROM (app_api_key);
    