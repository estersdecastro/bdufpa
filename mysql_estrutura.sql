CREATE TABLE `Usuario` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `nome_social` varchar(128),
  `email` varchar(64) UNIQUE NOT NULL,
  `celular` varchar(32),
  `pcd` boolean NOT NULL,
  `pcd_tipo` varchar(32) NOT NULL,
  `campus` varchar(64) NOT NULL,
  `instituto` varchar(64) NOT NULL,
  `tipo_login` varchar(32) NOT NULL,
  `senha` varchar(256) NOT NULL
);

CREATE TABLE `Usuario_Discente` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(32) UNIQUE NOT NULL,
  `curso` varchar(32) NOT NULL,
  `id_usuario` int NOT NULL
);

CREATE TABLE `Usuario_Docente` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(32) UNIQUE NOT NULL,
  `curso` varchar(32) NOT NULL,
  `nucleo` boolean NOT NULL,
  `id_usuario` int NOT NULL
);

CREATE TABLE `Usuario_Colaborador` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cpf` varchar(32) UNIQUE NOT NULL,
  `id_usuario` int NOT NULL
);

CREATE TABLE `Usuario_TAE` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(32) UNIQUE NOT NULL,
  `nucleo` boolean NOT NULL,
  `id_usuario` int NOT NULL
);

CREATE TABLE `Usuario_TecAccesibilidade` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(32) UNIQUE NOT NULL,
  `nucleo` boolean NOT NULL,
  `id_usuario` int NOT NULL
);

CREATE TABLE `Categorias` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(32) NOT NULL
);

CREATE TABLE `PEA` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `formato` varchar(32),
  `tipo` varchar(32) NOT NULL,
  `id_categoria` int,
  `local` varchar(32) NOT NULL,
  `uso` varchar(32) NOT NULL COMMENT 'Indidual|Grupo',  
  `fonte_original` varchar(128) NOT NULL,
  `cid_pcd` VARCHAR(32) NOT NULL,
  `comentario` TEXT
);

ALTER TABLE `Usuario_Discente` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`);

ALTER TABLE `Usuario_TAE` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`);

ALTER TABLE `Usuario_Colaborador` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`);

ALTER TABLE `Usuario_Docente` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`);

ALTER TABLE `Usuario_TecAccesibilidade` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id`);

ALTER TABLE `PEA` ADD FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`id`);