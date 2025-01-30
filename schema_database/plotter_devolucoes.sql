--
-- Table structure for table `plotter_devolucoes`
--
TABLE `plotter_devolucoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `justificativa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `funcionario_devolucao_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_devolucoes_funcionario_devolucao_id_foreign` (`funcionario_devolucao_id`),
  CONSTRAINT `plotter_devolucoes_funcionario_devolucao_id_foreign` FOREIGN KEY (`funcionario_devolucao_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;