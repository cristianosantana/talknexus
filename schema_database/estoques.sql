--
-- Table structure for table `estoques`
--
TABLE `estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `entrada_produto` tinyint(1) NOT NULL DEFAULT '0',
  `business_unit_id` bigint unsigned NOT NULL DEFAULT '1',
  `estoque_tipo_id` bigint unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `esbui` (`business_unit_id`),
  KEY `esteti` (`estoque_tipo_id`),
  CONSTRAINT `esbui` FOREIGN KEY (`business_unit_id`) REFERENCES `business_units` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esteti` FOREIGN KEY (`estoque_tipo_id`) REFERENCES `estoque_tipos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;