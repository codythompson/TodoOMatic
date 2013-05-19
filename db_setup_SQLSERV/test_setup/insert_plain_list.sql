declare @li int = 1;
declare @iid int;
declare @userId int = 1;
declare @type int = 1;
declare @name varchar(255) = 'Onions';
declare @duedate datetime = GETDATE();
declare @order int = 1;
declare @toComp int = 1;
declare @qty int = null;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);

set @name = 'Bill';
set @order = @order + 1;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);

set @name = 'Whimsical Adjectives';
set @order = @order + 1;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);

set @name = 'the infamous Something Else';
set @order = @order + 1;

insert into item
values
(@userId, @type, GETDATE(), @name, null, @duedate, @order, 5, 0, @toComp, @qty);
set @iid = (select SCOPE_IDENTITY());
insert into list_item
values (@li, @iid, 1);
