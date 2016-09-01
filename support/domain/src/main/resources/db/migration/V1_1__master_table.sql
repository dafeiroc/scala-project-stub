DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `aid` SERIAL COMMENT 'alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE',
  `email` VARCHAR(255) NOT NULL,
  `password` CHAR(60) BINARY NOT NULL,
  `login_failure_count` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0,
  `login_locked_at` TIMESTAMP,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'DATETIME range is wider than TIMESTAMP',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test` BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (`aid`),
  UNIQUE (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` SERIAL,
  `aid` BIGINT UNSIGNED DEFAULT NULL COMMENT 'has to be nullable in order to guarantee referential integrity.',
  `email` VARCHAR(255) NOT NULL,
  `account_name` VARCHAR(64),
  `first_name` VARCHAR(64) NOT NULL,
  `last_name` VARCHAR(64) NOT NULL,
  `profile_image` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(64) NOT NULL,
  `address1` VARCHAR(255),
  `address2` VARCHAR(255),
  `address3` VARCHAR(255),
  `address4` VARCHAR(255),
  `postal_code` VARCHAR(32),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test` BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (`uid`),
  UNIQUE (`email`),
  CONSTRAINT `user_aid_fk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `qid` SERIAL,
  `content` VARCHAR(3000),
  `like` BIGINT UNSIGNED DEFAULT 0 COMMENT 'range is [0, 18446744073709551615]',
  `listen` BIGINT UNSIGNED DEFAULT 0,
  `uid` BIGINT UNSIGNED NOT NULL COMMENT '1. when joining user table, using(uid) 2.Specifying RESTRICT (or NO ACTION) is the same as omitting the ON DELETE or ON UPDATE clause',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test` BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (`qid`),
  CONSTRAINT `question_uid_fk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
    ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `pro`;
CREATE TABLE `pro` (
  `proid` SERIAL,
  `aid` BIGINT UNSIGNED DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `account_name` VARCHAR(64),
  `first_name` VARCHAR(64) NOT NULL,
  `last_name` VARCHAR(64) NOT NULL,
  `profile_image` VARCHAR(255),
  `phone` VARCHAR(64) NOT NULL,
  `address1` VARCHAR(255),
  `address2` VARCHAR(255),
  `address3` VARCHAR(255),
  `address4` VARCHAR(255),
  `postal_code` VARCHAR(32),
  `short_introduction` VARCHAR(255) NOT NULL,
  `long_introduction` VARCHAR(255) NOT NULL,
  `answer_count` BIGINT UNSIGNED DEFAULT 0,
  `follower_count` BIGINT UNSIGNED DEFAULT 0,
  `price` DECIMAL(12, 2) NOT NULL COMMENT 'how much is the cost when asking the pro',
  `currency` CHAR(3) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test` BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (`proid`),
  UNIQUE (`email`),
  CONSTRAINT `pro_aid_fk_1` FOREIGN KEY (`aid`) REFERENCES `account` (`aid`)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `r_question_pro`;
CREATE TABLE `r_question_pro` (
  `qid` BIGINT UNSIGNED NOT NULL,
  `proid` BIGINT UNSIGNED NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`qid`, `proid`),
  CONSTRAINT `r_question_pro_qid_fk_1` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT `r_question_pro_proid_fk_2` FOREIGN KEY (`proid`) REFERENCES `pro` (`proid`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

