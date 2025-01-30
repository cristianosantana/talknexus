--
-- Table structure for table `tipo_remessa_concessionarias`
--
TABLE `tipo_remessa_concessionarias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `tipo_remessa_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_remessa_concessionarias_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `tipo_remessa_concessionarias_tipo_remessa_id_foreign` (`tipo_remessa_id`),
  CONSTRAINT `tipo_remessa_concessionarias_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tipo_remessa_concessionarias_tipo_remessa_id_foreign` FOREIGN KEY (`tipo_remessa_id`) REFERENCES `tipo_remessas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;