--
-- Table structure for table `financeiro_malotes_classificacao`
--
TABLE `financeiro_malotes_classificacao` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(8,2) NOT NULL DEFAULT '0.00',
  `auditado` tinyint(1) NOT NULL DEFAULT '1',
  `data_auditoria` datetime DEFAULT NULL,
  `classificado` tinyint(1) NOT NULL DEFAULT '0',
  `data_classificacao` datetime DEFAULT NULL,
  `caixa_preto` tinyint(1) NOT NULL DEFAULT '0',
  `usuario_auditoria_id` int unsigned NOT NULL,
  `usuario_classificacao_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fmcuaid` (`usuario_auditoria_id`),
  KEY `fmcucid` (`usuario_classificacao_id`),
  CONSTRAINT `fmcuaid` FOREIGN KEY (`usuario_auditoria_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fmcucid` FOREIGN KEY (`usuario_classificacao_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
