create view view_user_lists as

select
ul.user_id,
l.*,
ul.list_status_id,
s.status_name,
s.status_descr,
it.item_type_name,
it.item_type_descr
from user_list ul
inner join list l
	on ul.list_id = l.list_id
inner join status s
	on ul.list_status_id = s.status_id
inner join item_type it
	on l.list_item_type_id = it.item_type_id
