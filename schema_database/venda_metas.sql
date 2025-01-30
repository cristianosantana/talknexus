--
-- Table structure for table `venda_metas`
--
TABLE `venda_metas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ano_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concessionaria_id` int unsigned NOT NULL,
  `funcionario_cadastro_id` int unsigned DEFAULT NULL,
  `vendedor_treinador_id` int unsigned DEFAULT NULL,
  `vendedor_id` int unsigned DEFAULT NULL,
  `valor_premiacao_recebimento` decimal(8,2) unsigned DEFAULT '0.00',
  `porcentagem_minima_recebimento` decimal(8,2) unsigned DEFAULT '0.00',
  `valor_premiacao_dvu` decimal(8,2) unsigned DEFAULT '0.00',
  `valor_meta_dvu` decimal(8,2) unsigned DEFAULT '0.00',
  `valor_premiacao_dvn` decimal(8,2) unsigned DEFAULT '0.00',
  `valor_meta_dvn` decimal(8,2) unsigned DEFAULT '0.00',
  `valor_meta_frotista` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valor_premiacao_frotista` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valor_meta_oficina` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valor_premiacao_oficina` decimal(8,2) NOT NULL DEFAULT '0.00',
  `validade` date DEFAULT NULL,
  `periodo` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_metas_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `venda_metas_funcionario_cadastro_id_foreign` (`funcionario_cadastro_id`),
  KEY `venda_metas_vendedor_id` (`vendedor_id`),
  KEY `venda_metas_vendedor_treinador_id` (`vendedor_treinador_id`),
  CONSTRAINT `venda_metas_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venda_metas_funcionario_cadastro_id_foreign` FOREIGN KEY (`funcionario_cadastro_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venda_metas_vendedor_id` FOREIGN KEY (`vendedor_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `venda_metas_vendedor_treinador_id` FOREIGN KEY (`vendedor_treinador_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1717 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;