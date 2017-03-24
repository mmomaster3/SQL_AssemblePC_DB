
--create database AssemblePc;
use AssemblePc;
go
SET NAMES utf8
--drop database AssemblePc;
----drop table PCOrder, Client, PC, PB, RAM, Processor, MotherBoard, GraphyCard, Drive;
----go
create table Client
	([ClientID] bigint primary key identity(1,1) NOT NULL,
	[tel] nvarchar(20) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Surname] nvarchar(50) NOT NULL);

create table PB
	([PBID] bigint primary key identity(1,1) NOT NUll,
	[Producer] nvarchar(50),
	[KPD] int NOT NULL,
	[Sercif] nvarchar(20) NOT NULL,
	[Power] int NOT NULL,);

create table RAM
	([RAMID] bigint primary key identity(1,1) NOT NULL,
	[V] int NOT NULL,
	[Type] nvarchar(10) NOT NULL,
	[Producer] nvarchar(50) NOT NULL,);

create table Processor
	([ProcID] bigint primary key identity(1,1) NOT NULL,
	[Model] nvarchar(50) NOT NULL,
	[Freq] float NOT NULL,
	[Producer] nvarchar(50) NOT NULL,
	[Core] int NOT NULL,
	[Socket] nvarchar(50) NOT NULL); 

create table MotherBoard
	([MBID] bigint primary key identity(1,1) NOT NULL,
	[CellsForRAM] int NOT NULL,
	[Producer] nvarchar(50) NOT NULL,
	[ChipSet] nvarchar(50) NOT NULL,
	[TypeRAM] nvarchar(50) NOT NULL,
	[PCIEx] int NOT NULL,
	[Socket] nvarchar(50) NOT NULL);

create table GraphyCard
	([GPID] bigint primary key identity(1,1) NOT NULL,
	[Producer] nvarchar(50) NOT NULL,
	[Memory] int NOT NULL,
	[TypeOfMemory] nvarchar(50) NOT NULL,
	[Bus] int NOT NULL,
	[GPU] nvarchar(5) NOT NULL);

create table Drive
	([DriveID] bigint primary key identity(1,1) NOT NULL,
	[Producer] nvarchar(50) NOT NULL,
	[V] int NOT NULL,
	[Speed] int NOT NULL,
	[Type] nvarchar(50) NOT NULL);
	
	create table PC
	([PCID] bigint primary key identity(1,1) NOT NULL,
	[AssembleDate] datetime NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[PBID] bigint  NOT NUll foreign key references PB([PBID]),
	[RAMID] bigint NOT NULL foreign key references RAM([RAMID]),
	[ProcID] bigint NOT NULL foreign key references Processor([ProcID]),
	[MBID] bigint NOT NULL foreign key references MotherBoard([MBID]),
	[GPID] bigint NOT NULL foreign key references GraphyCard([GPID]),
	[DriveID] bigint NOT NULL foreign key references Drive([DriveID]));
	
	insert into Drive([Producer], [V], [Speed], [Type])
	values('Transcent', 1000, 300, 'HDD')
	insert into GraphyCard([Producer], [Memory], [TypeOfMemory], [Bus], [GPU])
	values('Nvidia', 2, 'GDDR5', 512, '9500')
	insert into MotherBoard([CellsForRAM], [Producer], [ChipSet], [TypeRAM], [PCIEx], [Socket])
	values(4, 'Intel', 'Oli2', 'DDR3', 2, 'ISO506')
	insert into Processor([Model], [Freq], [Producer], [Core], [Socket])
	values('i5 4200M', 2.5, 'Intel', 4, 'ISO506')
	insert into RAM(Producer, [Type], V)
	values ('Samsung', 'DDR3', 4)
	insert into PB(KPD, [Power], Producer, Sercif)
	values (20, 500, 'Corsar', 'Silver')

	Insert into PC(AssembleDate, [Name]	, [PBID], [RAMID], [ProcID], [MBID], [GPID], [DriveID])
	Values ('1998-01-02', 'Матвей',	1, 1, 1, 1, 1, 1);
	
	Insert into PC(AssembleDate, [Name]	, [PBID], [RAMID], [ProcID], [MBID], [GPID], [DriveID])
	Values ('2010-10-12', 'Олег',	2, 2, 2, 2, 2, 2);


	Create table PCOrder
	([OrderID] bigint primary key identity(1,1) NOT NULL,
	[OrderDate] datetime NOT NULL,
	[ClientID] bigint NOT NULL foreign key references Client([ClientID]),
	[PCID] bigint NOT NULL foreign key references PC([PCID]),
	constraint check_date check (OrderDate between '28.01.2016' and '28.01.2018'));
	go

	Insert into [Client]([tel], [Name], [Surname])
	Values ('+375-29-121-34-87', 'Матвей','Кривицкий');
	Insert into [Client]([tel], [Name], [Surname])
	Values ('+375-29-534-76-29', 'Алексей','Рубаник');
	Insert into [Client]([tel], [Name], [Surname])
	Values ('+375-29-148-49-39', 'Рома','Корж');

	insert into PB(KPD, [Power], Producer, Sercif)
	values (20, 500, 'Corsar', 'Silver')
	insert into PB(KPD, [Power], Producer, Sercif)
	values (90, 600, 'LTD', 'Gold')
	insert into PB(KPD, [Power], Producer, Sercif)
	values (20, 500, 'Razer', 'Bronze')
	insert into PB(KPD, [Power], Producer, Sercif)
	values (81, 500, 'Opar', 'Bronze')

	insert into RAM(Producer, [Type], V)
	values ('Samsung', 'DDR3', 4)
	insert into RAM(Producer, [Type], V)
	values ('Transcend', 'DDR3', 8)
	insert into RAM(Producer, [Type], V)
	values ('Kingston', 'DDR4', 4)
	insert into RAM(Producer, [Type], V)
	values ('OCZ', 'DDR2', 2)
	insert into RAM(Producer, [Type], V)
	values ('Corsair', 'DDR3', 1)
	insert into RAM(Producer, [Type], V)
	values ('Samsung', 'DDR1', 4)
	insert into RAM(Producer, [Type], V)
	values ('Samsung', 'DDR3', 16)
