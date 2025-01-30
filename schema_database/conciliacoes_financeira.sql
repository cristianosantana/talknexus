--
-- Table structure for table `conciliacoes_financeira`
--
TABLE `conciliacoes_financeira` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int unsigned DEFAULT NULL,
  `concessionaria_os_id` int unsigned DEFAULT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `caixa_id` int unsigned DEFAULT NULL,
  `data_transacao` datetime NOT NULL,
  `valor_bruto` decimal(8,2) DEFAULT NULL,
  `taxa` decimal(4,2) DEFAULT NULL,
  `previsao_pagamento` datetime NOT NULL,
  `valor_liquido` decimal(8,2) DEFAULT NULL,
  `quantidade_parcelas` int DEFAULT NULL,
  `transacao_id_externo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `conciliado_cielo` tinyint(1) NOT NULL DEFAULT '0',
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `origem` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cflcid` (`cliente_id`),
  KEY `cfemid` (`empresa_id`),
  KEY `cfcaid` (`caixa_id`),
  KEY `cfcoid` (`concessionaria_os_id`),
  CONSTRAINT `cfcaid` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`),
  CONSTRAINT `cfcoid` FOREIGN KEY (`concessionaria_os_id`) REFERENCES `concessionarias` (`id`),
  CONSTRAINT `cfemid` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `cflcid` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11907 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;