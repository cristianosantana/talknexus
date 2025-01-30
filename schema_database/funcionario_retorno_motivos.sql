--
-- Table structure for table `funcionario_retorno_motivos`
--
TABLE `funcionario_retorno_motivos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned NOT NULL,
  `retorno_motivo_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frcfi` (`funcionario_id`),
  KEY `frcrci` (`retorno_motivo_id`),
  CONSTRAINT `frcfi` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `frcrci` FOREIGN KEY (`retorno_motivo_id`) REFERENCES `retorno_motivos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;