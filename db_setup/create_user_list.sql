CREATE  TABLE `listomatic`.`user_list` (
  `user_id` INT UNSIGNED NOT NULL ,
  `list_id` INT UNSIGNED NOT NULL ,
  `list_status_id` INT UNSIGNED NOT NULL ,
  INDEX `fk_user_list_to_user_idx` (`user_id` ASC) ,
  INDEX `fk_user_list_to_list_idx` (`list_id` ASC) ,
  INDEX `fk_list_status_id_idx` (`list_status_id` ASC) ,
  CONSTRAINT `fk_user_list_to_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `listomatic`.`user` (`user_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_list_to_list`
    FOREIGN KEY (`list_id` )
    REFERENCES `listomatic`.`list` (`list_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_list_status_id`
    FOREIGN KEY (`list_status_id` )
    REFERENCES `listomatic`.`status` (`status_id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
