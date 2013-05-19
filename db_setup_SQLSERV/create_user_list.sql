CREATE  TABLE user_list (
  user_id INT NOT NULL ,
  list_id INT NOT NULL ,
  list_status_id INT NOT NULL ,
  PRIMARY KEY (user_id, list_id),
  CONSTRAINT fk_user_list_to_user
    FOREIGN KEY (user_id )
    REFERENCES [user] (user_id ) ,
  CONSTRAINT fk_user_list_to_list
    FOREIGN KEY (list_id )
    REFERENCES list (list_id ) ,
  CONSTRAINT fk_list_status_id
    FOREIGN KEY (list_status_id )
    REFERENCES status (status_id )
);
