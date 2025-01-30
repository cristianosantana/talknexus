--
-- Table structure for table `tabela_comissao_servicos`
--
TABLE `tabela_comissao_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_dentro` decimal(7,3) DEFAULT NULL,
  `valor_fora` decimal(7,3) DEFAULT NULL,
  `porcentagem` tinyint(1) NOT NULL DEFAULT '0',
  `departamento_id` int unsigned DEFAULT NULL,
  `carro_porte_id` int unsigned DEFAULT NULL,
  `indicador_tipo_id` int unsigned DEFAULT NULL,
  `servico_id` int unsigned NOT NULL,
  `funcionario_cadastro_id` int unsigned DEFAULT NULL,
  `tabela_comissao_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tabela_comissao_servicos_departamento_id_foreign` (`departamento_id`),
  KEY `tabela_comissao_servicos_carro_porte_id_foreign` (`carro_porte_id`),
  KEY `tabela_comissao_servicos_indicador_tipo_id_foreign` (`indicador_tipo_id`),
  KEY `tabela_comissao_servicos_servico_id_foreign` (`servico_id`),
  KEY `tabela_comissao_servicos_tabela_comissao_id_foreign` (`tabela_comissao_id`),
  KEY `tcsfci` (`funcionario_cadastro_id`),
  CONSTRAINT `tabela_comissao_servicos_carro_porte_id_foreign` FOREIGN KEY (`carro_porte_id`) REFERENCES `carro_portes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_comissao_servicos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_comissao_servicos_indicador_tipo_id_foreign` FOREIGN KEY (`indicador_tipo_id`) REFERENCES `indicador_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_comissao_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_comissao_servicos_tabela_comissao_id_foreign` FOREIGN KEY (`tabela_comissao_id`) REFERENCES `tabelas_comissoes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tcsfci` FOREIGN KEY (`funcionario_cadastro_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24215 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;