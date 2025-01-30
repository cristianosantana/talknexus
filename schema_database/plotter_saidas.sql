--
-- Table structure for table `plotter_saidas`
--
TABLE `plotter_saidas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `observacao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `solicitado_cancelamento` tinyint(1) NOT NULL DEFAULT '0',
  `motivo_cancelamento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcionario_registro_id` int unsigned DEFAULT NULL,
  `plotter_saida_tipo_id` bigint unsigned NOT NULL,
  `plotter_saida_status_id` bigint unsigned NOT NULL,
  `concessionaria_id` int unsigned DEFAULT NULL,
  `concessionaria_execucao_id` int unsigned DEFAULT NULL,
  `os_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `psfri` (`funcionario_registro_id`),
  KEY `pspsit` (`plotter_saida_tipo_id`),
  KEY `pspssi` (`plotter_saida_status_id`),
  KEY `psci` (`concessionaria_id`),
  KEY `psoi` (`os_id`),
  KEY `pscei` (`concessionaria_execucao_id`),
  CONSTRAINT `pscei` FOREIGN KEY (`concessionaria_execucao_id`) REFERENCES `concessionarias` (`id`),
  CONSTRAINT `psci` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `psfri` FOREIGN KEY (`funcionario_registro_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `psoi` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pspsit` FOREIGN KEY (`plotter_saida_tipo_id`) REFERENCES `plotter_saida_tipos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pspssi` FOREIGN KEY (`plotter_saida_status_id`) REFERENCES `plotter_saida_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=70805 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;