-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Avio` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` VARCHAR(45) NULL,
  `Autonomia` VARCHAR(45) NULL,
  `Data_fabricacio` DATE NULL,
  `Data_mort` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Vol` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Num_vol` INT NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `Hora_sortida` TIME NULL,
  `Hora_arribada` TIME NULL,
  `Avio_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vol_Avio_idx` (`Avio_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio`
    FOREIGN KEY (`Avio_ID`)
    REFERENCES `MER6`.`Avio` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Passatger` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Reserva` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NULL,
  `Vol_ID` INT NOT NULL,
  `Passatger_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Reserva_Vol1_idx` (`Vol_ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Passatger1_idx` (`Passatger_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_ID`)
    REFERENCES `MER6`.`Vol` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Passatger1`
    FOREIGN KEY (`Passatger_ID`)
    REFERENCES `MER6`.`Passatger` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
