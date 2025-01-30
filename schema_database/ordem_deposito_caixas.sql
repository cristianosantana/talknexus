--
-- Table structure for table `ordem_deposito_caixas`
--
TABLE `ordem_deposito_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `caixa_id` int unsigned NOT NULL,
  `ordem_deposito_id` int unsigned NOT NULL,
  `devolvido` tinyint(1) NOT NULL DEFAULT '0',
  `data_devolucao` datetime DEFAULT NULL,
  `inadimplente` tinyint(1) NOT NULL DEFAULT '0',
  `data_inadimplencia` datetime DEFAULT NULL,
  `recuperado` tinyint(1) NOT NULL DEFAULT '0',
  `data_resgate` datetime DEFAULT NULL,
  `observacao_resgate` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordem_deposito_caixas_caixa_id_foreign` (`caixa_id`),
  KEY `ordem_deposito_caixas_ordem_deposito_id_foreign` (`ordem_deposito_id`),
  CONSTRAINT `ordem_deposito_caixas_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordem_deposito_caixas_ordem_deposito_id_foreign` FOREIGN KEY (`ordem_deposito_id`) REFERENCES `ordens_deposito` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1507 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;