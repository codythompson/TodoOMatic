CREATE  TABLE item (
  item_id INT NOT NULL PRIMARY KEY IDENTITY ,
  creator_user_id INT NOT NULL ,
  item_type_id INT NOT NULL ,
  item_effective_date DATETIME NOT NULL ,
  item_name VARCHAR(255) NOT NULL ,
  item_descr NVARCHAR(1000) NULL ,
  item_due_date DATETIME NULL ,
  item_order INT NOT NULL DEFAULT 1 ,
  item_priority INT NOT NULL DEFAULT 5 ,
  item_amount_completed INT NOT NULL DEFAULT 0 ,
  item_total_to_complete INT NOT NULL DEFAULT 1 ,
  item_qty INT NULL ,
  CONSTRAINT fk_item_creator_id
    FOREIGN KEY (creator_user_id )
    REFERENCES [user] (user_id ) ,
  CONSTRAINT fk_item_type_id
    FOREIGN KEY (item_type_id )
    REFERENCES item_type (item_type_id ) );
