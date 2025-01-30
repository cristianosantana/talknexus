--
-- Table structure for table `servico_garantias`
--
TABLE `servico_garantias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `texto` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prazo` int NOT NULL,
  `prazo_tipo` int NOT NULL,
  `servico_id` int unsigned NOT NULL,
  `durabilidade` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_garantias_servico_id_foreign` (`servico_id`),
  CONSTRAINT `servico_garantias_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;