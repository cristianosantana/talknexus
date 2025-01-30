--
-- Table structure for table `tabela_preco_servicos`
--
TABLE `tabela_preco_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_maximo_venda` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_minimo_venda` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_nfe` decimal(7,2) unsigned NOT NULL DEFAULT '0.00',
  `servico_id` int unsigned NOT NULL,
  `combo_id` int unsigned DEFAULT NULL,
  `carro_porte_id` int unsigned NOT NULL,
  `departamento_id` int unsigned DEFAULT NULL,
  `funcionario_cadastro_id` int unsigned DEFAULT NULL,
  `tabela_preco_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tabela_preco_servicos_servico_id_foreign` (`servico_id`),
  KEY `tabela_preco_servicos_combo_id_foreign` (`combo_id`),
  KEY `tabela_preco_servicos_carro_porte_id_foreign` (`carro_porte_id`),
  KEY `tabela_preco_servicos_tabela_preco_id_foreign` (`tabela_preco_id`),
  KEY `tpsfci` (`funcionario_cadastro_id`),
  KEY `tpsdi` (`departamento_id`),
  CONSTRAINT `tabela_preco_servicos_carro_porte_id_foreign` FOREIGN KEY (`carro_porte_id`) REFERENCES `carro_portes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_preco_servicos_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_preco_servicos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_preco_servicos_tabela_preco_id_foreign` FOREIGN KEY (`tabela_preco_id`) REFERENCES `tabelas_precos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tpsdi` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `tpsfci` FOREIGN KEY (`funcionario_cadastro_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4592 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;