insert into Security.Module values ('Troubleshooting', 1, GETUTCDATE(), 'System', 'TROUBLESHOOTING');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Level2 View',1,GETUTCDATE(),'System','LEVEL2_VIEW');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Classreason View',1,GETUTCDATE(),'System','CLASSREASON_VIEW');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Trouble View',1,GETUTCDATE(),'System','TROUBLE_VIEW');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Trouble Add',1,GETUTCDATE(),'System','TROUBLE_ADD');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Trouble Edit',1,GETUTCDATE(),'System','TROUBLE_EDIT');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Trouble Delete',1,GETUTCDATE(),'System','TROUBLE_DELETE');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Event View',1,GETUTCDATE(),'System','EVENT_VIEW');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Event Add',1,GETUTCDATE(),'System','EVENT_ADD');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Event Delete',1,GETUTCDATE(),'System','EVENT_DELETE');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Event Edit',1,GETUTCDATE(),'System','EVENT_EDIT');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Event Attach',1,GETUTCDATE(),'System','EVENT_ATTACH');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Event Approval',1,GETUTCDATE(),'System','EVENT_APPROVAL');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Unit View',1,GETUTCDATE(),'System','UNIT_VIEW');
insert into Security.Action values ((select top 1 IdModule from Security.Module where code = 'TROUBLESHOOTING'), 'Trouble Shooting Screen',1,GETUTCDATE(),'System','TROUBLESHOOTING_SCREEN');

  insert into Security.ProfileAction
  select p.IdProfile, a.IdAction
  from Security.Profile p,
  Security.Action a
  inner join Security.Module m on m.IdModule = a.IdModule
  where m.Code = 'TROUBLESHOOTING'

