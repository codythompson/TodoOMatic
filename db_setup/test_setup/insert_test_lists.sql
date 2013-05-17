insert into list_o_matic.list
(creator_user_id, list_name, list_item_type_id)
values
(1, "Amanda's Shopping List", 1);

insert into list_o_matic.user_list
values (
1,
(select list_id from list_o_matic.list
	where list_name = "Amanda's Shopping List")
);

insert into list_o_matic.list
(creator_user_id, list_name, list_item_type_id)
values
(1, "Amanda's TODO List", 2);

insert into list_o_matic.user_list
values (
1,
(select list_id from list_o_matic.list
	where list_name = "Amanda's TODO List")
);

-- bruce's test lists

insert into list_o_matic.list
(creator_user_id, list_name, list_item_type_id)
values
(2, "Bruce's Friends", 5);

insert into list_o_matic.user_list
values (
2,
(select list_id from list_o_matic.list
	where list_name = "Bruce's Friends")
);

insert into list_o_matic.list
(creator_user_id, list_name, list_item_type_id)
values
(2, "Bruce's Work List", 3);

insert into list_o_matic.user_list
values (
2,
(select list_id from list_o_matic.list
	where list_name = "Bruce's Work List")
);

-- Cody's test lists
insert into list_o_matic.list
(creator_user_id, list_name, list_item_type_id)
values
(3, "Work List", 4);

insert into list_o_matic.user_list
values (
3,
(select list_id from list_o_matic.list l
where l.list_name = "Work List")
);
