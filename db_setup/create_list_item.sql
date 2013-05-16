CREATE  TABLE `list_o_matic`.`list_item` (
  `list_id` INT UNSIGNED NOT NULL ,
  `item_id` INT UNSIGNED NOT NULL ,
  INDEX `fk_list_item_to_list_idx` (`list_id` ASC) ,
  INDEX `fk_list_item_to_item_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_list_item_to_list`
    FOREIGN KEY (`list_id` )
    REFERENCES `list_o_matic`.`list` (`list_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_list_item_to_item`
    FOREIGN KEY (`item_id` )
    REFERENCES `list_o_matic`.`item` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
