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
