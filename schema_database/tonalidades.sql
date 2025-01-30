--
-- Table structure for table `tonalidades`
--
TABLE `tonalidades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tonalidades_deleted_at` (`deleted_at`),
  KEY `produtos` (`ativo`,`deleted_at`),
  KEY `tonalidades_ativas_index` (`ativo`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;