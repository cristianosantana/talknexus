--
-- Table structure for table `venda_meta_os_tipos`
--
TABLE `venda_meta_os_tipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `venda_meta_id` bigint unsigned NOT NULL,
  `os_tipo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_meta_os_tipos_venda_meta_id_foreign` (`venda_meta_id`),
  KEY `venda_meta_os_tipos_os_tipo_id_foreign` (`os_tipo_id`),
  CONSTRAINT `venda_meta_os_tipos_os_tipo_id_foreign` FOREIGN KEY (`os_tipo_id`) REFERENCES `os_tipos` (`id`),
  CONSTRAINT `venda_meta_os_tipos_venda_meta_id_foreign` FOREIGN KEY (`venda_meta_id`) REFERENCES `venda_metas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;