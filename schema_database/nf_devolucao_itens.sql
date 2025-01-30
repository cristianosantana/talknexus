--
-- Table structure for table `nf_devolucao_itens`
--
TABLE `nf_devolucao_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `motivo_devolucao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `codigo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(8,4) NOT NULL,
  `medida` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_unitario` decimal(8,4) unsigned NOT NULL,
  `ncm` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_ipi` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `aliquota_ipi` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_icms` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `aliquota_icms` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `base_calculo_icms` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_icms_st` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_total` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000',
  `valor_frete` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `valor_seguro` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `porcentagem_devolucao` int unsigned NOT NULL DEFAULT '100',
  `origem` enum('NACIONAL','IMPORTADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NACIONAL',
  `nota_fiscal_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nf_devolucao_itens_nota_fiscal_id_foreign` (`nota_fiscal_id`),
  CONSTRAINT `nf_devolucao_itens_nota_fiscal_id_foreign` FOREIGN KEY (`nota_fiscal_id`) REFERENCES `notas_fiscais` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;