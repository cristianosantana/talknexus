--
-- Table structure for table `funcionario_estoques`
--
TABLE `funcionario_estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned NOT NULL,
  `estoque_id` int unsigned NOT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fefuncId` (`funcionario_id`),
  KEY `feestId` (`estoque_id`),
  CONSTRAINT `feestId` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fefuncId` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;