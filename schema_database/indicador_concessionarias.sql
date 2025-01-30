--
-- Table structure for table `indicador_concessionarias`
--
TABLE `indicador_concessionarias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `indicador_id` int unsigned NOT NULL,
  `concessionaria_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indFuncId` (`indicador_id`),
  KEY `indConcId` (`concessionaria_id`),
  CONSTRAINT `indConcId` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `indFuncId` FOREIGN KEY (`indicador_id`) REFERENCES `indicadores` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5245 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;