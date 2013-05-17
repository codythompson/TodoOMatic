CREATE  TABLE `listomatic`.`item` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `creator_user_id` INT UNSIGNED NOT NULL ,
  `item_type_id` INT UNSIGNED NOT NULL ,
  `item_effective_date` DATETIME NOT NULL ,
  `item_name` VARCHAR(255) NOT NULL ,
  `item_descr` MEDIUMTEXT NULL ,
  `item_due_date` DATETIME NULL ,
  `item_order` INT NOT NULL DEFAULT 1 ,
  `item_priority` INT NOT NULL DEFAULT 5 ,
  `item_amount_completed` INT NOT NULL DEFAULT 0 ,
  `item_total_to_complete` INT NOT NULL DEFAULT 1 ,
  `item_qty` INT NULL ,
  PRIMARY KEY (`item_id`) ,
  INDEX `fk_item_creator_id_idx` (`creator_user_id` ASC) ,
  INDEX `fk_item_type_id_idx` (`item_type_id` ASC) ,
  CONSTRAINT `fk_item_creator_id`
    FOREIGN KEY (`creator_user_id` )
    REFERENCES `listomatic`.`user` (`user_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_type_id`
    FOREIGN KEY (`item_type_id` )
    REFERENCES `listomatic`.`item_type` (`item_type_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
