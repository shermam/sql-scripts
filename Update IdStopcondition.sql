update e
set e.IdStopCondition = s.IdStopCondition
from Troubleshooting.Event e
inner join Downtime.StopConditionEquipment s
on e.IdEquipment = s.IdEquipment 
and 
(
	select count(*) 
	from Downtime.StopConditionEquipment 
	where IdEquipment = s.IdEquipment
) = 1;

update e
set e.IdStopCondition = s.IdStopCondition
from Troubleshooting.Event e
inner join Downtime.StopCondition s
on e.IdLevel3 = s.IdLevel3
and e.IdEquipment is null
left join Downtime.StopConditionEquipment se
on se.IdStopCondition = s.IdStopCondition
where se.IdStopConditionEquipment is null;