--
-- Table structure for table `carro_modelos`
--
TABLE `carro_modelos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `carro_marca_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carro_modelos_carro_marca_id_foreign` (`carro_marca_id`),
  KEY `carro_modelos_deleted_at` (`deleted_at`),
  CONSTRAINT `carro_modelos_carro_marca_id_foreign` FOREIGN KEY (`carro_marca_id`) REFERENCES `carro_marcas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=978 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;