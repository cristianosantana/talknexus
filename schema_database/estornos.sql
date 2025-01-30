--
-- Table structure for table `estornos`
--
TABLE `estornos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` int NOT NULL,
  `valor` decimal(8,2) unsigned DEFAULT NULL,
  `motivo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `pix_rtr_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `justificativa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `solicitado_por` int unsigned DEFAULT NULL,
  `atendido_por` int unsigned DEFAULT NULL,
  `os_id` int unsigned NOT NULL,
  `caixa_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estornos_solicitado_por_foreign` (`solicitado_por`),
  KEY `estornos_atendido_por_foreign` (`atendido_por`),
  KEY `estornos_os_id_foreign` (`os_id`),
  KEY `estornos_caixa_id_foreign` (`caixa_id`),
  CONSTRAINT `estornos_atendido_por_foreign` FOREIGN KEY (`atendido_por`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `estornos_caixa_id_foreign` FOREIGN KEY (`caixa_id`) REFERENCES `caixas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `estornos_os_id_foreign` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `estornos_solicitado_por_foreign` FOREIGN KEY (`solicitado_por`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2128 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;