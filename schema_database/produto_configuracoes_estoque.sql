--
-- Table structure for table `produto_configuracoes_estoque`
--
TABLE `produto_configuracoes_estoque` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `estoque_minimo` int unsigned NOT NULL,
  `estoque_maximo` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `produto_id` int unsigned NOT NULL,
  `produto_tamanho_id` int unsigned NOT NULL,
  `tonalidade_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_configuracoes_estoque_produto_id_foreign` (`produto_id`),
  KEY `produto_configuracoes_estoque_produto_tamanho_id_foreign` (`produto_tamanho_id`),
  KEY `produto_configuracoes_estoque_tonalidade_id_foreign` (`tonalidade_id`),
  CONSTRAINT `produto_configuracoes_estoque_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produto_configuracoes_estoque_produto_tamanho_id_foreign` FOREIGN KEY (`produto_tamanho_id`) REFERENCES `produto_tamanhos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produto_configuracoes_estoque_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
