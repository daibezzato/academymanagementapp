-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema isftdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema isftdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `isftdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `isftdb` ;

-- -----------------------------------------------------
-- Table `isftdb`.`action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`action` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`action` (
  `idAction` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `description` VARCHAR(128) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAction`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`career`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`career` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`career` (
  `idCareer` INT NOT NULL AUTO_INCREMENT,
  `careerName` VARCHAR(75) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `description` VARCHAR(128) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `resolution` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCareer`),
  UNIQUE INDEX `name_UNIQUE` (`careerName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`subject` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`subject` (
  `idSubject` INT NOT NULL AUTO_INCREMENT,
  `subjectName` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `career_idCareer` INT NOT NULL,
  PRIMARY KEY (`idSubject`, `career_idCareer`),
  UNIQUE INDEX `name_UNIQUE` (`subjectName` ASC) VISIBLE,
  INDEX `fk_subject_career1_idx` (`career_idCareer` ASC) VISIBLE,
  CONSTRAINT `fk_subject_career1`
    FOREIGN KEY (`career_idCareer`)
    REFERENCES `isftdb`.`career` (`idCareer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`user` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(75) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `salt` VARCHAR(75) NULL DEFAULT NULL,
  `passwordHash` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `isDeleted` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`attendance` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`attendance` (
  `idAttendance` INT NOT NULL AUTO_INCREMENT,
  `subject_idSubject` INT NOT NULL,
  `user_idUser` INT NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  `attendance` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAttendance`, `subject_idSubject`, `user_idUser`),
  UNIQUE INDEX `name_UNIQUE` (`idAttendance` ASC) VISIBLE,
  INDEX `fk_attendance_subject1_idx` (`subject_idSubject` ASC) VISIBLE,
  INDEX `fk_attendance_user1_idx` (`user_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_attendance_subject1`
    FOREIGN KEY (`subject_idSubject`)
    REFERENCES `isftdb`.`subject` (`idSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attendance_user1`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `isftdb`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`group` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`group` (
  `idGroup` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `description` VARCHAR(128) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idGroup`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`period`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`period` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`period` (
  `idPeriod` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(128) NULL DEFAULT NULL,
  `startDate` DATE NULL DEFAULT NULL,
  `endDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idPeriod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`security_access`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`security_access` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`security_access` (
  `group_idGroup` INT NOT NULL,
  `action_idAction` INT NOT NULL,
  INDEX `fk_security_access_group1_idx` (`group_idGroup` ASC) VISIBLE,
  INDEX `fk_security_access_action1_idx` (`action_idAction` ASC) VISIBLE,
  CONSTRAINT `fk_security_access_group1`
    FOREIGN KEY (`group_idGroup`)
    REFERENCES `isftdb`.`group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_security_access_action1`
    FOREIGN KEY (`action_idAction`)
    REFERENCES `isftdb`.`action` (`idAction`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`student_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`student_subject` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`student_subject` (
  `idStudSubj` INT NOT NULL AUTO_INCREMENT,
  `score` INT NULL DEFAULT NULL,
  `period_idPeriod` INT NOT NULL,
  `user_idUser` INT NOT NULL,
  `subject_idSubject` INT NOT NULL,
  PRIMARY KEY (`idStudSubj`),
  INDEX `fk_student_subject_period1_idx` (`period_idPeriod` ASC) VISIBLE,
  INDEX `fk_student_subject_user1_idx` (`user_idUser` ASC) VISIBLE,
  INDEX `fk_student_subject_subject1_idx` (`subject_idSubject` ASC) VISIBLE,
  CONSTRAINT `fk_student_subject_period1`
    FOREIGN KEY (`period_idPeriod`)
    REFERENCES `isftdb`.`period` (`idPeriod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_subject_user1`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `isftdb`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_subject_subject1`
    FOREIGN KEY (`subject_idSubject`)
    REFERENCES `isftdb`.`subject` (`idSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`subject_professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`subject_professor` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`subject_professor` (
  `idSubjectProfessor` INT NOT NULL AUTO_INCREMENT,
  `user_idUser` INT NOT NULL,
  `subject_idSubject` INT NOT NULL,
  PRIMARY KEY (`idSubjectProfessor`),
  INDEX `fk_subject_professor_user1_idx` (`user_idUser` ASC) VISIBLE,
  INDEX `fk_subject_professor_subject1_idx` (`subject_idSubject` ASC) VISIBLE,
  CONSTRAINT `fk_subject_professor_user1`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `isftdb`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_professor_subject1`
    FOREIGN KEY (`subject_idSubject`)
    REFERENCES `isftdb`.`subject` (`idSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`user_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`user_group` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`user_group` (
  `group_idGroup` INT NOT NULL,
  `user_idUser` INT NOT NULL,
  INDEX `fk_user_group_group1_idx` (`group_idGroup` ASC) VISIBLE,
  INDEX `fk_user_group_user1_idx` (`user_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_user_group_group1`
    FOREIGN KEY (`group_idGroup`)
    REFERENCES `isftdb`.`group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_group_user1`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `isftdb`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `isftdb`.`user_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `isftdb`.`user_information` ;

CREATE TABLE IF NOT EXISTS `isftdb`.`user_information` (
  `user_idUser` INT NOT NULL,
  `name` VARCHAR(75) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `surname` VARCHAR(75) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `documentNumber` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `birthDate` DATE NULL DEFAULT NULL,
  `email` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`user_idUser`),
  UNIQUE INDEX `document_UNIQUE` (`documentNumber` ASC) VISIBLE,
  UNIQUE INDEX `mail_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_user_information_user_idx` (`user_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_user_information_user`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `isftdb`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
