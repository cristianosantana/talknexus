--
-- Table structure for table `estoque_fracionamento_fracoes`
--
TABLE `estoque_fracionamento_fracoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tamanho` double(8,2) unsigned NOT NULL,
  `tamanho_secundario` double(8,2) unsigned NOT NULL,
  `codigo` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `observacao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `estoque_fracionamento_id` int unsigned NOT NULL,
  `estoque_id` int unsigned NOT NULL,
  `estoque_fracionamento_secundario_id` int unsigned DEFAULT NULL,
  `concessionaria_id` int unsigned DEFAULT NULL,
  `os_servico_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eff_ef` (`estoque_fracionamento_id`),
  KEY `estoque_fracionamento_fracoes_estoque_id_foreign` (`estoque_id`),
  KEY `eff_efs` (`estoque_fracionamento_secundario_id`),
  KEY `estoque_fracionamento_fracoes_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `estoque_fracionamento_fracoes_os_servico_id_foreign` (`os_servico_id`),
  CONSTRAINT `eff_ef` FOREIGN KEY (`estoque_fracionamento_id`) REFERENCES `estoque_fracionamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `eff_efs` FOREIGN KEY (`estoque_fracionamento_secundario_id`) REFERENCES `estoque_fracionamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `estoque_fracionamento_fracoes_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `estoque_fracionamento_fracoes_estoque_id_foreign` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `estoque_fracionamento_fracoes_os_servico_id_foreign` FOREIGN KEY (`os_servico_id`) REFERENCES `os_servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;