--
-- Table structure for table `funcionarios`
--
TABLE `funcionarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cpf` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rg` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `agencia` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `conta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_foto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `terceiros` tinyint(1) NOT NULL DEFAULT '0',
  `banco_id` int unsigned DEFAULT NULL,
  `banco_conta_tipo_id` int unsigned DEFAULT NULL,
  `funcionario_situacao_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `raca_cor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `funcionarios_rg_unique` (`rg`),
  UNIQUE KEY `funcionarios_cpf_unique` (`cpf`),
  KEY `funcionarios_funcionario_situacoes_id_foreign` (`funcionario_situacao_id`),
  KEY `fbi` (`banco_id`),
  KEY `fbcti` (`banco_conta_tipo_id`),
  KEY `funcionarios_deleted_at` (`deleted_at`),
  CONSTRAINT `fbcti` FOREIGN KEY (`banco_conta_tipo_id`) REFERENCES `banco_conta_tipos` (`id`),
  CONSTRAINT `fbi` FOREIGN KEY (`banco_id`) REFERENCES `bancos` (`id`),
  CONSTRAINT `funcionarios_funcionario_situacoes_id_foreign` FOREIGN KEY (`funcionario_situacao_id`) REFERENCES `funcionario_situacoes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
