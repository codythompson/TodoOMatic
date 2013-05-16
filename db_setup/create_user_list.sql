CREATE  TABLE `list_o_matic`.`user_list` (
  `user_id` INT UNSIGNED NOT NULL ,
  `list_id` INT UNSIGNED NOT NULL ,
  INDEX `fk_user_list_to_user_idx` (`user_id` ASC) ,
  INDEX `fk_user_list_to_list_idx` (`list_id` ASC) ,
  CONSTRAINT `fk_user_list_to_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `list_o_matic`.`user` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_list_to_list`
    FOREIGN KEY (`list_id` )
    REFERENCES `list_o_matic`.`list` (`list_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Bridge table for \'user\' and \'list\'.\nuser_id and list_id make up a composite primary key, but this is not reflected in the schema';
