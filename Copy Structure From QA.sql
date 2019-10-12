insert into [MESPERPAPER_DEV].[Common].[Level2]
SELECT [IdUnit]
      ,[Active]
      ,[Code]
      ,[Name]
      ,[Source]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Common].[Level2]
  GO

insert into [MESPERPAPER_DEV].[Common].[Level3]
SELECT [IdLevel2]
      ,[Code]
      ,[Name]
      ,[Active]
      ,[Source]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Common].[Level3]
GO

insert into [MESPERPAPER_DEV].[Common].[Equipment]
SELECT [IdLevel3]
      ,[Code]
      ,[Name]
      ,[Active]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
      ,[Source]
  FROM [QA].[MESPERPAPER_QAS].[Common].[Equipment]
GO

insert into Common.Archive values
(
	'imagem.jpg',
	0,
	0xFFD8FFE000104A46494600010101006000600000FFDB0043000201010201010202020202020202030503030303030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080001000103012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFCA28A2803FFD9,
	'Shermam.Miranda',
	'Shermam.Miranda',
	GETUTCDATE(),
	GETUTCDATE(),
	'data:image/jpeg;base64',
	631
)

INSERT INTO [MESPERPAPER_DEV].[Common].[Formula] VALUES
(
	''
	,0
	,GETUTCDATE()
	,GETUTCDATE()
	,'Shermam.Miranda'
	,'Shermam.Miranda'
	)
GO

insert into [MESPERPAPER_DEV].[Downtime].[Reason]
SELECT [IdGroup]
      ,[Code]
      ,[Name]
      ,[Active]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[Reason]
  where IdReason > (select max(IdReason) from [MESPERPAPER_DEV].[Downtime].[Reason])
GO

insert into [MESPERPAPER_DEV].[Downtime].[ReasonLocation]
SELECT [IdReason]
      ,[IdUnit]
      ,[IdLevel2]
      ,[IdLevel3]
      ,[IdEquipment]
      ,[IdStopCondition]
      ,[Active]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[ReasonLocation]
GO

insert into [MESPERPAPER_DEV].[Downtime].[SubEquipment]
SELECT [Source]
      ,[Active]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[SubEquipment]
GO

insert into [MESPERPAPER_DEV].[Downtime].[StopCondition]
SELECT [ProductionLineName]
      ,[Automatic]
      ,[Active]
      ,[IdLevel3]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[StopCondition]
GO

INSERT INTO [MESPERPAPER_DEV].[Downtime].[StopConditionEquipment]
SELECT [IdStopCondition]
      ,[IdEquipment]
      ,[Active]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[StopConditionEquipment]
GO

INSERT INTO [MESPERPAPER_DEV].[Downtime].[Formula]
SELECT [IdStopCondition]
      ,[EquationConfig]
      ,[TimeLatence]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[Formula]
GO

INSERT INTO [MESPERPAPER_DEV].[Downtime].[Event]
SELECT [IdKeyHistory]
      ,[IdStopCondition]
      ,[IdReason]
      ,[BeginDateTime]
      ,[EndDateTime]
      ,[Comment]
      ,[InsDateTime]
      ,[UpdDateTime]
      ,[UserCreated]
      ,[UserUpdated]
      ,[IdSubEquipament]
      ,[Approval]
      ,[StatusCreation]
  FROM [QA].[MESPERPAPER_QAS].[Downtime].[Event]
GO