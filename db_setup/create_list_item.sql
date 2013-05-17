CREATE  TABLE `listomatic`.`list_item` (
  `list_id` INT UNSIGNED NOT NULL ,
  `item_id` INT UNSIGNED NOT NULL ,
  `item_status_id` INT UNSIGNED NOT NULL ,
  INDEX `fk_list_item_to_list_idx` (`list_id` ASC) ,
  INDEX `fk_list_item_to_item_idx` (`item_id` ASC) ,
  INDEX `fk_item_status_id_idx` (`item_status_id` ASC) ,
  CONSTRAINT `fk_list_item_to_list`
    FOREIGN KEY (`list_id` )
    REFERENCES `listomatic`.`list` (`list_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_list_item_to_item`
    FOREIGN KEY (`item_id` )
    REFERENCES `listomatic`.`item` (`item_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_status_id`
    FOREIGN KEY (`item_status_id` )
    REFERENCES `listomatic`.`status` (`status_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
