--
-- Table structure for table `carro_modelo_servico_portes`
--
TABLE `carro_modelo_servico_portes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carro_modelo_id` int unsigned NOT NULL,
  `servico_id` int unsigned NOT NULL,
  `carro_porte_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carroModId` (`carro_modelo_id`),
  KEY `carModServId` (`servico_id`),
  KEY `carModporteId` (`carro_porte_id`),
  CONSTRAINT `carModporteId` FOREIGN KEY (`carro_porte_id`) REFERENCES `carro_portes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `carModServId` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `carroModId` FOREIGN KEY (`carro_modelo_id`) REFERENCES `carro_modelos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5492 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;