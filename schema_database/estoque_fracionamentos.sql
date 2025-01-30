--
-- Table structure for table `estoque_fracionamentos`
--
TABLE `estoque_fracionamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tamanho` double(8,2) unsigned NOT NULL,
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `estoque_saida_produto_id` int unsigned NOT NULL,
  `estoque_entrada_produto_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `estoque_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estoque_fracionamentos_estoque_entrada_produto_id_foreign` (`estoque_entrada_produto_id`),
  KEY `estoque_fracionamentos_produto_id_foreign` (`produto_id`),
  KEY `estoque_fracionamentos_estoque_id_foreign` (`estoque_id`),
  CONSTRAINT `estoque_fracionamentos_estoque_entrada_produto_id_foreign` FOREIGN KEY (`estoque_entrada_produto_id`) REFERENCES `estoque_entrada_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `estoque_fracionamentos_estoque_id_foreign` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `estoque_fracionamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;