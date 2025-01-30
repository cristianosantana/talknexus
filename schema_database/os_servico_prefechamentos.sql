--
-- Table structure for table `os_servico_prefechamentos`
--
TABLE `os_servico_prefechamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `data_finalizacao` datetime DEFAULT NULL,
  `cancelado` tinyint(1) NOT NULL DEFAULT '0',
  `data_cancelamento` datetime DEFAULT NULL,
  `motivo_cancelamento` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `os_id` int unsigned NOT NULL,
  `os_servico_id` int unsigned NOT NULL,
  `produtivo_id` int unsigned NOT NULL,
  `usuario_registro_id` int unsigned NOT NULL,
  `usuario_finalizacao_id` int unsigned DEFAULT NULL,
  `usuario_cancelamento_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ospoi` (`os_id`),
  KEY `osposi` (`os_servico_id`),
  KEY `osppi` (`produtivo_id`),
  KEY `ospuri` (`usuario_registro_id`),
  KEY `ospufi` (`usuario_finalizacao_id`),
  KEY `ospuci` (`usuario_cancelamento_id`),
  CONSTRAINT `ospoi` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `osposi` FOREIGN KEY (`os_servico_id`) REFERENCES `os_servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `osppi` FOREIGN KEY (`produtivo_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ospuci` FOREIGN KEY (`usuario_cancelamento_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ospufi` FOREIGN KEY (`usuario_finalizacao_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ospuri` FOREIGN KEY (`usuario_registro_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=171314 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;