-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema base_sheblossoms
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema base_sheblossoms
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `base_sheblossoms` ;
USE `base_sheblossoms` ;

-- -----------------------------------------------------
-- Table `base_sheblossoms`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`user` (
  `iduser` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` ENUM('seller', 'admin', 'shopper') NOT NULL,
  `reg_date` DATETIME NOT NULL,
  `address` TEXT NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`order` (
  `idorder` INT NOT NULL,
  `order_status` ENUM('Enviado', 'En tránsito', 'Entregado') NOT NULL,
  `order_date` DATETIME NOT NULL,
  `order_total` DECIMAL NOT NULL,
  `address` TEXT NOT NULL,
  `user_iduser` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idorder`, `user_iduser`),
  INDEX `fk_order_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `base_sheblossoms`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`orderdetails` (
  `idorderdetails` INT NOT NULL,
  `product_id` INT NOT NULL,
  `number_of_items` INT NOT NULL,
  `unit_price` DECIMAL NOT NULL,
  `description` TEXT NOT NULL,
  `order_total` DECIMAL NOT NULL,
  `address` TEXT NOT NULL,
  `order_idorder` INT NOT NULL,
  `order_user_iduser` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idorderdetails`, `order_idorder`, `order_user_iduser`),
  INDEX `fk_orderdetails_order1_idx` (`order_idorder` ASC, `order_user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_orderdetails_order1`
    FOREIGN KEY (`order_idorder` , `order_user_iduser`)
    REFERENCES `base_sheblossoms`.`order` (`idorder` , `user_iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`shops` (
  `idshops` INT NOT NULL,
  `store_name` VARCHAR(100) NOT NULL,
  `store_description` TEXT NOT NULL,
  `reg_date_store` DATETIME NOT NULL,
  `url_logo` VARCHAR(200) NOT NULL,
  `shop_location` VARCHAR(200) NOT NULL,
  `user_iduser` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idshops`, `user_iduser`),
  INDEX `fk_shops_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_shops_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `base_sheblossoms`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`category` (
  `idcategory` INT NOT NULL,
  `category_name` VARCHAR(100) NOT NULL,
  `category_description` VARCHAR(200) NOT NULL,
  `shops_idshops` INT NOT NULL,
  PRIMARY KEY (`idcategory`, `shops_idshops`),
  INDEX `fk_category_shops1_idx` (`shops_idshops` ASC) VISIBLE,
  UNIQUE INDEX `idcategory_UNIQUE` (`idcategory` ASC) VISIBLE,
  CONSTRAINT `fk_category_shops1`
    FOREIGN KEY (`shops_idshops`)
    REFERENCES `base_sheblossoms`.`shops` (`idshops`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`shop_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`shop_category` (
  `shops_idshops` INT NOT NULL,
  `category_idcategory` INT NOT NULL,
  `category_shops_idshops` INT NOT NULL,
  `category_shops_user_iduser` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`shops_idshops`, `category_idcategory`, `category_shops_idshops`, `category_shops_user_iduser`),
  INDEX `fk_shop_category_category1_idx` (`category_idcategory` ASC, `category_shops_idshops` ASC, `category_shops_user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_shop_category_shops1`
    FOREIGN KEY (`shops_idshops`)
    REFERENCES `base_sheblossoms`.`shops` (`idshops`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shop_category_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `base_sheblossoms`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`paymentmethods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`paymentmethods` (
  `idpayment` INT NOT NULL,
  `payment_method` ENUM('Tarjeta', 'Efectivo') NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `payment_amount` DECIMAL NOT NULL,
  `order_idorder` INT NOT NULL,
  `order_user_iduser` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idpayment`, `order_idorder`, `order_user_iduser`),
  INDEX `fk_paymentmethods_order1_idx` (`order_idorder` ASC, `order_user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_paymentmethods_order1`
    FOREIGN KEY (`order_idorder` , `order_user_iduser`)
    REFERENCES `base_sheblossoms`.`order` (`idorder` , `user_iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`product` (
  `idproduct` INT NOT NULL,
  `product_name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `product_price` DECIMAL NOT NULL,
  `product_stock` INT NOT NULL,
  `product_category` VARCHAR(100) NOT NULL,
  `add_date` DATETIME NOT NULL,
  `url_img` VARCHAR(200) NOT NULL,
  `shops_idshops` INT NOT NULL,
  PRIMARY KEY (`idproduct`, `shops_idshops`),
  INDEX `fk_product_shops1_idx` (`shops_idshops` ASC) VISIBLE,
  CONSTRAINT `fk_product_shops1`
    FOREIGN KEY (`shops_idshops`)
    REFERENCES `base_sheblossoms`.`shops` (`idshops`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`productreviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`productreviews` (
  `idproductreviews` INT NOT NULL,
  `productreview` TEXT NOT NULL,
  `review_date` DATETIME NOT NULL,
  `product_idproduct` INT NOT NULL,
  `product_shops_idshops` INT NOT NULL,
  PRIMARY KEY (`idproductreviews`, `product_idproduct`, `product_shops_idshops`),
  INDEX `fk_productreviews_product1_idx` (`product_idproduct` ASC, `product_shops_idshops` ASC) VISIBLE,
  CONSTRAINT `fk_productreviews_product1`
    FOREIGN KEY (`product_idproduct` , `product_shops_idshops`)
    REFERENCES `base_sheblossoms`.`product` (`idproduct` , `shops_idshops`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_sheblossoms`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_sheblossoms`.`product_category` (
  `category_idcategory` INT NOT NULL,
  `category_shops_idshops` INT NOT NULL,
  `product_idproduct` INT NOT NULL,
  PRIMARY KEY (`category_idcategory`, `category_shops_idshops`, `product_idproduct`),
  INDEX `fk_product_category_product1_idx` (`product_idproduct` ASC) VISIBLE,
  CONSTRAINT `fk_product_category_category1`
    FOREIGN KEY (`category_idcategory` , `category_shops_idshops`)
    REFERENCES `base_sheblossoms`.`category` (`idcategory` , `shops_idshops`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `base_sheblossoms`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
