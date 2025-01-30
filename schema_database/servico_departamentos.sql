--
-- Table structure for table `servico_departamentos`
--
TABLE `servico_departamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` int unsigned NOT NULL,
  `servico_acessorio_id` int unsigned DEFAULT NULL,
  `departamento_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_departamentos_servico_id_foreign` (`servico_id`),
  KEY `servico_departamentos_departamento_id_foreign` (`departamento_id`),
  KEY `servico_departamentos_servico_acessorio_id_foreign` (`servico_acessorio_id`),
  KEY `servico_departamentos_index` (`servico_id`,`departamento_id`,`ativo`,`deleted_at`),
  CONSTRAINT `servico_departamentos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `servico_departamentos_servico_acessorio_id_foreign` FOREIGN KEY (`servico_acessorio_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `servico_departamentos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;