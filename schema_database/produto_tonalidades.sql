--
-- Table structure for table `produto_tonalidades`
--
TABLE `produto_tonalidades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `tonalidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_tonalidades_produto_id_foreign` (`produto_id`),
  KEY `produto_tonalidades_tonalidade_id_foreign` (`tonalidade_id`),
  KEY `produto_tonalidades_index` (`produto_id`,`tonalidade_id`,`deleted_at`),
  CONSTRAINT `produto_tonalidades_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `produto_tonalidades_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;