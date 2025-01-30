--
-- Table structure for table `plotter_corte_pecas`
--
TABLE `plotter_corte_pecas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `plotter_corte_id` int unsigned NOT NULL,
  `plotter_peca_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pcp_pcId` (`plotter_corte_id`),
  KEY `pcp_ppId` (`plotter_peca_id`),
  CONSTRAINT `pcp_pcId` FOREIGN KEY (`plotter_corte_id`) REFERENCES `plotter_cortes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pcp_ppId` FOREIGN KEY (`plotter_peca_id`) REFERENCES `plotter_pecas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18550 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;