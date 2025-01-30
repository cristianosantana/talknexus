--
-- Table structure for table `plotter_pecas`
--
TABLE `plotter_pecas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `credito_necessario` int NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `plotter_corte_tipo_id` int unsigned DEFAULT NULL,
  `servico_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_pecas_plotter_corte_tipo_id_foreign` (`plotter_corte_tipo_id`),
  KEY `plotter_pecas_servico_id_foreign` (`servico_id`),
  CONSTRAINT `plotter_pecas_plotter_corte_tipo_id_foreign` FOREIGN KEY (`plotter_corte_tipo_id`) REFERENCES `plotter_corte_tipos` (`id`),
  CONSTRAINT `plotter_pecas_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
