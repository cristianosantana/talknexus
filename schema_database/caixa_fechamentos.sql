--
-- Table structure for table `caixa_fechamentos`
--
TABLE `caixa_fechamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `controle_concessionaria` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL DEFAULT '0.00',
  `caixa_concessionaria` tinyint(1) NOT NULL DEFAULT '0',
  `concessionaria_id` int unsigned NOT NULL,
  `vendedor_id` int unsigned NOT NULL,
  `malote_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `caixa_fechamentos_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `caixa_fechamentos_vendedor_id_foreign` (`vendedor_id`),
  KEY `caixa_fechamentos_malote_id_foreign` (`malote_id`),
  CONSTRAINT `caixa_fechamentos_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `caixa_fechamentos_malote_id_foreign` FOREIGN KEY (`malote_id`) REFERENCES `malotes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `caixa_fechamentos_vendedor_id_foreign` FOREIGN KEY (`vendedor_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6441 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;