--
-- Table structure for table `cargos`
--
TABLE `cargos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cbo` int unsigned DEFAULT NULL,
  `nome` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `salario_base` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `funcionario_tipo_id` int unsigned NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cargos_funcionario_tipo_id_foreign` (`funcionario_tipo_id`),
  CONSTRAINT `cargos_funcionario_tipo_id_foreign` FOREIGN KEY (`funcionario_tipo_id`) REFERENCES `funcionario_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;