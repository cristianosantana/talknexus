--
-- Table structure for table `comissao_pagamentos`
--
TABLE `comissao_pagamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned NOT NULL,
  `comissao_tipo_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cpfuncId` (`funcionario_id`),
  KEY `cpcti` (`comissao_tipo_id`),
  CONSTRAINT `cpcti` FOREIGN KEY (`comissao_tipo_id`) REFERENCES `comissao_tipos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cpfuncId` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;