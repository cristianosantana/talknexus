--
-- Table structure for table `plotter_bobinas`
--
TABLE `plotter_bobinas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `metros` double(30,2) NOT NULL,
  `recuperacao` tinyint(1) NOT NULL DEFAULT '0',
  `finalizada` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `cancelada` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `solicitado_cancelamento` tinyint(1) NOT NULL DEFAULT '0',
  `estoque_entrada_produto_id` int unsigned NOT NULL,
  `estoque_saida_produto_id` int unsigned DEFAULT NULL,
  `estoque_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plotter_bobinas_estoque_entrada_produto_id_foreign` (`estoque_entrada_produto_id`),
  KEY `pbei` (`estoque_id`),
  CONSTRAINT `pbei` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plotter_bobinas_estoque_entrada_produto_id_foreign` FOREIGN KEY (`estoque_entrada_produto_id`) REFERENCES `estoque_entrada_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7081 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;