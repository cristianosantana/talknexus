--
-- Table structure for table `plotter_vencimento_kits`
--
TABLE `plotter_vencimento_kits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vencimento` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_vencimento_kits_produto_id_foreign` (`produto_id`),
  CONSTRAINT `plotter_vencimento_kits_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;