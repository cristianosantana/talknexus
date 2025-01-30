--
-- Table structure for table `plotter_metragens`
--
TABLE `plotter_metragens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `metragem` decimal(8,2) unsigned NOT NULL,
  `metragem_sem_vidro_traseiro` decimal(8,2) unsigned DEFAULT NULL,
  `carro_modelo_id` int unsigned NOT NULL,
  `produto_id` int unsigned DEFAULT NULL,
  `tonalidade_id` int unsigned DEFAULT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_metragens_carro_modelo_id_foreign` (`carro_modelo_id`),
  KEY `plotter_metragens_funcionario_id_foreign` (`funcionario_id`),
  KEY `plotter_metragens_produto_id_foreign` (`produto_id`),
  KEY `plotter_metragens_tonalidade_id_foreign` (`tonalidade_id`),
  CONSTRAINT `plotter_metragens_carro_modelo_id_foreign` FOREIGN KEY (`carro_modelo_id`) REFERENCES `carro_modelos` (`id`),
  CONSTRAINT `plotter_metragens_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `plotter_metragens_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `plotter_metragens_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;