--
-- Table structure for table `estoque_saidas`
--
TABLE `estoque_saidas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `observacao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitado_cancelamento` tinyint(1) NOT NULL DEFAULT '0',
  `motivo_cancelamento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `funcionario_registro_id` int unsigned DEFAULT NULL,
  `estoque_saida_tipo_id` bigint unsigned NOT NULL,
  `estoque_saida_status_id` bigint unsigned NOT NULL,
  `concessionaria_id` int unsigned DEFAULT NULL,
  `concessionaria_execucao_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `esfri` (`funcionario_registro_id`),
  KEY `esesti` (`estoque_saida_tipo_id`),
  KEY `esessi` (`estoque_saida_status_id`),
  KEY `esci` (`concessionaria_id`),
  KEY `escei` (`concessionaria_execucao_id`),
  CONSTRAINT `escei` FOREIGN KEY (`concessionaria_execucao_id`) REFERENCES `concessionarias` (`id`),
  CONSTRAINT `esci` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esessi` FOREIGN KEY (`estoque_saida_status_id`) REFERENCES `estoque_saida_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esesti` FOREIGN KEY (`estoque_saida_tipo_id`) REFERENCES `estoque_saida_tipos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esfri` FOREIGN KEY (`funcionario_registro_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;