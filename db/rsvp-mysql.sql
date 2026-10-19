-- MySQL migration for RSVP (compatible with MySQL and MariaDB)
-- Path: db/rsvp-mysql.sql

CREATE TABLE IF NOT EXISTS rsvps (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  status ENUM('Hadir','Tidak Hadir') NOT NULL DEFAULT 'Hadir',
  message TEXT,
  guest_count TINYINT UNSIGNED DEFAULT 1,
  ip_address VARCHAR(45),
  user_agent VARCHAR(1024),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE INDEX idx_rsvps_status ON rsvps (status);
CREATE INDEX idx_rsvps_created_at ON rsvps (created_at);
