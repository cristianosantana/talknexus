--
-- Table structure for table `produto_concessionaria_estoques`
--
TABLE `produto_concessionaria_estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `estoque_minimo` int unsigned NOT NULL,
  `estoque_maximo` int unsigned NOT NULL,
  `concessionaria_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `produto_tamanho_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_concessionaria_estoques_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `produto_concessionaria_estoques_produto_id_foreign` (`produto_id`),
  KEY `produto_concessionaria_estoques_produto_tamanho_id_foreign` (`produto_tamanho_id`),
  CONSTRAINT `produto_concessionaria_estoques_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `produto_concessionaria_estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `produto_concessionaria_estoques_produto_tamanho_id_foreign` FOREIGN KEY (`produto_tamanho_id`) REFERENCES `produto_tamanhos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
