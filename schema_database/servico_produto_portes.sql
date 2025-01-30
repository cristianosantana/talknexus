--
-- Table structure for table `servico_produto_portes`
--
TABLE `servico_produto_portes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `servico_produto_id` int unsigned NOT NULL,
  `carro_porte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_produto_portes_servico_produto_id_foreign` (`servico_produto_id`),
  KEY `servico_produto_portes_carro_porte_id_foreign` (`carro_porte_id`),
  CONSTRAINT `servico_produto_portes_carro_porte_id_foreign` FOREIGN KEY (`carro_porte_id`) REFERENCES `carro_portes` (`id`),
  CONSTRAINT `servico_produto_portes_servico_produto_id_foreign` FOREIGN KEY (`servico_produto_id`) REFERENCES `servico_produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;