--
-- Table structure for table `ordens_compras`
--
TABLE `ordens_compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `proposta_compra_id` bigint unsigned DEFAULT NULL,
  `estoque_id` int unsigned NOT NULL,
  `fornecedor_id` int unsigned NOT NULL,
  `ordem_compra_status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ocei` (`estoque_id`),
  KEY `ocfi` (`fornecedor_id`),
  KEY `ococsi` (`ordem_compra_status_id`),
  CONSTRAINT `ocei` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ocfi` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ococsi` FOREIGN KEY (`ordem_compra_status_id`) REFERENCES `ordem_compra_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;