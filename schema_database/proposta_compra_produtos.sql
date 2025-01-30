--
-- Table structure for table `proposta_compra_produtos`
--
TABLE `proposta_compra_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quantidade` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `produto_tamanho_id` int unsigned NOT NULL,
  `tonalidade_id` int unsigned DEFAULT NULL,
  `proposta_compra_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proposta_compra_produtos_produto_id_foreign` (`produto_id`),
  KEY `proposta_compra_produtos_produto_tamanho_id_foreign` (`produto_tamanho_id`),
  KEY `proposta_compra_produtos_proposta_compra_id_foreign` (`proposta_compra_id`),
  KEY `proposta_compra_produtos_tonalidade_id_foreign` (`tonalidade_id`),
  CONSTRAINT `proposta_compra_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `proposta_compra_produtos_produto_tamanho_id_foreign` FOREIGN KEY (`produto_tamanho_id`) REFERENCES `produto_tamanhos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `proposta_compra_produtos_proposta_compra_id_foreign` FOREIGN KEY (`proposta_compra_id`) REFERENCES `propostas_compras` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `proposta_compra_produtos_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;