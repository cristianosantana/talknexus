--
-- Table structure for table `cortesia_os`
--
TABLE `cortesia_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `os_id` int unsigned NOT NULL,
  `cortesia_id` int unsigned NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cortesia_os_os_id_foreign` (`os_id`),
  KEY `cortesia_os_cortesia_id_foreign` (`cortesia_id`),
  CONSTRAINT `cortesia_os_cortesia_id_foreign` FOREIGN KEY (`cortesia_id`) REFERENCES `cortesias` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cortesia_os_os_id_foreign` FOREIGN KEY (`os_id`) REFERENCES `os` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=42991 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;