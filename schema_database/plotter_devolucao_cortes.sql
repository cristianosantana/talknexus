--
-- Table structure for table `plotter_devolucao_cortes`
--
TABLE `plotter_devolucao_cortes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plotter_devolucao_id` int unsigned NOT NULL,
  `plotter_corte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_devolucao_cortes_plotter_devolucao_id_foreign` (`plotter_devolucao_id`),
  KEY `plotter_devolucao_cortes_plotter_corte_id_foreign` (`plotter_corte_id`),
  CONSTRAINT `plotter_devolucao_cortes_plotter_corte_id_foreign` FOREIGN KEY (`plotter_corte_id`) REFERENCES `plotter_cortes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plotter_devolucao_cortes_plotter_devolucao_id_foreign` FOREIGN KEY (`plotter_devolucao_id`) REFERENCES `plotter_devolucoes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1440 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;