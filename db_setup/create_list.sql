CREATE  TABLE `list_o_matic`.`list` (
  `list_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `creator_user_id` INT UNSIGNED NOT NULL ,
  `list_name` VARCHAR(255) NOT NULL ,
  `list_descr` MEDIUMTEXT NULL ,
  PRIMARY KEY (`list_id`) ,
  INDEX `fk_list_creator_user_id_idx` (`creator_user_id` ASC) ,
  CONSTRAINT `fk_list_creator_user_id`
    FOREIGN KEY (`creator_user_id` )
    REFERENCES `list_o_matic`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `list_o_matic`.`list` ADD COLUMN `list_item_type_id` INT UNSIGNED NOT NULL  AFTER `list_descr` , 
  ADD CONSTRAINT `fk_list_item_type_id`
  FOREIGN KEY (`list_item_type_id` )
  REFERENCES `list_o_matic`.`item_type` (`item_type_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_list_item_type_id_idx` (`list_item_type_id` ASC) ;

ALTER TABLE `list_o_matic`.`list` ADD COLUMN `list_status_id` INT UNSIGNED NOT NULL  AFTER `list_item_type_id` , 
  ADD CONSTRAINT `fk_list_status_id`
  FOREIGN KEY (`list_status_id` )
  REFERENCES `list_o_matic`.`item_status` (`item_status_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_list_status_id_idx` (`list_status_id` ASC) ;

ALTER TABLE `list_o_matic`.`list` DROP FOREIGN KEY `fk_list_status_id` ;
ALTER TABLE `list_o_matic`.`list` CHANGE COLUMN `list_status_id` `list_status_id` INT(10) UNSIGNED NOT NULL DEFAULT 0  , 
  ADD CONSTRAINT `fk_list_status_id`
  FOREIGN KEY (`list_status_id` )
  REFERENCES `list_o_matic`.`item_status` (`item_status_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `list_o_matic`.`list` DROP FOREIGN KEY `fk_list_status_id` ;
ALTER TABLE `list_o_matic`.`list` CHANGE COLUMN `list_status_id` `list_status_id` INT(10) UNSIGNED NOT NULL DEFAULT 1  , 
  ADD CONSTRAINT `fk_list_status_id`
  FOREIGN KEY (`list_status_id` )
  REFERENCES `list_o_matic`.`item_status` (`item_status_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
