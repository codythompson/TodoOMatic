CREATE  TABLE list (
  list_id INT NOT NULL PRIMARY KEY IDENTITY ,
  creator_user_id INT NOT NULL ,
  list_item_type_id INT NOT NULL ,
  list_name VARCHAR(255) NOT NULL ,
  list_descr NVARCHAR(1000) NULL ,
  CONSTRAINT fk_list_creator_id FOREIGN KEY (creator_user_id) REFERENCES [user](user_id) ,
  CONSTRAINT fk_list_item_type_id FOREIGN KEY (list_item_type_id) REFERENCES item_type(item_type_id)
);
