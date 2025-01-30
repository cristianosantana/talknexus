--
-- Table structure for table `indicador_concessionaria_departamentos`
--
TABLE `indicador_concessionaria_departamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `indicador_concessionaria_id` int unsigned NOT NULL,
  `departamento_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indConc_id` (`indicador_concessionaria_id`),
  KEY `indDepId` (`departamento_id`),
  CONSTRAINT `indConc_id` FOREIGN KEY (`indicador_concessionaria_id`) REFERENCES `indicador_concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `indDepId` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10703 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;