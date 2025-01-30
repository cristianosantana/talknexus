--
-- Table structure for table `concessionaria_tabelas_precos`
--
TABLE `concessionaria_tabelas_precos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `os_tipo_id` int unsigned NOT NULL,
  `tabela_preco_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctp_concessionaria_id` (`concessionaria_id`),
  KEY `ctp_os_tipo_id` (`os_tipo_id`),
  KEY `ctp_tabela_preco_id` (`tabela_preco_id`),
  CONSTRAINT `ctp_concessionaria_id` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ctp_os_tipo_id` FOREIGN KEY (`os_tipo_id`) REFERENCES `os_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ctp_tabela_preco_id` FOREIGN KEY (`tabela_preco_id`) REFERENCES `tabelas_precos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=734 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;