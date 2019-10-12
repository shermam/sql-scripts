USE MESPERPAPER_DEV
GO

declare @ammount int = 100;
declare @now datetime = getutcdate();
declare @count int = 0;

declare @countStopCondition int = (select count(*) from Downtime.StopCondition where Active = 1);
declare @countReason int = (select count(*) from Downtime.Reason where Active = 1);
declare @countSubEquipment int = (select count(*) from Downtime.SubEquipment where Active = 1);

declare @StopConditions table (id int, num int); 
declare @Reasons table (id int, num int);
declare @SubEquipments table (id int, num int);

insert into @StopConditions
select IdStopCondition, ROW_NUMBER() over(order by IdStopCondition) from Downtime.StopCondition where Active = 1;

insert into @Reasons
select IdReason, ROW_NUMBER() over(order by IdReason) from Downtime.Reason where Active = 1;

insert into @SubEquipments
select IdSubEquipament, ROW_NUMBER() over(order by IdSubEquipament) from Downtime.SubEquipment where Active = 1;

while @count < @ammount
begin

	declare @finalTime datetime = dateadd(HOUR, -@count, @now);
	INSERT INTO Downtime.Event
			   (IdKeyHistory
			   ,IdStopCondition
			   ,IdReason
			   ,BeginDateTime
			   ,EndDateTime
			   ,Comment
			   ,InsDateTime
			   ,UpdDateTime
			   ,UserCreated
			   ,UserUpdated
			   ,IdSubEquipament
			   ,Approval
			   ,StatusCreation)
		 VALUES
			   (NULL
			   ,(select id from @StopConditions where num = (@count % @countStopCondition) + 1)
			   ,(select id from @Reasons where num = (@count % @countReason) + 1)
			   ,dateadd(MINUTE, -30, @finalTime)
			   ,@finalTime
			   ,'TESTE'
			   ,GETUTCDATE()
			   ,GETUTCDATE()
			   ,'Shermam.Miranda'
			   ,'Shermam.Miranda'
			   ,(select id from @SubEquipments where num = (@count % @countSubEquipment) + 1)
			   ,0
			   ,(@count % 3));

	set @count = @count + 1;
end
