--
-- Table structure for table `venda_meta_historicos`
--
TABLE `venda_meta_historicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_meta_id` bigint unsigned NOT NULL,
  `funcionario_registro_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_meta_historicos_venda_meta_id_foreign` (`venda_meta_id`),
  KEY `venda_meta_historicos_funcionario_registro_id_foreign` (`funcionario_registro_id`),
  CONSTRAINT `venda_meta_historicos_funcionario_registro_id_foreign` FOREIGN KEY (`funcionario_registro_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `venda_meta_historicos_venda_meta_id_foreign` FOREIGN KEY (`venda_meta_id`) REFERENCES `venda_metas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1781 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;