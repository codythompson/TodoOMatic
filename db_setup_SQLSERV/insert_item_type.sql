use listomatic;

insert into item_type
(item_type_name, item_type_descr)
values
('Plain',
'Just a simple list.');

insert into item_type
(item_type_name, item_type_descr)
values
('Shopping-List',
'A ''Shopping-List'' style list with checkboxes indicating whether or not an item was put in a cart, and an optional quantity field.');

insert into item_type
(item_type_name, item_type_descr)
values
('TO-DO Boolean',
'A simple TO-DO list with checkboxes indicating whether or not an item on your list has been completed.');

insert into item_type
(item_type_name, item_type_descr)
values
('TO-DO Percentage',
'A TO-DO list where TO-DO items can be 0% to 100% complete.');

insert into item_type
(item_type_name, item_type_descr)
values
('TO-DO Hours-Worked',
'A TO-DO list where for each task you specify how many hour a task will take to complete, and how many hours you have worked on the task.');
