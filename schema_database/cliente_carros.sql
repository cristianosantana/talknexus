--
-- Table structure for table `cliente_carros`
--
TABLE `cliente_carros` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chassi` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `placa` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ano_modelo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `cadastro_parcial` tinyint(1) NOT NULL DEFAULT '0',
  `cliente_id` int unsigned NOT NULL,
  `carro_cor_id` int unsigned NOT NULL,
  `carro_modelo_id` int unsigned NOT NULL,
  `carro_submodelo_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_carros_cliente_id_foreign` (`cliente_id`),
  KEY `cliente_carros_carro_cor_id_foreign` (`carro_cor_id`),
  KEY `cliente_carros_carro_modelo_id_foreign` (`carro_modelo_id`),
  KEY `cliente_carros_carro_submodelo_id_foreign` (`carro_submodelo_id`),
  KEY `cliente_carros_cadastro_parcial` (`cadastro_parcial`),
  KEY `cliente_carros_deleted_at` (`deleted_at`),
  CONSTRAINT `cliente_carros_carro_cor_id_foreign` FOREIGN KEY (`carro_cor_id`) REFERENCES `carro_cores` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cliente_carros_carro_modelo_id_foreign` FOREIGN KEY (`carro_modelo_id`) REFERENCES `carro_modelos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cliente_carros_carro_submodelo_id_foreign` FOREIGN KEY (`carro_submodelo_id`) REFERENCES `carro_submodelos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cliente_carros_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=119726 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;