-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabalho_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabalho_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalho_bd` DEFAULT CHARACTER SET utf8 ;
USE `trabalho_bd` ;

-- -----------------------------------------------------
-- Table `trabalho_bd`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  PRIMARY KEY (`idendereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`cliente` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `rg` VARCHAR(20) NOT NULL,
  `codigo_endereco` INT,
  PRIMARY KEY (`codigo`, `codigo_endereco`),
  UNIQUE INDEX `rg_UNIQUE` (`rg` ASC) VISIBLE,
  INDEX `fk_cliente_endereco_idx` (`codigo_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_endereco`
    FOREIGN KEY (`codigo_endereco`)
    REFERENCES `trabalho_bd`.`endereco` (`idendereco`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`editora` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`livros` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `edicao` VARCHAR(45) NULL,
  `custo` FLOAT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `codigo_editora` INT,
  PRIMARY KEY (`codigo`, `codigo_editora`),
  INDEX `fk_livros_editora1_idx` (`codigo_editora` ASC) VISIBLE,
  CONSTRAINT `fk_livros_editora1`
    FOREIGN KEY (`codigo_editora`)
    REFERENCES `trabalho_bd`.`editora` (`codigo`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`exemplares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`exemplares` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `data_aquisicao` DATE NULL,
  `codigo_livro` INT,
  PRIMARY KEY (`codigo`, `codigo_livro`),
  INDEX `fk_exemplares_livros1_idx` (`codigo_livro` ASC) VISIBLE,
  CONSTRAINT `fk_exemplares_livros1`
    FOREIGN KEY (`codigo_livro`)
    REFERENCES `trabalho_bd`.`livros` (`codigo`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`autores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`emprestimo` (
  `codigo_cliente` INT NOT NULL,
  `codigo_exemplar` INT NOT NULL,
  `codigo_emprestimo` INT,
  `data` DATE NULL,
  PRIMARY KEY (`codigo_cliente`, `codigo_exemplar`, `codigo_emprestimo`),
  INDEX `fk_cliente_has_exemplares_exemplares1_idx` (`codigo_emprestimo` ASC) VISIBLE,
  INDEX `fk_cliente_has_exemplares_cliente1_idx` (`codigo_cliente` ASC, `codigo_exemplar` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_exemplares_cliente1`
    FOREIGN KEY (`codigo_cliente` , `codigo_exemplar`)
    REFERENCES `trabalho_bd`.`cliente` (`codigo` , `codigo_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_exemplares_exemplares1`
    FOREIGN KEY (`codigo_emprestimo`)
    REFERENCES `trabalho_bd`.`exemplares` (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalho_bd`.`autoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalho_bd`.`autoria` (
  `codigo_autores` INT NOT NULL,
  `codigo_livro` INT NOT NULL,
  `codigo_editora` INT NOT NULL,
  PRIMARY KEY (`codigo_autores`, `codigo_livro`, `codigo_editora`),
  INDEX `fk_autores_has_livros_livros1_idx` (`codigo_livro` ASC, `codigo_editora` ASC) VISIBLE,
  INDEX `fk_autores_has_livros_autores1_idx` (`codigo_autores` ASC) VISIBLE,
  CONSTRAINT `fk_autores_has_livros_autores1`
    FOREIGN KEY (`codigo_autores`)
    REFERENCES `trabalho_bd`.`autores` (`codigo`),
  CONSTRAINT `fk_autores_has_livros_livros1`
    FOREIGN KEY (`codigo_livro` , `codigo_editora`)
    REFERENCES `trabalho_bd`.`livros` (`codigo` , `codigo_editora`)
    )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;