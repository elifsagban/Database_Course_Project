-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema police_killings
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema police_killings
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `police_killings` DEFAULT CHARACTER SET utf8 ;
USE `police_killings` ;

-- -----------------------------------------------------
-- Table `police_killings`.`incident`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `police_killings`.`incident` (
  `incident_id` INT NOT NULL AUTO_INCREMENT,
  `month` VARCHAR(12) NOT NULL,
  `day` INT NOT NULL,
  `year` INT NOT NULL,
  `police_agency` VARCHAR(100) NOT NULL,
  `cause` VARCHAR(45) NOT NULL,
  `armed` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`incident_id`),
  UNIQUE INDEX `incident_id_UNIQUE` (`incident_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `police_killings`.`victim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `police_killings`.`victim` (
  `victim_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `race` VARCHAR(45) NOT NULL,
  `incident_id` INT NOT NULL,
  PRIMARY KEY (`victim_id`),
  UNIQUE INDEX `deceased_id_UNIQUE` (`victim_id` ASC) VISIBLE,
  INDEX `fk_victim_incident1_idx` (`incident_id` ASC) VISIBLE,
  CONSTRAINT `fk_victim_incident1`
    FOREIGN KEY (`incident_id`)
    REFERENCES `police_killings`.`incident` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `police_killings`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `police_killings`.`state` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `combined_FIPS` INT NOT NULL,
  `tract_code` INT NOT NULL,
  `geo_code` INT NOT NULL,
  `tract_des` VARCHAR(45) NOT NULL,
  `population` INT NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE INDEX `state_id_UNIQUE` (`state_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `police_killings`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `police_killings`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  `state_FIPS` INT NOT NULL,
  `county_FIPS` INT NOT NULL,
  `incident_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `location_id_UNIQUE` (`location_id` ASC) VISIBLE,
  INDEX `fk_location_incident1_idx` (`incident_id` ASC) VISIBLE,
  INDEX `fk_location_state1_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_incident1`
    FOREIGN KEY (`incident_id`)
    REFERENCES `police_killings`.`incident` (`incident_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `police_killings`.`state` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `police_killings`.`state_statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `police_killings`.`state_statistics` (
  `share_white` FLOAT NOT NULL,
  `share_black` FLOAT NOT NULL,
  `share_hispanic` FLOAT NOT NULL,
  `personal_income` INT NOT NULL,
  `household_income` INT NOT NULL,
  `county_income` INT NOT NULL,
  `calculated_income` FLOAT NOT NULL,
  `county_bucket` INT NOT NULL,
  `national_bucket` INT NOT NULL,
  `poverty_rate` FLOAT NOT NULL,
  `unemployement_rate` FLOAT NOT NULL,
  `collage` FLOAT NOT NULL,
  `state_id` INT NOT NULL,
  INDEX `fk_state_statistics_state1_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `fk_state_statistics_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `police_killings`.`state` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
