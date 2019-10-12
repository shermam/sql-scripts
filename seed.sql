declare @count int = 0;
declare @seed int = 1234;
declare @string varchar(256);

while @count < 1000000
begin
	set @count = @count + 1;

	exec usp_generateIdentifier 
		@seed = @seed output
		, @string = @string output;	

	insert into teste values (convert(varchar,@count) + '|' + @string);

end