create database dbSIAT;

use dbSIAT;

CREATE TABLE IF NOT EXISTS `Cliente` (
	`id_Cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`cpf` char(11) NOT NULL UNIQUE,
	`telefone` varchar(15) NOT NULL,
	`endereco` varchar(200),
	PRIMARY KEY (`id_Cliente`)
);

CREATE TABLE IF NOT EXISTS `aparelho` (
	`id_aparelho` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_cliente` int NOT NULL,
	`marca` varchar(50) NOT NULL,
	`modelo` varchar(100) NOT NULL,
	`imei` varchar(20),
	PRIMARY KEY (`id_aparelho`)
);

CREATE TABLE IF NOT EXISTS `usuario` (
	`id_usuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`login` varchar(50) NOT NULL,
	`senha` varchar(255) NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

CREATE TABLE IF NOT EXISTS `ordem_servico` (
	`id_os` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_aparelho` int NOT NULL,
	`id_usuario` int NOT NULL,
	`data_entrada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`data_saida` datetime, 
	`defeito` text NOT NULL,
	`diagnostico` text,
	`valor_orcamento` decimal(10,2) NOT NULL DEFAULT 0.00,
	`status` varchar(30) NOT NULL DEFAULT 'Recebido',
	PRIMARY KEY (`id_os`)
);

CREATE TABLE IF NOT EXISTS `pagamento` (
	`id_pagamento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_os` int NOT NULL,
	`valor_pago` decimal(10,2) NOT NULL,
	`forma_pagamento` enum('Dinheiro', 'Pix', 'Cartão Debito','Cartão Credito'),
	PRIMARY KEY (`id_pagamento`)
);

ALTER TABLE `aparelho` ADD CONSTRAINT `aparelho_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_Cliente`);
ALTER TABLE `ordem_servico` ADD CONSTRAINT `ordem_servico_fk1` FOREIGN KEY (`id_aparelho`) REFERENCES `aparelho`(`id_aparelho`);
ALTER TABLE `ordem_servico` ADD CONSTRAINT `ordem_servico_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`);
ALTER TABLE `pagamento` ADD CONSTRAINT `pagamento_fk1` FOREIGN KEY (`id_os`) REFERENCES `ordem_servico`(`id_os`);