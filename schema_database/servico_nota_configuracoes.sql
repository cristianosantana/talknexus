--
-- Table structure for table `servico_nota_configuracoes`
--
TABLE `servico_nota_configuracoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ncm` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cfop` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cest` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tipo_nota` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `porcentagem_emissao` int DEFAULT NULL,
  `medida_venda` decimal(8,2) NOT NULL DEFAULT '1.00',
  `substituicao_tributaria` tinyint(1) NOT NULL DEFAULT '0',
  `servico_id` int unsigned NOT NULL,
  `empresa_id` int unsigned NOT NULL,
  `medida_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_nota_configuracoes_servico_id_foreign` (`servico_id`),
  KEY `servico_nota_configuracoes_empresa_id_foreign` (`empresa_id`),
  KEY `servico_nota_configuracoes_medida_id_foreign` (`medida_id`),
  KEY `servico_nota_configuracoes_updated_by_foreign` (`updated_by`),
  CONSTRAINT `servico_nota_configuracoes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `servico_nota_configuracoes_medida_id_foreign` FOREIGN KEY (`medida_id`) REFERENCES `medidas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `servico_nota_configuracoes_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `servico_nota_configuracoes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1502 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;