--
-- Table structure for table `remessas`
--
TABLE `remessas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_criacao` int unsigned NOT NULL,
  `tipo_remessa_id` int unsigned NOT NULL,
  `concessionaria_id` int unsigned NOT NULL,
  `cancelamento_motivo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `solicitado_cancelamento` tinyint(1) NOT NULL DEFAULT '0',
  `data_solicitacao_cancelamento` datetime DEFAULT NULL,
  `solicitado_por` int unsigned DEFAULT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `atendido_por` int unsigned DEFAULT NULL,
  `email_enviado` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessas_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `remessas_solicitado_por_foreign` (`solicitado_por`),
  KEY `remessas_atendido_por_foreign` (`atendido_por`),
  CONSTRAINT `remessas_atendido_por_foreign` FOREIGN KEY (`atendido_por`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessas_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessas_solicitado_por_foreign` FOREIGN KEY (`solicitado_por`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9355 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;