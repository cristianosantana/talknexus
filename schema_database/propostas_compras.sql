--
-- Table structure for table `propostas_compras`
--
TABLE `propostas_compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `finalizada` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `funcionario_finalizacao_id` int unsigned DEFAULT NULL,
  `estoque_id` int unsigned NOT NULL,
  `fornecedor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propostas_compras_funcionario_finalizacao_id_foreign` (`funcionario_finalizacao_id`),
  KEY `propostas_compras_estoque_id_foreign` (`estoque_id`),
  KEY `propostas_compras_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `propostas_compras_estoque_id_foreign` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `propostas_compras_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `propostas_compras_funcionario_finalizacao_id_foreign` FOREIGN KEY (`funcionario_finalizacao_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
