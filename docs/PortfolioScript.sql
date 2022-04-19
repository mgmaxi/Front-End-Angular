-- MySQL Script generated by MySQL Workbench
-- Mon Apr 18 14:50:13 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema b9d5bcov61crf9qewtfs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `b9d5bcov61crf9qewtfs` ;

-- -----------------------------------------------------
-- Schema b9d5bcov61crf9qewtfs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `b9d5bcov61crf9qewtfs` DEFAULT CHARACTER SET utf8 ;
USE `b9d5bcov61crf9qewtfs` ;

-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`company` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `logo` VARCHAR(250) NULL DEFAULT NULL,
  `name` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`school` (
  `id` BIGINT(20) NOT NULL,
  `logo` VARCHAR(250) NULL DEFAULT NULL,
  `name` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`person` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `about` VARCHAR(250) NULL DEFAULT NULL,
  `first_name` VARCHAR(60) NOT NULL,
  `last_name` VARCHAR(60) NOT NULL,
  `nationality` VARCHAR(60) NULL DEFAULT NULL,
  `profession` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`education` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(250) NOT NULL,
  `end_date` DATE NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `start_date` DATE NOT NULL,
  `person_id` BIGINT(20) NOT NULL,
  `school_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKf51kqq9aj1hj0koa1a853cd7w`
    FOREIGN KEY (`school_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`school` (`id`),
  CONSTRAINT `FKkvbl6xk332o16kxhc8hp0pnhh`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FKkvbl6xk332o16kxhc8hp0pnhh` ON `b9d5bcov61crf9qewtfs`.`education` (`person_id` ASC) VISIBLE;

CREATE INDEX `FKf51kqq9aj1hj0koa1a853cd7w` ON `b9d5bcov61crf9qewtfs`.`education` (`school_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`experience` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(250) NOT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `is_current` BIT(1) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `start_date` DATE NOT NULL,
  `company_id` BIGINT(20) NULL DEFAULT NULL,
  `person_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK6w0u2511reisy6wp0589w7fyn`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`),
  CONSTRAINT `FKfnhfue8bjghnfyjqrxnlgndso`
    FOREIGN KEY (`company_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`company` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FKfnhfue8bjghnfyjqrxnlgndso` ON `b9d5bcov61crf9qewtfs`.`experience` (`company_id` ASC) VISIBLE;

CREATE INDEX `FK6w0u2511reisy6wp0589w7fyn` ON `b9d5bcov61crf9qewtfs`.`experience` (`person_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`hibernate_sequence` (
  `next_val` BIGINT(20) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`language` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`person_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`person_language` (
  `person_id` BIGINT(20) NOT NULL,
  `language_id` BIGINT(20) NOT NULL,
  CONSTRAINT `FKa4jki5wctymq4wtyol7fjoyng`
    FOREIGN KEY (`language_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`language` (`id`),
  CONSTRAINT `FKt9imqwh393mq10q43t5rlvyfp`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FKa4jki5wctymq4wtyol7fjoyng` ON `b9d5bcov61crf9qewtfs`.`person_language` (`language_id` ASC) VISIBLE;

CREATE INDEX `FKt9imqwh393mq10q43t5rlvyfp` ON `b9d5bcov61crf9qewtfs`.`person_language` (`person_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`technology`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`technology` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(60) NOT NULL,
  `logo` VARCHAR(250) NULL DEFAULT NULL,
  `name` VARCHAR(60) NOT NULL,
  `url` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`person_technology`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`person_technology` (
  `person_id` BIGINT(20) NOT NULL,
  `technology_id` BIGINT(20) NOT NULL,
  CONSTRAINT `FK609p6gmuk595mm4v74etl9ert`
    FOREIGN KEY (`technology_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`technology` (`id`),
  CONSTRAINT `FKrwqm5joqukrskip9nc70h7fek`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FK609p6gmuk595mm4v74etl9ert` ON `b9d5bcov61crf9qewtfs`.`person_technology` (`technology_id` ASC) VISIBLE;

CREATE INDEX `FKrwqm5joqukrskip9nc70h7fek` ON `b9d5bcov61crf9qewtfs`.`person_technology` (`person_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`project` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `deploy` VARCHAR(250) NULL DEFAULT NULL,
  `description` VARCHAR(250) NOT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `logo` VARCHAR(250) NULL DEFAULT NULL,
  `name` VARCHAR(60) NOT NULL,
  `repository` VARCHAR(250) NULL DEFAULT NULL,
  `person_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKppmmj8b0oeesglh1lkcgawdu`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FKppmmj8b0oeesglh1lkcgawdu` ON `b9d5bcov61crf9qewtfs`.`project` (`person_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`social_network`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`social_network` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(250) NULL DEFAULT NULL,
  `github` VARCHAR(250) NULL DEFAULT NULL,
  `linkedin` VARCHAR(250) NULL DEFAULT NULL,
  `person_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK9hksd1qqbjg1q3k6wckncgfsx`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FK9hksd1qqbjg1q3k6wckncgfsx` ON `b9d5bcov61crf9qewtfs`.`social_network` (`person_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`user_photos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`user_photos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `cover_photo` VARCHAR(250) NULL DEFAULT NULL,
  `profile_photo` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(250) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `username` VARCHAR(60) NOT NULL,
  `person_id` BIGINT(20) NULL DEFAULT NULL,
  `user_photos_id` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKh7or7bhdt109955akcaskwbw9`
    FOREIGN KEY (`user_photos_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`user_photos` (`id`),
  CONSTRAINT `FKir5g7yucydevmmc84i788jp79`
    FOREIGN KEY (`person_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`person` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `UK_ob8kqyqqgmefl0aco34akdtpe` ON `b9d5bcov61crf9qewtfs`.`user` (`email` ASC) VISIBLE;

CREATE UNIQUE INDEX `UK_sb8bbouer5wak8vyiiy4pf2bx` ON `b9d5bcov61crf9qewtfs`.`user` (`username` ASC) VISIBLE;

CREATE INDEX `FKir5g7yucydevmmc84i788jp79` ON `b9d5bcov61crf9qewtfs`.`user` (`person_id` ASC) VISIBLE;

CREATE INDEX `FKh7or7bhdt109955akcaskwbw9` ON `b9d5bcov61crf9qewtfs`.`user` (`user_photos_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `b9d5bcov61crf9qewtfs`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b9d5bcov61crf9qewtfs`.`user_role` (
  `user_id` BIGINT(20) NOT NULL,
  `role_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o`
    FOREIGN KEY (`user_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y`
    FOREIGN KEY (`role_id`)
    REFERENCES `b9d5bcov61crf9qewtfs`.`role` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `FKa68196081fvovjhkek5m97n3y` ON `b9d5bcov61crf9qewtfs`.`user_role` (`role_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
