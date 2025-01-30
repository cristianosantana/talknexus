--
-- Table structure for table `ordem_compra_produtos`
--
TABLE `ordem_compra_produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quantidade` int unsigned NOT NULL,
  `quantidade_antecipacao` int NOT NULL DEFAULT '0',
  `quantidade_antecipada` int NOT NULL DEFAULT '0',
  `quantidade_pendente` int GENERATED ALWAYS AS (((`quantidade` - `quantidade_antecipacao`) - `quantidade_antecipada`)) VIRTUAL,
  `valor_unitario` decimal(8,2) unsigned NOT NULL,
  `editado_entrega` tinyint(1) NOT NULL DEFAULT '0',
  `produto_id` int unsigned NOT NULL,
  `produto_tamanho_id` int unsigned NOT NULL,
  `tonalidade_id` int unsigned DEFAULT NULL,
  `carro_modelo_id` int unsigned DEFAULT NULL,
  `ordem_compra_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ocppi` (`produto_id`),
  KEY `ocppti` (`produto_tamanho_id`),
  KEY `ocpoci` (`ordem_compra_id`),
  KEY `ordem_compra_produtos_tonalidade_id_foreign` (`tonalidade_id`),
  KEY `ordem_compra_produtos_carro_modelo_id_foreign` (`carro_modelo_id`),
  CONSTRAINT `ocpoci` FOREIGN KEY (`ordem_compra_id`) REFERENCES `ordens_compras` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ocppi` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ocppti` FOREIGN KEY (`produto_tamanho_id`) REFERENCES `produto_tamanhos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordem_compra_produtos_carro_modelo_id_foreign` FOREIGN KEY (`carro_modelo_id`) REFERENCES `carro_modelos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordem_compra_produtos_tonalidade_id_foreign` FOREIGN KEY (`tonalidade_id`) REFERENCES `tonalidades` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3695 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;