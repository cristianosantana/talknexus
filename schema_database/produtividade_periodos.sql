--
-- Table structure for table `produtividade_periodos`
--
TABLE `produtividade_periodos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ano` int unsigned NOT NULL,
  `mes` int unsigned NOT NULL,
  `dias_uteis` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;