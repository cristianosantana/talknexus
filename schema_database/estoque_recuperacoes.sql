--
-- Table structure for table `estoque_recuperacoes`
--
TABLE `estoque_recuperacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `estoque_entrada_produto_id` int unsigned NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estoque_recuperacoes_estoque_entrada_produto_id_foreign` (`estoque_entrada_produto_id`),
  KEY `estoque_recuperacoes_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `estoque_recuperacoes_estoque_entrada_produto_id_foreign` FOREIGN KEY (`estoque_entrada_produto_id`) REFERENCES `estoque_entrada_produtos` (`id`),
  CONSTRAINT `estoque_recuperacoes_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;