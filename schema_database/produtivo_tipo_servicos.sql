--
-- Table structure for table `produtivo_tipo_servicos`
--
TABLE `produtivo_tipo_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produtivo_tipo_id` int unsigned NOT NULL,
  `servico_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prodTipoId` (`produtivo_tipo_id`),
  KEY `servId` (`servico_id`),
  KEY `ptssa` (`servico_id`,`ativo`,`deleted_at`),
  CONSTRAINT `prodTipoId` FOREIGN KEY (`produtivo_tipo_id`) REFERENCES `produtivo_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `servId` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;