--
-- Table structure for table `os_servicos`
--
TABLE `os_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `valor_venda` decimal(8,2) NOT NULL,
  `valor_original` decimal(8,2) NOT NULL,
  `desconto_supervisao` decimal(8,2) NOT NULL DEFAULT '0.00',
  `desconto_migracao_cortesia` decimal(8,2) NOT NULL DEFAULT '0.00',
  `desconto_avista` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valor_venda_real` decimal(8,2) GENERATED ALWAYS AS (if((`os_tipo_id` = 5),`valor_original`,(((`valor_venda` - `desconto_supervisao`) - `desconto_migracao_cortesia`) - `desconto_avista`))) VIRTUAL,
  `desconto_bonus` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `fechado` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_fechamento` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data_fechamento` datetime DEFAULT NULL,
  `fechado_sem_codigo` tinyint(1) NOT NULL DEFAULT '0',
  `justificativa_sem_codigo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `solicitado_cancelamento` tinyint(1) NOT NULL DEFAULT '0',
  `token_segunda_aplicacao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `executada_segunda_aplicacao` tinyint(1) NOT NULL DEFAULT '0',
  `ordem_pcp` int unsigned DEFAULT NULL,
  `os_id` int unsigned NOT NULL,
  `os_tipo_id` int unsigned DEFAULT NULL,
  `servico_id` int unsigned NOT NULL,
  `tonalidade_id` int unsigned DEFAULT NULL,
  `combo_id` int unsigned DEFAULT NULL,
  `produtivo_id` int unsigned DEFAULT NULL,
  `concessionaria_execucao_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `plotter_corte_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `os_servicos_os_id_foreign` (`os_id`),
  KEY `os_servicos_servico_id_foreign` (`servico_id`),
  KEY `os_servicos_tonalidade_id_foreign` (`tonalidade_id`),
  KEY `os_servicos_combo_id_foreign` (`combo_id`),
  KEY `os_servicos_produtivo_id_foreign` (`produtivo_id`),
  KEY `os_servicos_plotter_corte_id_foreign` (`plotter_corte_id`),
  KEY `os_servico_fechado` (`fechado`),
  KEY `os_servico_cancelado` (`cancelado`),
  KEY `os_servicos_deleted_at` (`deleted_at`),
  KEY `produtividade` (`deleted_at`,`fechado`,`cancelado`,`data_fechamento`),
  KEY `oscei` (`concessionaria_execucao_id`),
  KEY `os_servicos_os_tipo_id_foreign` (`os_tipo_id`),
  CONSTRAINT `os_servicos_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `os_servicos_os_id_foreign` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `os_servicos_os_tipo_id_foreign` FOREIGN KEY (`os_tipo_id`) REFERENCES `os_tipos` (`id`),
  CONSTRAINT `os_servicos_plotter_corte_id_foreign` FOREIGN KEY (`plotter_corte_id`) REFERENCES `plotter_cortes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `os_servicos_produtivo_id_foreign` FOREIGN KEY (`produtivo_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `os_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `os_servicos_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `oscei` FOREIGN KEY (`concessionaria_execucao_id`) REFERENCES `concessionarias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279987 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;