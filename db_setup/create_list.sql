CREATE  TABLE `listomatic`.`list` (
  `list_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `creator_user_id` INT UNSIGNED NOT NULL ,
  `list_name` VARCHAR(255) NOT NULL ,
  `list_descr` MEDIUMTEXT NULL ,
  `list_item_type_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`list_id`) ,
  INDEX `fk_list_creator_id_idx` (`creator_user_id` ASC) ,
  INDEX `fk_list_item_type_id_idx` (`list_item_type_id` ASC) ,
  CONSTRAINT `fk_list_creator_id`
    FOREIGN KEY (`creator_user_id` )
    REFERENCES `listomatic`.`user` (`user_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_list_item_type_id`
    FOREIGN KEY (`list_item_type_id` )
    REFERENCES `listomatic`.`item_type` (`item_type_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
