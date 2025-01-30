--
-- Table structure for table `concessionaria_produtivos`
--
TABLE `concessionaria_produtivos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `produtivo_tipo_id` int unsigned NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `concessionaria_produtivos_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `concessionaria_produtivos_produtivo_tipo_id_foreign` (`produtivo_tipo_id`),
  KEY `concessionaria_produtivos_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `concessionaria_produtivos_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`),
  CONSTRAINT `concessionaria_produtivos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `concessionaria_produtivos_produtivo_tipo_id_foreign` FOREIGN KEY (`produtivo_tipo_id`) REFERENCES `produtivo_tipos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;