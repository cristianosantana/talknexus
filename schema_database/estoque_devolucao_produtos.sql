--
-- Table structure for table `estoque_devolucao_produtos`
--
TABLE `estoque_devolucao_produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `estoque_devolucao_id` int unsigned NOT NULL,
  `estoque_entrada_produto_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estoque_devolucao_produtos_estoque_devolucao_id_foreign` (`estoque_devolucao_id`),
  KEY `estoque_devolucao_produtos_estoque_entrada_produto_id_foreign` (`estoque_entrada_produto_id`),
  CONSTRAINT `estoque_devolucao_produtos_estoque_devolucao_id_foreign` FOREIGN KEY (`estoque_devolucao_id`) REFERENCES `estoque_devolucoes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `estoque_devolucao_produtos_estoque_entrada_produto_id_foreign` FOREIGN KEY (`estoque_entrada_produto_id`) REFERENCES `estoque_entrada_produtos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;