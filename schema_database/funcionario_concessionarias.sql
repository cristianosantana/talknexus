--
-- Table structure for table `funcionario_concessionarias`
--
TABLE `funcionario_concessionarias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned NOT NULL,
  `concessionaria_id` int unsigned NOT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcId` (`funcionario_id`),
  KEY `concId` (`concessionaria_id`),
  CONSTRAINT `concId` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `funcId` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;