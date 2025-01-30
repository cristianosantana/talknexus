--
-- Table structure for table `plotter_cortes`
--
TABLE `plotter_cortes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `codigo_antigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `metragem_total` decimal(8,2) GENERATED ALWAYS AS ((((ifnull(`metragem`,0) + ifnull(`metragem_secundaria`,0)) + ifnull(`metragem_vidros_traseiros`,0)) + ifnull(`metragem_vidros_frontais`,0))) VIRTUAL,
  `metragem` decimal(8,2) NOT NULL,
  `recuperacao` tinyint(1) NOT NULL DEFAULT '0',
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `solicitado_cancelamento` tinyint(1) NOT NULL DEFAULT '0',
  `data_solicitacao_cancelamento` datetime DEFAULT NULL,
  `motivo_cancelamento` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `duas_portas` tinyint(1) NOT NULL DEFAULT '0',
  `liberado` tinyint(1) NOT NULL DEFAULT '0',
  `data_liberacao` datetime DEFAULT NULL,
  `concessionaria_liberacao_id` int unsigned DEFAULT NULL,
  `justificativa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `credito` int DEFAULT NULL,
  `usuario_finalizacao_id` int unsigned DEFAULT NULL,
  `usuario_solicitacao_cancelamento_id` int unsigned DEFAULT NULL,
  `usuario_cancelamento_id` int unsigned DEFAULT NULL,
  `usuario_liberacao_id` int unsigned DEFAULT NULL,
  `metragem_secundaria` decimal(8,2) DEFAULT NULL,
  `metragem_vidros_traseiros` decimal(8,2) DEFAULT NULL,
  `metragem_vidros_frontais` decimal(8,2) DEFAULT NULL,
  `plotter_bobina_secundaria_id` int unsigned DEFAULT NULL,
  `plotter_bobina_vidros_traseiros_id` int unsigned DEFAULT NULL,
  `plotter_bobina_vidros_frontais_id` int unsigned DEFAULT NULL,
  `plotter_corte_tipo_id` int unsigned NOT NULL,
  `carro_modelo_id` int unsigned DEFAULT NULL,
  `plotter_bobina_id` int unsigned NOT NULL,
  `os_servico_id` int unsigned DEFAULT NULL,
  `estoque_id` int unsigned DEFAULT NULL,
  `user_recuperacao_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_cortes_usuario_finalizacao_id_foreign` (`usuario_finalizacao_id`),
  KEY `plotter_cortes_usuario_cancelamento_id_foreign` (`usuario_cancelamento_id`),
  KEY `plotter_cortes_usuario_liberacao_id_foreign` (`usuario_liberacao_id`),
  KEY `pc_pbs` (`plotter_bobina_secundaria_id`),
  KEY `pc_pbvt` (`plotter_bobina_vidros_traseiros_id`),
  KEY `pc_pbvf` (`plotter_bobina_vidros_frontais_id`),
  KEY `plotter_cortes_plotter_corte_tipo_id_foreign` (`plotter_corte_tipo_id`),
  KEY `plotter_cortes_carro_modelo_id_foreign` (`carro_modelo_id`),
  KEY `plotter_cortes_plotter_bobina_id_foreign` (`plotter_bobina_id`),
  KEY `plotter_cortes_concessionaria_liberacao_id_foreign` (`concessionaria_liberacao_id`),
  KEY `plotter_cortes_os_servico_id_foreign` (`os_servico_id`),
  KEY `pcei` (`estoque_id`),
  KEY `plotter_cortes_usuario_solicitacao_cancelamento_id_foreign` (`usuario_solicitacao_cancelamento_id`),
  KEY `plotter_cortes_user_recuperacao_id_foreign` (`user_recuperacao_id`),
  CONSTRAINT `pc_pbs` FOREIGN KEY (`plotter_bobina_secundaria_id`) REFERENCES `plotter_bobinas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pc_pbvf` FOREIGN KEY (`plotter_bobina_vidros_frontais_id`) REFERENCES `plotter_bobinas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pc_pbvt` FOREIGN KEY (`plotter_bobina_vidros_traseiros_id`) REFERENCES `plotter_bobinas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pcei` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_carro_modelo_id_foreign` FOREIGN KEY (`carro_modelo_id`) REFERENCES `carro_modelos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_concessionaria_liberacao_id_foreign` FOREIGN KEY (`concessionaria_liberacao_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_os_servico_id_foreign` FOREIGN KEY (`os_servico_id`) REFERENCES `os_servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_plotter_bobina_id_foreign` FOREIGN KEY (`plotter_bobina_id`) REFERENCES `plotter_bobinas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_plotter_corte_tipo_id_foreign` FOREIGN KEY (`plotter_corte_tipo_id`) REFERENCES `plotter_corte_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_user_recuperacao_id_foreign` FOREIGN KEY (`user_recuperacao_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `plotter_cortes_usuario_cancelamento_id_foreign` FOREIGN KEY (`usuario_cancelamento_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_usuario_finalizacao_id_foreign` FOREIGN KEY (`usuario_finalizacao_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_usuario_liberacao_id_foreign` FOREIGN KEY (`usuario_liberacao_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `plotter_cortes_usuario_solicitacao_cancelamento_id_foreign` FOREIGN KEY (`usuario_solicitacao_cancelamento_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116638 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;