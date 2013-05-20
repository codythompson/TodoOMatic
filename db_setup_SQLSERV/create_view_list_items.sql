create view view_list_items as

select 
li.list_id,
li.item_id,
i.item_name,
i.item_descr,
i.creator_user_id,
u.user_first_name,
u.user_last_name,
i.item_type_id,
it.item_type_name,
it.item_type_descr,
li.item_status_id,
s.status_name,
s.status_descr,
i.item_effective_date,
i.item_due_date,
i.item_order,
i.item_priority,
i.item_amount_completed,
i.item_total_to_complete,
i.item_qty
from list_item li
left join item i
	on li.item_id = i.item_id
left join [user] u
	on i.creator_user_id = u.user_id
left join item_type it
	on i.item_type_id = it.item_type_id
left join status s
	on li.item_status_id = s.status_id;
