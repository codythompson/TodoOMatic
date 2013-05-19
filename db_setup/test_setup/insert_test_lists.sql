insert into listomatic.list
(creator_user_id, list_name, list_item_type_id)
values
(1, "Amanda's Shopping List", 1);

insert into listomatic.user_list
values (
1,
(select list_id from listomatic.list
	where list_name = "Amanda's Shopping List"),
1
);

insert into listomatic.list
(creator_user_id, list_name, list_item_type_id)
values
(1, "Amanda's TODO List", 2);

insert into listomatic.user_list
values (
1,
(select list_id from listomatic.list
	where list_name = "Amanda's TODO List"),
1
);

-- bruce's test lists

insert into listomatic.list
(creator_user_id, list_name, list_item_type_id)
values
(2, "Bruce's Friends", 5);

insert into listomatic.user_list
values (
2,
(select list_id from listomatic.list
	where list_name = "Bruce's Friends"),
1
);

insert into listomatic.list
(creator_user_id, list_name, list_item_type_id)
values
(2, "Bruce's Work List", 3);

insert into listomatic.user_list
values (
2,
(select list_id from listomatic.list
	where list_name = "Bruce's Work List"),
1
);

-- Cody's test lists
insert into listomatic.list
(creator_user_id, list_name, list_item_type_id)
values
(3, "Work List", 4);

insert into listomatic.user_list
values (
3,
(select list_id from listomatic.list l
where l.list_name = "Work List"),
1
);
