--
-- Table structure for table `malotes`
--
TABLE `malotes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(8,2) NOT NULL DEFAULT '0.00',
  `recebido` tinyint(1) NOT NULL DEFAULT '0',
  `data_recebimento` datetime DEFAULT NULL,
  `verificado` tinyint(1) NOT NULL DEFAULT '0',
  `data_verificacao` datetime DEFAULT NULL,
  `usuario_verificacao_id` int unsigned DEFAULT NULL,
  `codigo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `caixa_concessionaria` tinyint(1) NOT NULL DEFAULT '0',
  `concessionaria_id` int unsigned DEFAULT NULL,
  `usuario_logistica_id` int unsigned NOT NULL,
  `usuario_recebimento_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `malotes_usuario_logistica_id_foreign` (`usuario_logistica_id`),
  KEY `malotes_usuario_recebimento_id_foreign` (`usuario_recebimento_id`),
  KEY `malotes_concessionaria_id_foreign` (`concessionaria_id`),
  KEY `malotes_usuario_verificacao_id_foreign` (`usuario_verificacao_id`),
  CONSTRAINT `malotes_concessionaria_id_foreign` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `malotes_usuario_logistica_id_foreign` FOREIGN KEY (`usuario_logistica_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `malotes_usuario_recebimento_id_foreign` FOREIGN KEY (`usuario_recebimento_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `malotes_usuario_verificacao_id_foreign` FOREIGN KEY (`usuario_verificacao_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7951 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;