CREATE DATABASE IF NOT EXISTS `api_starter`;
USE `api_starter`;

-- ------------------------------------------------------------------------------------------------------------
--  Create DB user
DROP USER IF EXISTS 'apistarter'@'%';
DROP USER IF EXISTS 'apistarter'@'localhost';

CREATE USER 'apistarter'@'%' IDENTIFIED BY '7157f0a0-056f-4371-820d-c9c277adb410';
CREATE USER 'apistarter'@'localhost' IDENTIFIED BY '7157f0a0-056f-4371-820d-c9c277adb410';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON api_starter.* TO 'apistarter';