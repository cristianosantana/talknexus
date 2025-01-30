--
-- Table structure for table `remessa_os`
--
TABLE `remessa_os` (
  `os_id` int unsigned NOT NULL,
  `remessa_id` int unsigned NOT NULL,
  `valor_pagamento` decimal(8,2) NOT NULL,
  `usuario_agendamento` int unsigned NOT NULL,
  `data_agendamento` datetime DEFAULT NULL,
  `pago` tinyint(1) NOT NULL DEFAULT '0',
  `codigo_deposito` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_pagamento` datetime DEFAULT NULL,
  `remessa_lote_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_os_os_id_foreign` (`os_id`),
  KEY `remessa_os_remessa_id_foreign` (`remessa_id`),
  KEY `remessa_os_remessa_lote_id_foreign` (`remessa_lote_id`),
  CONSTRAINT `remessa_os_os_id_foreign` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessa_os_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `remessa_os_remessa_lote_id_foreign` FOREIGN KEY (`remessa_lote_id`) REFERENCES `remessa_os_lotes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;