-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jleflerDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jleflerDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jleflerDB` DEFAULT CHARACTER SET utf8 ;
USE `jleflerDB` ;

-- -----------------------------------------------------
-- Table `jleflerDB`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jleflerDB`.`User` (
  `User_ID` INT NOT NULL DEFAULT 0000,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `date_added` DATETIME NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jleflerDB`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jleflerDB`.`Car` (
  `owner_user_ID` INT NOT NULL,
  `VIN_number` INT NOT NULL,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  `insurance_company` VARCHAR(45) NULL,
  `policy_number` VARCHAR(45) NULL,
  PRIMARY KEY (`VIN_number`),
  INDEX `owner user ID_idx` (`owner_user_ID` ASC),
  CONSTRAINT `User ID`
    FOREIGN KEY (`owner_user_ID`)
    REFERENCES `jleflerDB`.`User` (`User_ID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jleflerDB`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jleflerDB`.`Event` (
  `event ID` INT NOT NULL,
  `host ID` INT NULL,
  `invited_users` VARCHAR(45) NULL,
  `event_name` VARCHAR(45) NULL,
  `date_time` DATETIME NULL,
  `location` VARCHAR(45) NULL,
  `cars_pledged` VARCHAR(45) NULL,
  PRIMARY KEY (`event ID`),
  INDEX `host ID_idx` (`host ID` ASC),
  CONSTRAINT `host ID`
    FOREIGN KEY (`host ID`)
    REFERENCES `jleflerDB`.`User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jleflerDB`.`Pledged_Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jleflerDB`.`Pledged_Cars` (
  `pledge_car_id` INT NOT NULL,
  `driver_username` VARCHAR(45) NULL,
  `VIN_number` INT NULL,
  `passenger_seats` INT NULL,
  `riders` INT NULL,
  `Pledged_Carscol` VARCHAR(45) NULL,
  `owner_ID` INT NOT NULL,
  `event_ID` INT NULL,
  PRIMARY KEY (`pledge_car_id`),
  INDEX `VIN number_idx` (`VIN_number` ASC),
  INDEX `event ID_idx` (`event_ID` ASC),
  CONSTRAINT `VIN number`
    FOREIGN KEY (`VIN_number`)
    REFERENCES `jleflerDB`.`Car` (`VIN_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event ID`
    FOREIGN KEY (`event_ID`)
    REFERENCES `jleflerDB`.`Event` (`event ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jleflerDB`.`Car_Options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jleflerDB`.`Car_Options` (
  `vehicle_VIN_number` INT NOT NULL,
  `Make` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `option_set_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`option_set_ID`),
  CONSTRAINT `vehicle VIN number`
    FOREIGN KEY (`vehicle_VIN_number`)
    REFERENCES `jleflerDB`.`Car` (`VIN_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
