--
-- Table structure for table `proposta_servicos`
--
TABLE `proposta_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_venda` decimal(8,2) unsigned NOT NULL,
  `valor_original` decimal(8,2) unsigned NOT NULL,
  `desconto_supervisao` decimal(8,2) unsigned NOT NULL,
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `motivo_cancelamento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `proposta_id` int unsigned NOT NULL,
  `servico_id` int unsigned NOT NULL,
  `combo_id` int unsigned DEFAULT NULL,
  `tonalidade_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proposta_servicos_proposta_id_foreign` (`proposta_id`),
  KEY `proposta_servicos_servico_id_foreign` (`servico_id`),
  KEY `proposta_servicos_combo_id_foreign` (`combo_id`),
  KEY `proposta_servicos_tonalidade_id_foreign` (`tonalidade_id`),
  CONSTRAINT `proposta_servicos_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `proposta_servicos_proposta_id_foreign` FOREIGN KEY (`proposta_id`) REFERENCES `propostas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `proposta_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `proposta_servicos_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=220254 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
