--
-- Table structure for table `concessionaria_boletos`
--
TABLE `concessionaria_boletos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `concessionaria_boletos_concessionaria_id_foreign` (`concessionaria_id`),
  CONSTRAINT `concessionaria_boletos_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1958 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;