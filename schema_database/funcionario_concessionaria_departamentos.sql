--
-- Table structure for table `funcionario_concessionaria_departamentos`
--
TABLE `funcionario_concessionaria_departamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_concessionaria_id` int unsigned NOT NULL,
  `departamento_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcConc_id` (`funcionario_concessionaria_id`),
  KEY `depId` (`departamento_id`),
  CONSTRAINT `depId` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `funcConc_id` FOREIGN KEY (`funcionario_concessionaria_id`) REFERENCES `funcionario_concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7069 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;