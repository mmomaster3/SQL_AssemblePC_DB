use master
go

drop database RestoreDB
go

create database RestoreDB
go


Backup DATABASE RestoreDB
TO DISK = 'D:\test.bak'
go

Backup DATABASE RestoreDB
Filegroup = 'PRIMARY'
TO DISK = 'D:\test.bak'
go

Backup DATABASE RestoreDB
TO DISK = 'D:\test_razn'
with differential
go

Backup log RestoreDB
TO DISK = 'D:\test_log'
with no_truncate, NORECOVERY
go

drop database RestoreDB
go

restore database RestoreDB
filegroup = 'PRIMARY'
FROM DISK = 'D:\test.bak'
with partial,recovery,replace
go

use AssemblePC
go

drop index index_Producer on Drive
drop index index_MB on MotherBoard
go

create NONCLUSTERED index index_Producer on Drive(Producer)
create index index_MB on MotherBoard(CellsForRAM)
go

