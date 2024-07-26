-- MySQL Script generated by MySQL Workbench
-- Thu Jul 18 11:33:52 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema voluntex
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `voluntex` ;

-- -----------------------------------------------------
-- Schema voluntex
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `voluntex` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `voluntex`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `voluntex`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `voluntex`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nomEmpresa` VARCHAR(70) NULL DEFAULT NULL,
  `pais` VARCHAR(50) NULL DEFAULT NULL,
  `estado` VARCHAR(50) NULL DEFAULT NULL,
  `ciudad` VARCHAR(50) NULL DEFAULT NULL,
  `calle` VARCHAR(50) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apePat` VARCHAR(50) NOT NULL,
  `apeMat` VARCHAR(50) NOT NULL,
  `password` VARCHAR(500) NOT NULL,
  `fechaReg` DATE NOT NULL,
  `rol` SMALLINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `voluntex`.`voluntariados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `voluntex`.`voluntariados` ;

CREATE TABLE IF NOT EXISTS `voluntex`.`voluntariados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `cupo` INT NOT NULL,
  `ingresos` INT NOT NULL,
  `costo` DOUBLE NOT NULL,
  `pais` VARCHAR(60) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `fechaInicio` DATE NOT NULL,
  `estatus` TINYINT NULL DEFAULT NULL,
  `fechaCierre` DATE NULL DEFAULT NULL,
  `fkEmpresa` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Voluntariados_usuarios_idx` (`fkEmpresa` ASC) VISIBLE,
  CONSTRAINT `fk_Voluntariados_usuarios`
    FOREIGN KEY (`fkEmpresa`)
    REFERENCES `voluntex`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `voluntex`.`registros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `voluntex`.`registros` ;

CREATE TABLE IF NOT EXISTS `voluntex`.`registros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fechaReg` DATE NOT NULL,
  `fkVoluntariado` INT NOT NULL,
  `fkVoluntario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_registros_voluntariados_idx` (`fkVoluntariado` ASC) VISIBLE,
  INDEX `fk_registros_usuarios1_idx` (`fkVoluntario` ASC) VISIBLE,
  CONSTRAINT `fk_registros_voluntariados`
    FOREIGN KEY (`fkVoluntariado`)
    REFERENCES `voluntex`.`voluntariados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_usuarios1`
    FOREIGN KEY (`fkVoluntario`)
    REFERENCES `voluntex`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `voluntex` ;

-- -----------------------------------------------------
-- Table `voluntex`.`calificaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `voluntex`.`calificaciones` ;

CREATE TABLE IF NOT EXISTS `voluntex`.`calificaciones` (
  `calificacion` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `fkVoluntariado` INT NOT NULL,
  `fkVoluntario` INT NOT NULL,
  INDEX `fk_calificaciones_voluntariados1_idx` (`fkVoluntariado` ASC) VISIBLE,
  INDEX `fk_calificaciones_usuarios1_idx` (`fkVoluntario` ASC) VISIBLE,
  CONSTRAINT `fk_calificaciones_usuarios1`
    FOREIGN KEY (`fkVoluntario`)
    REFERENCES `voluntex`.`usuarios` (`id`),
  CONSTRAINT `fk_calificaciones_voluntariados1`
    FOREIGN KEY (`fkVoluntariado`)
    REFERENCES `voluntex`.`voluntariados` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;