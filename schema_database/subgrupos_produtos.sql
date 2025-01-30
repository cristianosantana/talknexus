--
-- Table structure for table `subgrupos_produtos`
--
TABLE `subgrupos_produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `grupo_produto_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subgrupos_produtos_grupo_produto_id_foreign` (`grupo_produto_id`),
  CONSTRAINT `subgrupos_produtos_grupo_produto_id_foreign` FOREIGN KEY (`grupo_produto_id`) REFERENCES `grupos_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;