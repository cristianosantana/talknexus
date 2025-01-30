--
-- Table structure for table `combo_servicos`
--
TABLE `combo_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_venda` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_nfe` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `combo_id` int unsigned NOT NULL,
  `servico_id` int unsigned NOT NULL,
  `carro_porte_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `combo_servicos_combo_id_foreign` (`combo_id`),
  KEY `combo_servicos_servico_id_foreign` (`servico_id`),
  KEY `combo_servicos_carro_porte_id_foreign` (`carro_porte_id`),
  CONSTRAINT `combo_servicos_carro_porte_id_foreign` FOREIGN KEY (`carro_porte_id`) REFERENCES `carro_portes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `combo_servicos_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `combo_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;