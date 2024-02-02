-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2C` ;
USE `MER2C` ;

-- -----------------------------------------------------
-- Table `MER2C`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Alumne` (
  `Expedient` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `DataNaixement` DATE NOT NULL,
  PRIMARY KEY (`Expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Professor` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  `Titulacio` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Telefon` INT(9) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Departament` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(20) NOT NULL,
  `Descripcio` VARCHAR(450) NOT NULL,
  `Ubicacio` VARCHAR(45) NOT NULL,
  `Professor_NIF` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Departament_Professor1_idx` (`Professor_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Departament_Professor1`
    FOREIGN KEY (`Professor_NIF`)
    REFERENCES `MER2C`.`Professor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Assignatura` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(20) NOT NULL,
  `Credits` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `CriteriAvaluacio` VARCHAR(45) NOT NULL,
  `Obj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Matricula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Alumne` VARCHAR(45) NOT NULL,
  `Alumne_Expedient` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_Alumne_idx` (`Alumne_Expedient` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne`
    FOREIGN KEY (`Alumne_Expedient`)
    REFERENCES `MER2C`.`Alumne` (`Expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`AssignaturaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`AssignaturaMatricula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NOT NULL,
  `Calendari` DATE NOT NULL,
  `Matricula_ID` INT NOT NULL,
  `Assignatura_ID` INT NOT NULL,
  `Professor_NIF` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_AssignaturaMatricula_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  INDEX `fk_AssignaturaMatricula_Assignatura1_idx` (`Assignatura_ID` ASC) VISIBLE,
  INDEX `fk_AssignaturaMatricula_Professor1_idx` (`Professor_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_AssignaturaMatricula_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `MER2C`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignaturaMatricula_Assignatura1`
    FOREIGN KEY (`Assignatura_ID`)
    REFERENCES `MER2C`.`Assignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignaturaMatricula_Professor1`
    FOREIGN KEY (`Professor_NIF`)
    REFERENCES `MER2C`.`Professor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
