use AssemblePc
go

alter trigger t1
on RAM
for update,delete,insert
as
if exists
(select 'true'
from inserted I, deleted D
where I.[V] > D.V or I.V > 8)
begin
Raiserror('нельзя исправить объем памяти', 16 , 1)
Rollback tran
end
go

alter trigger t2
on RAM
after insert
as
begin
set nocount on
print('запись добавлена!!!!')
end

insert into RAM(Producer,[Type],V) VALUES('Samsung','DDR3',6)
go

alter trigger t3
on RAM
for delete
as
if(select COUNT(*) from deleted)>1
begin
print('НЕльзя удалить больше 1 строк!!!!')
rollback tran
end

delete from RAM where V='6'
go

alter trigger t4
on PB
for update
as
if exists
(select 'true'
from inserted I, deleted D
where I.Producer=D.Producer and I.KPD < D.KPD)
begin
Raiserror('Нельзя вводить объем меньше существуещего', 16 , 1)
Rollback tran
end
go