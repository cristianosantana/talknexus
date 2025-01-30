--
-- Table structure for table `remessa_os_lotes`
--
TABLE `remessa_os_lotes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_depositado` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `usuario_criacao` int unsigned NOT NULL,
  `tipo_remessa_id` int unsigned NOT NULL,
  `caixa_conta_id` int unsigned NOT NULL,
  `concessionaria_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_os_lotes_usuario_criacao_foreign` (`usuario_criacao`),
  KEY `remessa_os_lotes_tipo_remessa_id_foreign` (`tipo_remessa_id`),
  KEY `remessa_os_lotes_caixa_conta_id_foreign` (`caixa_conta_id`),
  KEY `remessa_os_lotes_concessionaria_id_foreign` (`concessionaria_id`),
  CONSTRAINT `remessa_os_lotes_caixa_conta_id_foreign` FOREIGN KEY (`caixa_conta_id`) REFERENCES `caixa_contas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessa_os_lotes_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessa_os_lotes_tipo_remessa_id_foreign` FOREIGN KEY (`tipo_remessa_id`) REFERENCES `tipo_remessas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessa_os_lotes_usuario_criacao_foreign` FOREIGN KEY (`usuario_criacao`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7861 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;