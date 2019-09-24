-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `denormalized_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `denormalized_table` ;

CREATE TABLE IF NOT EXISTS `denormalized_table` (
  `name` VARCHAR(45) NULL,
  `age` VARCHAR(2) NULL,
  `gender` VARCHAR(6) NOT NULL,
  `race` VARCHAR(45) NULL,
  `month` VARCHAR(45) NOT NULL,
  `day` INT NOT NULL,
  `year` INT NOT NULL,
  `street_address` VARCHAR(100) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  `state_FIPS` INT NOT NULL,
  `county_FIPS` INT NOT NULL,
  `tract_code` INT NOT NULL,
  `geo_code` VARCHAR(15) NOT NULL,
  `combined_FIPS` INT NOT NULL,
  `tract_des` DOUBLE NOT NULL,
  `police_agency` VARCHAR(150) NOT NULL,
  `cause` VARCHAR(45) NULL,
  `armed` VARCHAR(45) NULL,
  `population` INT NOT NULL,
  `share_white` VARCHAR(10) NOT NULL,
  `share_black` VARCHAR(10) NOT NULL,
  `share_hispanic` VARCHAR(10) NOT NULL,
  `personal_income` VARCHAR(10) NULL,
  `household_income` VARCHAR(10) NULL,
  `county_income` INT NOT NULL,
  `calculated_income` VARCHAR(15) NULL,
  `county_bucket` CHAR(1) NULL,
  `nat_bucket` CHAR(1) NULL,
  `pov_rate` VARCHAR(10) NULL,
  `unemp_rate` VARCHAR(15) NULL,
  `college` VARCHAR(15) NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
