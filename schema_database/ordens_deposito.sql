--
-- Table structure for table `ordens_deposito`
--
TABLE `ordens_deposito` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(8,2) NOT NULL DEFAULT '0.00',
  `saida` tinyint(1) NOT NULL DEFAULT '1',
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `justificativa_cancelamento` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `usuario_cadastro_id` int unsigned NOT NULL,
  `usuario_cancelamento_id` int unsigned DEFAULT NULL,
  `factory_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordens_deposito_usuario_cadastro_id_foreign` (`usuario_cadastro_id`),
  KEY `ordens_deposito_usuario_cancelamento_id_foreign` (`usuario_cancelamento_id`),
  KEY `ordens_deposito_factory_id_foreign` (`factory_id`),
  CONSTRAINT `ordens_deposito_factory_id_foreign` FOREIGN KEY (`factory_id`) REFERENCES `factories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordens_deposito_usuario_cadastro_id_foreign` FOREIGN KEY (`usuario_cadastro_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordens_deposito_usuario_cancelamento_id_foreign` FOREIGN KEY (`usuario_cancelamento_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;