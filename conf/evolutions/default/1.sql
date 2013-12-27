# Users and other schemas for SecureSocial

# --- !Ups

CREATE TABLE `user`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255),
    `create_date` DATETIME NOT NULL,
    UNIQUE KEY `email_uk` (`email`)
);

CREATE TABLE `user_login` (
    `provider_id` VARCHAR(255) NOT NULL,
    `provider` VARCHAR(100) NOT NULL,
    `user_id` INT NOT NULL,
    `first_name` VARCHAR(255),
    `last_name` VARCHAR(255),
    `email` VARCHAR(255),
    `password` VARCHAR(255),
    PRIMARY KEY (`provider_id`, `provider`),
    CONSTRAINT `user_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE `session` (
    `secret` VARCHAR(32) NOT NULL PRIMARY KEY,
    `user_id` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    `expire_date` DATETIME NOT NULL,
    CONSTRAINT `session_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE `token`(
    `token` VARCHAR(32) NOT NULL PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `is_sign_up`  TINYINT NOT NULL,
    `create_date` DATETIME NOT NULL,
    `expire_date` DATETIME NOT NULL
);


# --- !Downs

DROP TABLE `token`;
DROP TABLE `session`;
DROP TABLE `user_login`;
DROP TABLE `user`;


