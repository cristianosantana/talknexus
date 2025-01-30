--
-- Table structure for table `remessa_historico_remocao_os`
--
TABLE `remessa_historico_remocao_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `justificativa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `funcionario_id` int unsigned NOT NULL,
  `os_id` int unsigned NOT NULL,
  `remessa_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_historico_remocao_os_funcionario_id_foreign` (`funcionario_id`),
  KEY `remessa_historico_remocao_os_os_id_foreign` (`os_id`),
  KEY `remessa_historico_remocao_os_remessa_id_foreign` (`remessa_id`),
  CONSTRAINT `remessa_historico_remocao_os_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `remessa_historico_remocao_os_os_id_foreign` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `remessa_historico_remocao_os_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;