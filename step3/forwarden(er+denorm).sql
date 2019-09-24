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
  `year` INT NOT NULL,
  `month` VARCHAR(45) NOT NULL,
  `day` INT NOT NULL,
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
  `agency_name` VARCHAR(150) NOT NULL,
  `cause` VARCHAR(45) NULL,
  `armed` VARCHAR(45) NULL,
  `tract_pop` INT NOT NULL,
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
  `college_rate` VARCHAR(15) NULL,
  `county_county_id` INT NOT NULL,
  `state_state_id` INT NOT NULL,
  `victim_victim_id` INT NOT NULL,
  `police_agency_police_id` INT NOT NULL,
  `incident_incident_id` INT NOT NULL,
  `share_share_id` INT NOT NULL,
  `rate_rate_id` INT NOT NULL,
  `income_income_id` INT NOT NULL,
  `bucket_bucket_id` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  `State_Statistics_state_id` INT NOT NULL,
  `race_race_id` INT NOT NULL,
  `cause_cause_id` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `police_agency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `police_agency` ;

CREATE TABLE IF NOT EXISTS `police_agency` (
  `police_id` INT NOT NULL AUTO_INCREMENT,
  `agency_name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`police_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `police_id_UNIQUE` ON `police_agency` (`police_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `incident`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `incident` ;

CREATE TABLE IF NOT EXISTS `incident` (
  `incident_id` INT NOT NULL AUTO_INCREMENT,
  `combined_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`incident_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `incident_id_UNIQUE` ON `incident` (`incident_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `state` CHAR(2) NULL,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `location_id_UNIQUE` ON `location` (`location_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `race`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `race` ;

CREATE TABLE IF NOT EXISTS `race` (
  `race_id` INT NOT NULL AUTO_INCREMENT,
  `race` VARCHAR(45) NULL,
  PRIMARY KEY (`race_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `race_id_UNIQUE` ON `race` (`race_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cause`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cause` ;

CREATE TABLE IF NOT EXISTS `cause` (
  `cause_id` INT NOT NULL AUTO_INCREMENT,
  `cause` VARCHAR(45) NULL,
  PRIMARY KEY (`cause_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `cause_id_UNIQUE` ON `cause` (`cause_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `victim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `victim` ;

CREATE TABLE IF NOT EXISTS `victim` (
  `victim_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `age` VARCHAR(2) NULL,
  `gender` VARCHAR(6) NOT NULL,
  `police_agency_police_id` INT NOT NULL,
  `incident_incident_id` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  `race_race_id` INT NOT NULL,
  `cause_cause_id` INT NOT NULL,
  PRIMARY KEY (`victim_id`),
  CONSTRAINT `fk_victim_police_agency`
    FOREIGN KEY (`police_agency_police_id`)
    REFERENCES `police_agency` (`police_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_victim_incident1`
    FOREIGN KEY (`incident_incident_id`)
    REFERENCES `incident` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_victim_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_victim_race1`
    FOREIGN KEY (`race_race_id`)
    REFERENCES `race` (`race_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_victim_cause1`
    FOREIGN KEY (`cause_cause_id`)
    REFERENCES `cause` (`cause_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_victim_police_agency_idx` ON `victim` (`police_agency_police_id` ASC) VISIBLE;

CREATE INDEX `fk_victim_incident1_idx` ON `victim` (`incident_incident_id` ASC) VISIBLE;

CREATE INDEX `fk_victim_location1_idx` ON `victim` (`location_location_id` ASC) VISIBLE;

CREATE INDEX `fk_victim_race1_idx` ON `victim` (`race_race_id` ASC) VISIBLE;

CREATE INDEX `fk_victim_cause1_idx` ON `victim` (`cause_cause_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `armed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `armed` ;

CREATE TABLE IF NOT EXISTS `armed` (
  `armed_id` INT NOT NULL AUTO_INCREMENT,
  `armed` VARCHAR(45) NULL,
  `victim_victim_id` INT NOT NULL,
  PRIMARY KEY (`armed_id`),
  CONSTRAINT `fk_armed_victim1`
    FOREIGN KEY (`victim_victim_id`)
    REFERENCES `victim` (`victim_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `armed_id_UNIQUE` ON `armed` (`armed_id` ASC) VISIBLE;

CREATE INDEX `fk_armed_victim1_idx` ON `armed` (`victim_victim_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `county`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `county` ;

CREATE TABLE IF NOT EXISTS `county` (
  `county_id` INT NOT NULL AUTO_INCREMENT,
  `county_FIPS` VARCHAR(45) NOT NULL,
  `location_location_id` INT NOT NULL,
  PRIMARY KEY (`county_id`),
  CONSTRAINT `fk_county_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `county_id_UNIQUE` ON `county` (`county_id` ASC) VISIBLE;

CREATE INDEX `fk_county_location1_idx` ON `county` (`location_location_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state` ;

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `state` CHAR(2) NOT NULL,
  `state_FIPS` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  PRIMARY KEY (`state_id`),
  CONSTRAINT `fk_state_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `state_id_UNIQUE` ON `state` (`state_id` ASC) VISIBLE;

CREATE INDEX `fk_state_location1_idx` ON `state` (`location_location_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city` ;

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `county_county_id` INT NOT NULL,
  `state_state_id` INT NOT NULL,
  PRIMARY KEY (`city_id`),
  CONSTRAINT `fk_city_county1`
    FOREIGN KEY (`county_county_id`)
    REFERENCES `county` (`county_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_city_state1`
    FOREIGN KEY (`state_state_id`)
    REFERENCES `state` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `city_id_UNIQUE` ON `city` (`city_id` ASC) VISIBLE;

CREATE INDEX `fk_city_county1_idx` ON `city` (`county_county_id` ASC) VISIBLE;

CREATE INDEX `fk_city_state1_idx` ON `city` (`state_state_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `tract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tract` ;

CREATE TABLE IF NOT EXISTS `tract` (
  `tract_id` INT NOT NULL AUTO_INCREMENT,
  `tract_code` INT NOT NULL,
  `tract_des` DOUBLE NOT NULL,
  `tract_pop` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  `state_state_id` INT NOT NULL,
  PRIMARY KEY (`tract_id`),
  CONSTRAINT `fk_tract_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tract_state1`
    FOREIGN KEY (`state_state_id`)
    REFERENCES `state` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tract_id_UNIQUE` ON `tract` (`tract_id` ASC) VISIBLE;

CREATE INDEX `fk_tract_location1_idx` ON `tract` (`location_location_id` ASC) VISIBLE;

CREATE INDEX `fk_tract_state1_idx` ON `tract` (`state_state_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `share`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `share` ;

CREATE TABLE IF NOT EXISTS `share` (
  `share_id` INT NOT NULL AUTO_INCREMENT,
  `share_white` VARCHAR(10) NOT NULL,
  `share_black` VARCHAR(10) NOT NULL,
  `share_hispanic` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`share_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `share_id_UNIQUE` ON `share` (`share_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `rate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rate` ;

CREATE TABLE IF NOT EXISTS `rate` (
  `rate_id` INT NOT NULL AUTO_INCREMENT,
  `pov_rate` VARCHAR(10) NULL,
  `unemp_rate` VARCHAR(15) NULL,
  `college_rate` VARCHAR(15) NULL,
  PRIMARY KEY (`rate_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `rate_id_UNIQUE` ON `rate` (`rate_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `income`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `income` ;

CREATE TABLE IF NOT EXISTS `income` (
  `income_id` INT NOT NULL AUTO_INCREMENT,
  `personal_income` VARCHAR(10) NULL,
  `household_income` VARCHAR(10) NULL,
  `county_income` INT NOT NULL,
  `calculated_income` VARCHAR(15) NULL,
  PRIMARY KEY (`income_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `income_id_UNIQUE` ON `income` (`income_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `bucket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bucket` ;

CREATE TABLE IF NOT EXISTS `bucket` (
  `bucket_id` INT NOT NULL AUTO_INCREMENT,
  `county_bucket` CHAR(1) NULL,
  `nat_bucket` CHAR(1) NULL,
  PRIMARY KEY (`bucket_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `bucket_id_UNIQUE` ON `bucket` (`bucket_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `State_Statistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `State_Statistics` ;

CREATE TABLE IF NOT EXISTS `State_Statistics` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `share_share_id` INT NOT NULL,
  `rate_rate_id` INT NOT NULL,
  `income_income_id` INT NOT NULL,
  `bucket_bucket_id` INT NOT NULL,
  `location_location_id` INT NOT NULL,
  PRIMARY KEY (`state_id`),
  CONSTRAINT `fk_State_Statistics_share1`
    FOREIGN KEY (`share_share_id`)
    REFERENCES `share` (`share_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_State_Statistics_rate1`
    FOREIGN KEY (`rate_rate_id`)
    REFERENCES `rate` (`rate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_State_Statistics_income1`
    FOREIGN KEY (`income_income_id`)
    REFERENCES `income` (`income_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_State_Statistics_bucket1`
    FOREIGN KEY (`bucket_bucket_id`)
    REFERENCES `bucket` (`bucket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_State_Statistics_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `state_id_UNIQUE` ON `State_Statistics` (`state_id` ASC) VISIBLE;

CREATE INDEX `fk_State_Statistics_share1_idx` ON `State_Statistics` (`share_share_id` ASC) VISIBLE;

CREATE INDEX `fk_State_Statistics_rate1_idx` ON `State_Statistics` (`rate_rate_id` ASC) VISIBLE;

CREATE INDEX `fk_State_Statistics_income1_idx` ON `State_Statistics` (`income_income_id` ASC) VISIBLE;

CREATE INDEX `fk_State_Statistics_bucket1_idx` ON `State_Statistics` (`bucket_bucket_id` ASC) VISIBLE;

CREATE INDEX `fk_State_Statistics_location1_idx` ON `State_Statistics` (`location_location_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
