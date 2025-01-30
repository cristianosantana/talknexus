--
-- Table structure for table `combo_servico_substitutos`
--
TABLE `combo_servico_substitutos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `combo_servico_id` int unsigned NOT NULL,
  `servico_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `combo_servico_substitutos_combo_servico_id_foreign` (`combo_servico_id`),
  KEY `combo_servico_substitutos_servico_id_foreign` (`servico_id`),
  CONSTRAINT `combo_servico_substitutos_combo_servico_id_foreign` FOREIGN KEY (`combo_servico_id`) REFERENCES `combo_servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `combo_servico_substitutos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;