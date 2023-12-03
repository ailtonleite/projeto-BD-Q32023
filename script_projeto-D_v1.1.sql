-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbprojetod
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbprojetod
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbprojetod` DEFAULT CHARACTER SET utf8 ;
USE `dbprojetod` ;

-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `numero_cpf` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_endereco` (
  `num_seq` INT NOT NULL AUTO_INCREMENT,
  `nome_rua` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(30) NOT NULL,
  `numero` INT(5) NOT NULL,
  `complemento` INT(5) NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `estado` VARCHAR(25) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `tb_usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`num_seq`, `tb_usuario_id_usuario`),
  UNIQUE INDEX `num_seq_UNIQUE` (`num_seq` ASC) VISIBLE,
  INDEX `fk_tb_endereco_tb_usuario_idx` (`tb_usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_tb_endereco_tb_usuario`
    FOREIGN KEY (`tb_usuario_id_usuario`)
    REFERENCES `dbprojetod`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_carteira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_carteira` (
  `id_carteira` INT NOT NULL AUTO_INCREMENT,
  `saldo` DOUBLE NOT NULL,
  PRIMARY KEY (`id_carteira`),
  UNIQUE INDEX `id_carteira_UNIQUE` (`id_carteira` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_perfil_designer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_perfil_designer` (
  `id_designer` INT NOT NULL AUTO_INCREMENT,
  `nota_geral` DOUBLE NULL,
  `tb_endereco_num_seq` INT NOT NULL,
  `tb_endereco_tb_usuario_id_usuario` INT NOT NULL,
  `tb_carteira_id_carteira` INT NOT NULL,
  PRIMARY KEY (`id_designer`),
  UNIQUE INDEX `id_designer_UNIQUE` (`id_designer` ASC) VISIBLE,
  INDEX `fk_tb_designer_tb_endereco1_idx` (`tb_endereco_num_seq` ASC, `tb_endereco_tb_usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_tb_designer_tb_carteira1_idx` (`tb_carteira_id_carteira` ASC) VISIBLE,
  CONSTRAINT `fk_tb_designer_tb_endereco1`
    FOREIGN KEY (`tb_endereco_num_seq` , `tb_endereco_tb_usuario_id_usuario`)
    REFERENCES `dbprojetod`.`tb_endereco` (`num_seq` , `tb_usuario_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_designer_tb_carteira1`
    FOREIGN KEY (`tb_carteira_id_carteira`)
    REFERENCES `dbprojetod`.`tb_carteira` (`id_carteira`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_tipopedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_tipopedido` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_pedido` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE INDEX `id_tipo_UNIQUE` (`id_tipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_tipopagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_tipopagamento` (
  `id_tipopagamento` INT NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tipopagamento`),
  UNIQUE INDEX `id_tipopagamento_UNIQUE` (`id_tipopagamento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_pedido` (
  `num_pedido` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(20) NULL,
  `dimensao` VARCHAR(20) NULL,
  `descricao` LONGTEXT NULL,
  `data_inicio` DATE NULL,
  `data_estimada` DATE NULL,
  `data_fim` DATE NULL,
  `tb_usuario_id_usuario` INT NOT NULL,
  `tb_designer_id_designer` INT NULL,
  `tb_tipopedido_id_tipo` INT NOT NULL,
  `tb_tipopagamento_id_tipopagamento` INT NOT NULL,
  PRIMARY KEY (`num_pedido`),
  UNIQUE INDEX `num_pedido_UNIQUE` (`num_pedido` ASC) VISIBLE,
  INDEX `fk_pedido_tb_usuario1_idx` (`tb_usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_pedido_tb_designer1_idx` (`tb_designer_id_designer` ASC) VISIBLE,
  INDEX `fk_tb_pedido_tb_tipopedido1_idx` (`tb_tipopedido_id_tipo` ASC) VISIBLE,
  INDEX `fk_tb_pedido_tb_tipopagamento1_idx` (`tb_tipopagamento_id_tipopagamento` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id_usuario`)
    REFERENCES `dbprojetod`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_tb_designer1`
    FOREIGN KEY (`tb_designer_id_designer`)
    REFERENCES `dbprojetod`.`tb_perfil_designer` (`id_designer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pedido_tb_tipopedido1`
    FOREIGN KEY (`tb_tipopedido_id_tipo`)
    REFERENCES `dbprojetod`.`tb_tipopedido` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_pedido_tb_tipopagamento1`
    FOREIGN KEY (`tb_tipopagamento_id_tipopagamento`)
    REFERENCES `dbprojetod`.`tb_tipopagamento` (`id_tipopagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_transacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_transacao` (
  `id_transaca` INT NOT NULL AUTO_INCREMENT,
  `valor` DOUBLE NULL,
  `tb_pedido_num_pedido` INT NOT NULL,
  PRIMARY KEY (`id_transaca`),
  UNIQUE INDEX `id_transaca_UNIQUE` (`id_transaca` ASC) VISIBLE,
  INDEX `fk_tb_transacao_tb_pedido1_idx` (`tb_pedido_num_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_tb_transacao_tb_pedido1`
    FOREIGN KEY (`tb_pedido_num_pedido`)
    REFERENCES `dbprojetod`.`tb_pedido` (`num_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_tipopedido_has_tb_designer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_tipopedido_has_tb_designer` (
  `tb_tipopedido_id_tipo` INT NOT NULL,
  `tb_designer_id_designer` INT NOT NULL,
  PRIMARY KEY (`tb_tipopedido_id_tipo`, `tb_designer_id_designer`),
  INDEX `fk_tb_tipopedido_has_tb_designer_tb_designer1_idx` (`tb_designer_id_designer` ASC) VISIBLE,
  INDEX `fk_tb_tipopedido_has_tb_designer_tb_tipopedido1_idx` (`tb_tipopedido_id_tipo` ASC) VISIBLE,
  CONSTRAINT `fk_tb_tipopedido_has_tb_designer_tb_tipopedido1`
    FOREIGN KEY (`tb_tipopedido_id_tipo`)
    REFERENCES `dbprojetod`.`tb_tipopedido` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_tipopedido_has_tb_designer_tb_designer1`
    FOREIGN KEY (`tb_designer_id_designer`)
    REFERENCES `dbprojetod`.`tb_perfil_designer` (`id_designer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbprojetod`.`tb_exemplo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbprojetod`.`tb_exemplo` (
  `id_exemplo` INT NOT NULL AUTO_INCREMENT,
  `link_midia` VARCHAR(255) NULL,
  `tb_pedido_num_pedido` INT NOT NULL,
  PRIMARY KEY (`id_exemplo`),
  UNIQUE INDEX `id_exemplo_UNIQUE` (`id_exemplo` ASC) VISIBLE,
  INDEX `fk_table1_tb_pedido1_idx` (`tb_pedido_num_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_table1_tb_pedido1`
    FOREIGN KEY (`tb_pedido_num_pedido`)
    REFERENCES `dbprojetod`.`tb_pedido` (`num_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
