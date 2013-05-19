CREATE  TABLE list_item (
  list_id INT NOT NULL ,
  item_id INT NOT NULL ,
  item_status_id INT NOT NULL ,
  PRIMARY KEY (list_id, item_id),
  CONSTRAINT fk_list_item_to_list
    FOREIGN KEY (list_id )
    REFERENCES list (list_id ) ,
  CONSTRAINT fk_list_item_to_item
    FOREIGN KEY (item_id )
    REFERENCES item (item_id ) ,
  CONSTRAINT fk_item_status_id
    FOREIGN KEY (item_status_id )
    REFERENCES status (status_id ) );
