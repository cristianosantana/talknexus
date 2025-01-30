--
-- Table structure for table `fornecedor_produtos`
--
TABLE `fornecedor_produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor_unitario` decimal(10,4) NOT NULL,
  `valor_icms` decimal(10,4) NOT NULL,
  `aliquota_ipi` decimal(4,2) DEFAULT NULL,
  `fornecedor_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor_produtos_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `fornecedor_produtos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `fornecedor_produtos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fornecedor_produtos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;