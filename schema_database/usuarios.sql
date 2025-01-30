--
-- Table structure for table `usuarios`
--
TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `mc_user_id` int unsigned DEFAULT NULL,
  `grupo_usuario_id` int unsigned NOT NULL,
  `bloqueio_justificativa` int unsigned NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `bloqueio` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_login_unique` (`login`),
  KEY `usuarios_funcionario_id_foreign` (`funcionario_id`),
  KEY `usuarios_grupo_usuario_id_foreign` (`grupo_usuario_id`),
  CONSTRAINT `usuarios_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `usuarios_grupo_usuario_id_foreign` FOREIGN KEY (`grupo_usuario_id`) REFERENCES `grupos_usuarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;