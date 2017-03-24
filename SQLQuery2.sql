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
	Where [Name]='������'
	go

	Create view view_RAM (Producer, V)
	as
	Select RAM.Producer, COUNT(*)
	From RAM
	Group by Producer
	go

	--6����
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
	select AssembleDate as [���� ������], [Name] as [��� ����������], PB.Producer as [������������� ��], PB.KPD as [��� ��],
	PB.Sercif as [���������� ��], PB.Power as [�������� ��], RAM.V as [����� ���], RAM.Type as [��� ���], MotherBoard.CellsForRAM as
	[���������� ����� ��� ���], MotherBoard.ChipSet as [������], MotherBoard.PCIEx as [���������� �������� PCIEx],
	MotherBoard.Producer as [������������� ��], MotherBoard.Socket as [����� ��],
	MotherBoard.TypeRAM as [��� ��� ��], Processor.Core  as [���������� ���� ����������], Processor.Freq as [������� ����������],
	Processor.Model as [������ ����������],Processor.Producer as [������������� ����������],
	Processor.Socket as [����� ����������], GraphyCard.Bus as [������ ���� ��], GraphyCard.GPU as [��], GraphyCard.Memory as [������ ��],
	GraphyCard.Producer as [������������� ��], GraphyCard.TypeOfMemory as [��� ������ ��], Drive.Producer as [������������� � �����],
	Drive.Speed as [�������� � �����], Drive.Type as [��� � �����], Drive.V as [����� � �����]
	from PC
	inner join PB on PC.PBID=PB.PBID
	inner join RAM on PC.RAMID=RAM.RAMID
	inner join MotherBoard on PC.MBID=MotherBoard.MBID
	inner join Processor on PC.ProcID=Processor.ProcID
	inner join GraphyCard on PC.GPID=GraphyCard.GPID
	inner join Drive on PC.DriveID=Drive.DriveID
	go
	--�������� �������������
	create view view_PCorder
	as
	select OrderDate as [���� ������], Client.Name as [���], Client.Surname as [�������], PC.Name as [�������� ��]
	from PCOrder
	inner join Client on PCOrder.ClientID= Client.ClientID
	inner join PC on PCOrder.PCID=PC.PCID
	go


