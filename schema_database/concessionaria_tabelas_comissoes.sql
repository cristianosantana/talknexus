--
-- Table structure for table `concessionaria_tabelas_comissoes`
--
TABLE `concessionaria_tabelas_comissoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `tabela_comissao_tipo_id` int unsigned NOT NULL,
  `tabela_comissao_id` int unsigned NOT NULL,
  `departamento_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `concessionaria_id` (`concessionaria_id`),
  KEY `tabela_comissao_tipo_id` (`tabela_comissao_tipo_id`),
  KEY `tabela_comissao_id` (`tabela_comissao_id`),
  KEY `concessionaria_tabelas_comissoes_departamento_id_foreign` (`departamento_id`),
  KEY `deleted_at` (`deleted_at`),
  KEY `ctcctc` (`concessionaria_id`,`tabela_comissao_id`,`deleted_at`),
  CONSTRAINT `concessionaria_id` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `concessionaria_tabelas_comissoes_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_comissao_id` FOREIGN KEY (`tabela_comissao_id`) REFERENCES `tabelas_comissoes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tabela_comissao_tipo_id` FOREIGN KEY (`tabela_comissao_tipo_id`) REFERENCES `tabela_comissao_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;