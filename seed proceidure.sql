create procedure usp_generateIdentifier
    @minLen int = 1
    , @maxLen int = 256
    , @seed int output
    , @string varchar(8000) output
as
begin
    set nocount on;
    declare @length int;
    declare @alpha varchar(8000)
        , @digit varchar(8000)
        , @specials varchar(8000)
        , @first varchar(8000)
    declare @step bigint = rand(@seed) * 2147483647;

    select @alpha = 'qwertyuiopasdfghjklzxcvbnm'
        , @digit = '1234567890'
        , @specials = '_@# '
    select @first = @alpha + '_@';

    set  @seed = (rand((@seed+@step)%2147483647)*2147483647);

    select @length = @minLen + rand(@seed) * (@maxLen-@minLen)
        , @seed = (rand((@seed+@step)%2147483647)*2147483647);

    declare @dice int;
    select @dice = rand(@seed) * len(@first),
        @seed = (rand((@seed+@step)%2147483647)*2147483647);
    select @string = substring(@first, @dice, 1);

    while 0 < @length 
    begin
        select @dice = rand(@seed) * 100
            , @seed = (rand((@seed+@step)%2147483647)*2147483647);
        if (@dice < 10) -- 10% special chars
        begin
            select @dice = rand(@seed) * len(@specials)+1
                , @seed = (rand((@seed+@step)%2147483647)*2147483647);
            select @string = @string + substring(@specials, @dice, 1);
        end
        else if (@dice < 10+10) -- 10% digits
        begin
            select @dice = rand(@seed) * len(@digit)+1
                , @seed = (rand((@seed+@step)%2147483647)*2147483647);
            select @string = @string + substring(@digit, @dice, 1);
        end
        else -- rest 80% alpha
        begin
            declare @preseed int = @seed;
            select @dice = rand(@seed) * len(@alpha)+1
                , @seed = (rand((@seed+@step)%2147483647)*2147483647);

            select @string = @string + substring(@alpha, @dice, 1);
        end

        select @length = @length - 1;   
    end
end
go