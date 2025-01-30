--
-- Table structure for table `financeiro_recibos`
--
TABLE `financeiro_recibos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(8,2) unsigned NOT NULL,
  `nome` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cpf` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `conteudo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `empresa_id` int unsigned NOT NULL,
  `financeiro_recibo_tipo_id` int unsigned NOT NULL,
  `funcionario_emissao_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financeiro_recibos_empresa_id_foreign` (`empresa_id`),
  KEY `financeiro_recibos_financeiro_recibo_tipo_id_foreign` (`financeiro_recibo_tipo_id`),
  KEY `financeiro_recibos_funcionario_emissao_id_foreign` (`funcionario_emissao_id`),
  CONSTRAINT `financeiro_recibos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `financeiro_recibos_financeiro_recibo_tipo_id_foreign` FOREIGN KEY (`financeiro_recibo_tipo_id`) REFERENCES `financeiro_recibo_tipos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `financeiro_recibos_funcionario_emissao_id_foreign` FOREIGN KEY (`funcionario_emissao_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;