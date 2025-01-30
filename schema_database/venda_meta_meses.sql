--
-- Table structure for table `venda_meta_meses`
--
TABLE `venda_meta_meses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mes_referencia` int unsigned NOT NULL,
  `valor_meta` decimal(8,2) unsigned NOT NULL,
  `porcentagem_minima_meta` decimal(8,2) unsigned NOT NULL,
  `porcentagem_minima_recebimento` decimal(8,2) unsigned NOT NULL,
  `venda_meta_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_meta_meses_venda_meta_id_foreign` (`venda_meta_id`),
  CONSTRAINT `venda_meta_meses_venda_meta_id_foreign` FOREIGN KEY (`venda_meta_id`) REFERENCES `venda_metas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7837 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;