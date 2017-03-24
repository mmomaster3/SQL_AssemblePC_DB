use AssemblePc
go

alter function Func ()
Returns real
as
Begin
	Declare @Result real
	Select @Result=SUM(V)
	from RAM
	Return @Result
End
go

select dbo.Func() as 'Сумма'
go

alter function Func2 ()
Returns real
as
Begin
	Declare @Result real
	Select @Result=AVG(V)+AVG(KPD)
	from RAM, PB
	Return @Result
End
go

select dbo.Func2() as 'Среднее'
go

alter function Func3 ()
Returns real
as
Begin
	Declare @Result real
	Select @Result=Count(V)-Count(KPD)
	from RAM, PB
	Return @Result
End
go

select dbo.Func3() as 'Количество'
go

alter function Func4 ()
Returns real
as
Begin
	Declare @Result real
	SELECT @Result=RAM.Producer
	FROM RAM, PB
	WHERE RAM.RAMID = PB.PBID 
	GRoup by RAM.Producer
	HAVING MAX(V) > 6;
	Return @Result
End
go

select dbo.Func4() as 'Максимальный'
go

alter function Func5 ()
Returns real
as
Begin
	Declare @Result real
	Select @Result = min(V) + min(KPD)
	from RAM, PB
	Return @Result
End
go

select dbo.Func5() as 'минимальный'
go

alter function Func6(@Name nvarchar(50))
returns table
as
return
(
	select [PCID], [AssembleDate], [Name], PB.Producer, [Type]
	from PC, PB, RAM
	where PC.RAMID=RAM.RAMID and pc.PBID=PB.PBID and PC.[Name]= @Name
)
go

select * from dbo.Func6('Матвей')
go