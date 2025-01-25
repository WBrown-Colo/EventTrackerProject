-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cigarsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cigarsdb` ;

-- -----------------------------------------------------
-- Schema cigarsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cigarsdb` DEFAULT CHARACTER SET utf8 ;
USE `cigarsdb` ;

-- -----------------------------------------------------
-- Table `cigar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cigar` ;

CREATE TABLE IF NOT EXISTS `cigar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `description` LONGTEXT NULL,
  `single_price` DOUBLE NULL,
  `year_introduced` VARCHAR(45) NULL,
  `create_date` DATE NULL,
  `last_update` DATE NULL,
  `image_url` LONGTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `humidor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `humidor` ;

CREATE TABLE IF NOT EXISTS `humidor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cigar_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `date_acquired` DATE NULL,
  PRIMARY KEY (`id`, `cigar_id`),
  INDEX `fk_humidor_cigar_idx` (`cigar_id` ASC) VISIBLE,
  CONSTRAINT `fk_humidor_cigar`
    FOREIGN KEY (`cigar_id`)
    REFERENCES `cigar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigar_properties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cigar_properties` ;

CREATE TABLE IF NOT EXISTS `cigar_properties` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cigar_id` INT NOT NULL,
  `origin` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `size` VARCHAR(45) NULL,
  `strength` VARCHAR(45) NULL,
  `shape` VARCHAR(45) NULL,
  `wrapper_shade` VARCHAR(45) NULL,
  `wrapper_type` VARCHAR(45) NULL,
  `binder` VARCHAR(45) NULL,
  `filler` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `cigar_id`),
  INDEX `fk_cigar_properties_cigar1_idx` (`cigar_id` ASC) VISIBLE,
  CONSTRAINT `fk_cigar_properties_cigar1`
    FOREIGN KEY (`cigar_id`)
    REFERENCES `cigar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS cigarcollector@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'cigarcollector'@'localhost' IDENTIFIED BY 'SD45';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'cigarcollector'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `cigar`
-- -----------------------------------------------------
START TRANSACTION;
USE `cigarsdb`;
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`) VALUES (1, 'Padron', '1964 Anniversary Series', NULL, NULL, NULL, '2025-01-24', '2025-01-24', 'https://www.casademontecristo.com/dw/image/v2/BCZK_PRD/on/demandware.static/-/Sites-masterCatalog/default/dw5db5b71a/images/Cigars%20Master%20Skus%20Images/PD64PT3_Single_up.png?sw=450&sh=450&sm=fit&q=80');

COMMIT;

