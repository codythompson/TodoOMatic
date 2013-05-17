CREATE  TABLE `listomatic`.`status` (
  `status_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `status_name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`status_id`) );

ALTER TABLE `listomatic`.`status` ADD COLUMN `status_descr` MEDIUMTEXT NOT NULL  AFTER `status_name` ;
