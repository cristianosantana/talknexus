--
-- Table structure for table `indicadores`
--
TABLE `indicadores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nome_mae` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `numero_cartao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nome_completo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `cpf` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `matricula` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `funcao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `agencia` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `conta` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `telefone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `indicador_tipo_id` int unsigned NOT NULL,
  `banco_id` int unsigned DEFAULT NULL,
  `banco_conta_tipo_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  KEY `indicadores_indicador_tipo_id_foreign` (`indicador_tipo_id`),
  KEY `indicadores_banco_id_foreign` (`banco_id`),
  KEY `indicadores_banco_conta_tipo_id_foreign` (`banco_conta_tipo_id`),
  KEY `indicadores_cpf_index` (`cpf`),
  CONSTRAINT `indicadores_banco_conta_tipo_id_foreign` FOREIGN KEY (`banco_conta_tipo_id`) REFERENCES `banco_conta_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `indicadores_banco_id_foreign` FOREIGN KEY (`banco_id`) REFERENCES `bancos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `indicadores_indicador_tipo_id_foreign` FOREIGN KEY (`indicador_tipo_id`) REFERENCES `indicador_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7269 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;