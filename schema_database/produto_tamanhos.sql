--
-- Table structure for table `produto_tamanhos`
--
TABLE `produto_tamanhos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantidade` decimal(8,2) DEFAULT '1.00',
  `estoque_minimo` int unsigned NOT NULL DEFAULT '0',
  `estoque_maximo` int unsigned NOT NULL DEFAULT '0',
  `produto_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_tamanhos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_tamanhos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;