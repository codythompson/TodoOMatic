CREATE  TABLE `list_o_matic`.`item` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `item_type_id` INT UNSIGNED NOT NULL ,
  `creator_user_id` INT UNSIGNED NOT NULL ,
  `item_name` VARCHAR(255) NOT NULL ,
  `item_descr` TEXT NULL ,
  `item_effective_date` DATETIME NOT NULL ,
  `item_status_id` INT UNSIGNED NOT NULL ,
  `item_order` INT NOT NULL ,
  `item_priority` INT NOT NULL DEFAULT 5 ,
  `item_amount_completed` INT NOT NULL DEFAULT 0 ,
  `item_amount_to_complete` INT NOT NULL DEFAULT 1 ,
  `item_qty` INT NULL ,
  PRIMARY KEY (`item_id`) ,
  INDEX `fk_item_type_idx` (`item_type_id` ASC) ,
  INDEX `fk_item_creator_id_idx` (`creator_user_id` ASC) ,
  INDEX `fk_item_status_id_idx` (`item_status_id` ASC) ,
  CONSTRAINT `fk_item_type`
    FOREIGN KEY (`item_type_id` )
    REFERENCES `list_o_matic`.`item_type` (`item_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_creator_id`
    FOREIGN KEY (`creator_user_id` )
    REFERENCES `list_o_matic`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_status_id`
    FOREIGN KEY (`item_status_id` )
    REFERENCES `list_o_matic`.`item_status` (`item_status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
