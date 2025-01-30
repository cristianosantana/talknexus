--
-- Table structure for table `concessionaria_caixa_tipos`
--
TABLE `concessionaria_caixa_tipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `caixa_tipo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `concessionaria_caixa_tipos_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `concessionaria_caixa_tipos_caixa_tipo_id_foreign` (`caixa_tipo_id`),
  CONSTRAINT `concessionaria_caixa_tipos_caixa_tipo_id_foreign` FOREIGN KEY (`caixa_tipo_id`) REFERENCES `caixa_tipos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `concessionaria_caixa_tipos_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2995 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;