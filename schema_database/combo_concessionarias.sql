--
-- Table structure for table `combo_concessionarias`
--
TABLE `combo_concessionarias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `combo_id` int unsigned DEFAULT NULL,
  `concessionaria_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `combo_concessionaria_combo_id` (`combo_id`),
  KEY `combo_concessionaria_concessionaria_id` (`concessionaria_id`),
  CONSTRAINT `combo_concessionaria_combo_id` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`),
  CONSTRAINT `combo_concessionaria_concessionaria_id` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;