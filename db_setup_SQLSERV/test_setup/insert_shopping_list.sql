declare @li int = 2;
declare @iid int;
declare @userId int = 1;
declare @type int = 2;
declare @name varchar(255) = 'Onions';
declare @duedate datetime = GETDATE();
declare @order int = 1;
declare @toComp int = 1;
declare @qty int = 4;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);

set @name = 'Nanners';
set @order = @order + 1;
set @qty = 3;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);

set @name = 'Whimsical Adjectives';
set @order = @order + 1;
set @qty = null;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);

set @name = 'the infamous Something Else';
set @order = @order + 1;
set @qty = 1;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);
