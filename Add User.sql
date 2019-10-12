insert into Security.Profile values ('ADMIN',1,GETUTCDATE(),GETUTCDATE(),'System','System');

 insert into Security.ProfileAction
  select p.IdProfile, a.IdAction
  from Security.Profile p,
  Security.Action a

declare @user varchar(200) = 'Shermam.Miranda';

insert into Security.Account values (@user, @user, 0, 1, GETUTCDATE(),GETUTCDATE(),@user,@user);

insert into Security.AccountProfileLocation values ((select top 1 IdAccount from Security.Account where Name = @user),1,NULL,NULL,NULL,NULL);

insert into Security.AccountProfileLocation 
select (select top 1 IdAccount from Security.Account where Name = @user),1,IdUnit,NULL,NULL,NULL from Common.Unit;

