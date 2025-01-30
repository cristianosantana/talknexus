--
-- Table structure for table `venda_meta_departamentos`
--
TABLE `venda_meta_departamentos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `departamento_id` int unsigned NOT NULL,
  `venda_meta_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_meta_departamentos_departamento_id_foreign` (`departamento_id`),
  KEY `venda_meta_departamentos_venda_meta_id_foreign` (`venda_meta_id`),
  CONSTRAINT `venda_meta_departamentos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venda_meta_departamentos_venda_meta_id_foreign` FOREIGN KEY (`venda_meta_id`) REFERENCES `venda_metas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2823 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;