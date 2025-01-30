--
-- Table structure for table `os_servico_prefechamento_produtos`
--
TABLE `os_servico_prefechamento_produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `os_servico_prefechamento_id` int unsigned NOT NULL,
  `estoque_entrada_produto_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osppospi` (`os_servico_prefechamento_id`),
  KEY `osppeepi` (`estoque_entrada_produto_id`),
  CONSTRAINT `osppeepi` FOREIGN KEY (`estoque_entrada_produto_id`) REFERENCES `estoque_entrada_produtos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `osppospi` FOREIGN KEY (`os_servico_prefechamento_id`) REFERENCES `os_servico_prefechamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=116742 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;