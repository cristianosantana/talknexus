--
-- Table structure for table `plotter_saida_corte_pecas`
--
TABLE `plotter_saida_corte_pecas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plotter_saida_corte_id` bigint unsigned NOT NULL,
  `plotter_peca_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pscppsci` (`plotter_saida_corte_id`),
  KEY `pscpppi` (`plotter_peca_id`),
  CONSTRAINT `pscpppi` FOREIGN KEY (`plotter_peca_id`) REFERENCES `plotter_pecas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pscppsci` FOREIGN KEY (`plotter_saida_corte_id`) REFERENCES `plotter_saida_cortes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;