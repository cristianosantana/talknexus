--
-- Table structure for table `produtos`
--
TABLE `produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `envio_maximo` int NOT NULL DEFAULT '1',
  `fracionavel` tinyint(1) NOT NULL DEFAULT '0',
  `fracao_rastreavel` tinyint(1) NOT NULL DEFAULT '0',
  `rastreavel` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_servico` tinyint(1) NOT NULL DEFAULT '0',
  `diferencia_tonalidade` tinyint(1) NOT NULL DEFAULT '0',
  `diferencia_modelo` tinyint(1) NOT NULL DEFAULT '0',
  `diferencia_tamanho` tinyint(1) NOT NULL DEFAULT '0',
  `medida_id` int unsigned NOT NULL,
  `grupo_produto_id` int unsigned NOT NULL,
  `subgrupo_produto_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_medida_id_foreign` (`medida_id`),
  KEY `produtos_grupo_produto_id_foreign` (`grupo_produto_id`),
  KEY `produtos_subgrupo_produto_id_foreign` (`subgrupo_produto_id`),
  KEY `produtos` (`ativo`,`deleted_at`),
  KEY `produtos_ativos_index` (`ativo`,`deleted_at`),
  CONSTRAINT `produtos_grupo_produto_id_foreign` FOREIGN KEY (`grupo_produto_id`) REFERENCES `grupos_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `produtos_medida_id_foreign` FOREIGN KEY (`medida_id`) REFERENCES `medidas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `produtos_subgrupo_produto_id_foreign` FOREIGN KEY (`subgrupo_produto_id`) REFERENCES `subgrupos_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;