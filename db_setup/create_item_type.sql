CREATE  TABLE `listomatic`.`item_type` (
  `item_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `item_type_name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`item_type_id`) );

ALTER TABLE `listomatic`.`item_type` ADD COLUMN `item_type_descr` MEDIUMTEXT NOT NULL  AFTER `item_type_name` ;
