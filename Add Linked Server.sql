EXEC master.dbo.sp_addlinkedserver   
	@server = N'QA',
	@provider = N'sqlncli',
    @datasrc = N'10.1.8.16',   
    @srvproduct=N'';	
GO  

EXEC master.dbo.sp_addlinkedsrvlogin
	@rmtsrvname = N'QA',
	@useself = 'false',
	@rmtuser = 'mesadmin',
	@rmtpassword = 'ZpGzEKU2';
GO