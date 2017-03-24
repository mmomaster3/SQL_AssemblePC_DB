use AssemblePc
go

	drop view view_PB_KPD, view_ClientNames, view_PB_Sercif, view_RAM, view_RAM6, view_ClientNames
	go

	Create view view_ClientNames
	as
	Select [Name]
	From Client
	go

	Create view view_PB_KPD
	as
	Select  PB.Producer ,KPD, RAM.[Type]
	From PB, RAM
	Where PB.PBID=RAM.RAMID 
	go

	create view view_PB_Sercif
	as
	Select  Producer, Sercif
	From PB
	Where Sercif like 'B%'
	go

	alter view view_ClientNames
	as
	Select [Name], [Surname]
	From Client
	Where [Name]='Матвей'
	go

	Create view view_RAM (Producer, V)
	as
	Select RAM.Producer, COUNT(*)
	From RAM
	Group by Producer
	go

	--6ЛАба
	create view view_RAM6
	as
	Select RAM.Producer, RAM.[Type]
	From RAM, PC
	Where pC.PCID=RAM.RAMID
	go

	create view view_CombinePC
	as
	select PB.Power, RAM.V, Processor.Freq, MotherBoard.Producer, GraphyCard.Memory, Drive.[V]
	from PB, RAM, Processor, MotherBoard, GraphyCard, Drive, PC
	where PC.DriveID=Drive.DriveID
	go

	select *
	from view_RAM6
	go

	create view view_PCtry
	as
	select AssembleDate as [Дата сборки], [Name] as [Имя компьютера], PB.Producer as [Производитель БП], PB.KPD as [КПД БП],
	PB.Sercif as [Сертификат БП], PB.Power as [Мощность БП], RAM.V as [Объем ОЗУ], RAM.Type as [Тип ОЗУ], MotherBoard.CellsForRAM as
	[Количество ячеек для ОЗУ], MotherBoard.ChipSet as [Чипсет], MotherBoard.PCIEx as [Количество разъемов PCIEx],
	MotherBoard.Producer as [Производитель МП], MotherBoard.Socket as [Сокет МП],
	MotherBoard.TypeRAM as [Тип ОЗУ МП], Processor.Core  as [Количество ядер процессора], Processor.Freq as [Частота процессора],
	Processor.Model as [Модель процессора],Processor.Producer as [Производитель процессора],
	Processor.Socket as [Сокет процессора], GraphyCard.Bus as [Размер шины ГП], GraphyCard.GPU as [ГП], GraphyCard.Memory as [Память ГП],
	GraphyCard.Producer as [Производитель ГП], GraphyCard.TypeOfMemory as [Тип памяти ГП], Drive.Producer as [Производитель Ж Диска],
	Drive.Speed as [Скорость Ж Диска], Drive.Type as [Тип Ж Диска], Drive.V as [Объем Ж Диска]
	from PC
	inner join PB on PC.PBID=PB.PBID
	inner join RAM on PC.RAMID=RAM.RAMID
	inner join MotherBoard on PC.MBID=MotherBoard.MBID
	inner join Processor on PC.ProcID=Processor.ProcID
	inner join GraphyCard on PC.GPID=GraphyCard.GPID
	inner join Drive on PC.DriveID=Drive.DriveID
	go
	--создание представления
	create view view_PCorder
	as
	select OrderDate as [Дата заказа], Client.Name as [Имя], Client.Surname as [Фамилия], PC.Name as [Название ПК]
	from PCOrder
	inner join Client on PCOrder.ClientID= Client.ClientID
	inner join PC on PCOrder.PCID=PC.PCID
	go


