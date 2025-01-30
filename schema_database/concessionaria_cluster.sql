--
-- Table structure for table `concessionaria_cluster`
--
TABLE `concessionaria_cluster` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `concessionaria_id` int unsigned NOT NULL,
  `cluster_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cc_concessionaria_id` (`concessionaria_id`),
  KEY `cc_cluster_id` (`cluster_id`),
  CONSTRAINT `cc_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cc_concessionaria_id` FOREIGN KEY (`concessionaria_id`) REFERENCES `concessionarias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;