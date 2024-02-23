-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Clients` (
  `DNI` VARCHAR(9) NOT NULL,
  `Usuari` VARCHAR(45) NOT NULL,
  `Contrasenya` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Poblacio` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` INT(9) NOT NULL,
  `Num_Vehicles` INT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Tipus_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Tipus_vehicle` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Places` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Vehicle` (
  `ID` INT NOT NULL,
  `Matrícula` VARCHAR(45) NOT NULL,
  `Tipus` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Num_Carroseria` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Tipus_vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vehicle_Tipus_vehicle_idx` (`Tipus_vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Tipus_vehicle`
    FOREIGN KEY (`Tipus_vehicle_ID`)
    REFERENCES `MER5`.`Tipus_vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Cites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Cites` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Ubicacio` VARCHAR(45) NOT NULL,
  `Data_inici` DATE NOT NULL,
  `Data_final` DATE NOT NULL,
  `Temps_inici` TIME NOT NULL,
  `Temps_final` TIME NOT NULL,
  `Vehicle_ID` INT NOT NULL,
  `Clients_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cites_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Cites_Clients1_idx` (`Clients_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Cites_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cites_Clients1`
    FOREIGN KEY (`Clients_DNI`)
    REFERENCES `MER5`.`Clients` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Client_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client_vehicle` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data_inici` DATE NOT NULL,
  `Data_final` DATE NOT NULL,
  `Clients_DNI` VARCHAR(9) NOT NULL,
  `Vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Client_vehicle_Clients1_idx` (`Clients_DNI` ASC) VISIBLE,
  INDEX `fk_Client_vehicle_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Client_vehicle_Clients1`
    FOREIGN KEY (`Clients_DNI`)
    REFERENCES `MER5`.`Clients` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `MER5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
