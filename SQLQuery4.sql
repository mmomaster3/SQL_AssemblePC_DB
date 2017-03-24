USE AssemblePc
GO  
DECLARE @x decimal(20,4)
DECLARE @y decimal(20,4)

set @x = 2;

while @x < 9
	begin
	set @x = @x+1
		if @x > 4
		begin
			set @y = POWER(@x, 2) + 5.35
			select @y as 'Результат когда x>4'
		end
	else
		begin
			set @y = (SQRT(3*@x - 6.6))/(TAN(@x))
			select @y as 'Результат когда x<=4'
		end
	continue
	end		
