--
-- Table structure for table `servico_produto_departamentos`
--
TABLE `servico_produto_departamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servico_produto_id` int unsigned NOT NULL,
  `departamento_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_produto_departamentos_servico_produto_id_foreign` (`servico_produto_id`),
  KEY `servico_produto_departamentos_departamento_id_foreign` (`departamento_id`),
  CONSTRAINT `servico_produto_departamentos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `servico_produto_departamentos_servico_produto_id_foreign` FOREIGN KEY (`servico_produto_id`) REFERENCES `servico_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10832 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;