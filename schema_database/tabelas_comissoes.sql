--
-- Table structure for table `tabelas_comissoes`
--
TABLE `tabelas_comissoes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tabela_comissao_tipo_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tabelas_comissoes_tabela_comissao_tipo_id_foreign` (`tabela_comissao_tipo_id`),
  CONSTRAINT `tabelas_comissoes_tabela_comissao_tipo_id_foreign` FOREIGN KEY (`tabela_comissao_tipo_id`) REFERENCES `tabela_comissao_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;