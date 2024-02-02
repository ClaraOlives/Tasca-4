-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Tarifa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Preu` INT(5) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Cine` (
  `NIF` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Ubicacio` VARCHAR(45) NOT NULL,
  `Nº Sales` VARCHAR(45) NOT NULL,
  `Horari` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Pel·lícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Pel·lícula` (
  `ISBN` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `Protagonista` VARCHAR(45) NOT NULL,
  `Actor secundari` VARCHAR(45) NOT NULL,
  `Any` INT(4) NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Projecció` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Sala` VARCHAR(45) NULL,
  `Hora_fi` TIME NULL,
  `Hora_inici` TIME NULL,
  `Cine_NIF` INT NULL,
  `Tarifa_ID` INT NULL,
  `Pel·lícula_ISBN` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Projecció_Cine_idx` (`Cine_NIF` ASC) VISIBLE,
  INDEX `fk_Projecció_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  INDEX `fk_Projecció_Pel·lícula1_idx` (`Pel·lícula_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Cine`
    FOREIGN KEY (`Cine_NIF`)
    REFERENCES `MER2B`.`Cine` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `MER2B`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Pel·lícula1`
    FOREIGN KEY (`Pel·lícula_ISBN`)
    REFERENCES `MER2B`.`Pel·lícula` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
