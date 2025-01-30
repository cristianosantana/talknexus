--
-- Table structure for table `servico_produtos`
--
TABLE `servico_produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alternavel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `filtro_cor` tinyint(1) NOT NULL DEFAULT '0',
  `filtro_departamento` tinyint(1) NOT NULL DEFAULT '0',
  `servico_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_produtos_servico_id_foreign` (`servico_id`),
  KEY `servico_produtos_produto_id_foreign` (`produto_id`),
  KEY `servico_produtos_index` (`servico_id`,`produto_id`,`ativo`,`deleted_at`),
  KEY `produtos` (`ativo`,`deleted_at`),
  CONSTRAINT `servico_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `servico_produtos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;