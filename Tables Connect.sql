--https://app.sqldbm.com/SQLServer/Share/uvGGaw16OslzdR0bIr_v7UGFrngIE8md_DYjF4jNYw0

create schema Troubleshooting
go

create schema Common
go

create schema Downtime
go

create schema SECURITY
go

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SECURITY].[UserRole]

CREATE TABLE [SECURITY].[UserRole]
(
 [Id]          uniqueidentifier NOT NULL ,
 [idRole]      int NULL ,
 [UserCode]    nvarchar(20) NOT NULL ,
 [ModuleCode]  nvarchar(20) NOT NULL ,
 [RoleCode]    nvarchar(20) NOT NULL ,
 [idUnit]      int NULL ,
 [idLevel2]    int NULL ,
 [idLevel3]    int NULL ,
 [idEquipment] int NULL ,
 [InsDatetime] datetimeoffset(7) NOT NULL ,
 [UpdDatetime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NOT NULL ,
 [UserUpdated] nvarchar(20) NOT NULL 

);
GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Troubleshooting].[Category]

CREATE TABLE [Troubleshooting].[Category]
(
 [idCategory]  int NOT NULL ,
 [Code]        nchar(10) NOT NULL ,
 [Name]        nchar(10) NOT NULL ,
 [Active]      nchar(10) NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NOT NULL ,
 [UserUpdated] nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([idCategory] ASC)
);
GO


-- ************************************** [Common].[Archive]

CREATE TABLE [Common].[Archive]
(
 [IdArchive]   int IDENTITY (1, 1) NOT NULL ,
 [Name]        varchar(255) NOT NULL ,
 [Active]      bit NOT NULL ,
 [Archive]     varbinary(max) NOT NULL ,
 [UserCreated] nvarchar(20) NULL ,
 [UserUpdated] nvarchar(20) NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [Header]      varchar(400) NOT NULL ,
 [Size]        bigint NOT NULL ,


 CONSTRAINT [PK_EventArchive] PRIMARY KEY CLUSTERED ([IdArchive] ASC)
);
GO




-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Downtime].[ClassReason]

CREATE TABLE [Downtime].[ClassReason]
(
 [IdClass]     int IDENTITY (1, 1) NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NULL ,
 [UserUpdated] nvarchar(20) NULL ,


 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([IdClass] ASC)
);
GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Common].[Formula]

CREATE TABLE [Common].[Formula]
(
 [IdFormula]      int IDENTITY (1, 1) NOT NULL ,
 [EquationConfig] nvarchar(1000) NOT NULL ,
 [TimeLatence]    int NULL ,
 [InsDateTime]    datetimeoffset(7) NOT NULL ,
 [UpdDateTime]    datetimeoffset(7) NOT NULL ,
 [UserCreated]    nvarchar(20) NULL ,
 [UserUpdated]    nvarchar(20) NULL ,


 CONSTRAINT [PK_Formula] PRIMARY KEY CLUSTERED ([IdFormula] ASC)
);
GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Downtime].[KeyHistory]

CREATE TABLE [Downtime].[KeyHistory]
(
 [IdKeyHistory] int IDENTITY (1, 1) NOT NULL ,
 [ShiftDate]    date NULL ,
 [ShiftNumber]  tinyint NULL ,
 [InsDateTime]  datetimeoffset(7) NOT NULL ,
 [UpdDateTime]  datetimeoffset(7) NOT NULL ,
 [UserCreated]  nvarchar(20) NULL ,
 [UserUpdated]  nvarchar(20) NULL ,


 CONSTRAINT [PK_KeyHistory] PRIMARY KEY CLUSTERED ([IdKeyHistory] ASC)
);
GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Common].[Logs]

CREATE TABLE [Common].[Logs]
(
 [Id]              int IDENTITY (1, 1) NOT NULL ,
 [Message]         nvarchar(max) NULL ,
 [MessageTemplate] nvarchar(max) NULL ,
 [Level]           nvarchar(128) NULL ,
 [TimeStamp]       datetimeoffset(7) NOT NULL ,
 [Exception]       nvarchar(max) NULL ,
 [LogEvent]        nvarchar(max) NULL ,
 [InsDateTime]     datetimeoffset(7) NOT NULL ,
 [User]            nchar(40) NULL ,
 [RemoteIpAddress] nvarchar(16) NULL ,
 [RequestPath]     nvarchar(max) NULL ,
 [Referer]         nvarchar(max) NULL ,
 [RequestMethod]   nchar(10) NULL ,
 [Elapsed]         int NULL ,


 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SECURITY].[Module]

CREATE TABLE [SECURITY].[Module]
(
 [idModule]     int NOT NULL ,
 [Code]         nvarchar(20) NULL ,
 [Name]         nvarchar(50) NOT NULL ,
 [Descritption] nvarchar(1000) NULL ,
 [Active]       bit NOT NULL ,
 [InsDatetime]  datetimeoffset(7) NOT NULL ,
 [UpdDatetime]  datetimeoffset(7) NOT NULL ,
 [UserCreated]  nvarchar(20) NOT NULL ,
 [UserUpdated]  nvarchar(20) NOT NULL 

);
GO



-- ************************************** [Common].[LogsUser]

CREATE TABLE [Common].[LogsUser]
(
 [Id]              int IDENTITY (1, 1) NOT NULL ,
 [Message]         nvarchar(max) NULL ,
 [Level]           nvarchar(128) NULL ,
 [TimeStamp]       datetimeoffset(7) NOT NULL ,
 [Exception]       nvarchar(max) NULL ,
 [LogEvent]        nvarchar(max) NULL ,
 [InsDateTime]     datetimeoffset(7) NOT NULL ,
 [User]            nchar(40) NULL ,
 [RemoteIpAddress] nvarchar(16) NULL ,
 [RequestPath]     nvarchar(max) NULL ,
 [Referer]         nvarchar(max) NULL ,
 [RequestMethod]   nchar(10) NULL ,
 [Elapsed]         int NULL ,


 CONSTRAINT [PK_LogsUser] PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO



-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SECURITY].[ObjectLocation]

CREATE TABLE [SECURITY].[ObjectLocation]
(
 [idObjectLocation] int NOT NULL ,
 [idRoleObject]     int NULL ,
 [IdUnit]           int NULL ,
 [IdLevel2]         int NULL ,
 [IdLevel3]         int NULL ,
 [idEquipment]      int NULL ,
 [Active]           bit NOT NULL ,
 [InsDatetime]      datetimeoffset(7) NOT NULL ,
 [UpdDatetime]      datetimeoffset(7) NOT NULL ,
 [UserCreated]      nvarchar(20) NOT NULL ,
 [UserUpdated]      nvarchar(20) NOT NULL 

);
GO



-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SECURITY].[Role]

CREATE TABLE [SECURITY].[Role]
(
 [idRole]      int NOT NULL ,
 [idModule]    int NOT NULL ,
 [RoleCode]    nvarchar(20) NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDatetime] datetimeoffset(7) NOT NULL ,
 [UpdDatetime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NOT NULL ,
 [UserUpdated] nvarchar(20) NOT NULL 

);
GO



-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [SECURITY].[RoleObject]

CREATE TABLE [SECURITY].[RoleObject]
(
 [idRoleObject] int NOT NULL ,
 [idRole]       int NOT NULL ,
 [ObjectName]   nvarchar(50) NOT NULL ,
 [isGroup]      bit NULL ,
 [Active]       bit NOT NULL ,
 [InsDatetime]  datetimeoffset(7) NOT NULL ,
 [UpdDatetime]  datetimeoffset(7) NOT NULL ,
 [UserCreated]  nvarchar(20) NOT NULL ,
 [UserUpdated]  nvarchar(20) NOT NULL 

);
GO





-- ************************************** [SECURITY].[RoleAction]

CREATE TABLE [SECURITY].[RoleAction]
(
 [idRoleAction] int IDENTITY (1, 1) NOT NULL ,
 [idRole]       int NOT NULL ,
 [ActionCode]   nvarchar(30) NOT NULL ,
 [InsDatetime]  datetimeoffset(7) NOT NULL ,
 [UpdDatetime]  datetimeoffset(7) NOT NULL ,
 [UserCreated]  nvarchar(20) NOT NULL ,
 [UserUpdated]  nvarchar(20) NOT NULL 

);
GO



-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Common].[Server]

CREATE TABLE [Common].[Server]
(
 [IdServer]    int IDENTITY (1, 1) NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [IpAddress]   nvarchar(15) NOT NULL ,
 [URLCode]     nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Description] nvarchar(1000) NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(10) NULL ,
 [UserUpdated] nvarchar(10) NULL ,


 CONSTRAINT [PK_Server] PRIMARY KEY CLUSTERED ([IdServer] ASC)
);
GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Downtime].[SubEquipment]

CREATE TABLE [Downtime].[SubEquipment]
(
 [IdSubEquipament] int IDENTITY (1, 1) NOT NULL ,
 [Source]          nvarchar(420) NOT NULL ,
 [Active]          bit NOT NULL ,
 [InsDateTime]     datetimeoffset(7) NOT NULL ,
 [UpdDateTime]     datetimeoffset(7) NOT NULL ,
 [UserCreated]     nvarchar(20) NULL ,
 [UserUpdated]     nvarchar(20) NULL ,


 CONSTRAINT [PK_SubEquipament] PRIMARY KEY CLUSTERED ([IdSubEquipament] ASC)
);
GO



-- ************************************** [Downtime].[GroupReason]

CREATE TABLE [Downtime].[GroupReason]
(
 [IdGroup]     int IDENTITY (1, 1) NOT NULL ,
 [IdClass]     int NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NULL ,
 [UserUpdated] nvarchar(20) NULL ,


 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED ([IdGroup] ASC),
 CONSTRAINT [FK_Group_Class] FOREIGN KEY ([IdClass])  REFERENCES [Downtime].[ClassReason]([IdClass])
);
GO


CREATE NONCLUSTERED INDEX [IX_GroupReason_IdClass] ON [Downtime].[GroupReason] 
 (
  [IdClass] ASC
 )

GO


-- ************************************** [Downtime].[Reason]

CREATE TABLE [Downtime].[Reason]
(
 [IdReason]    int IDENTITY (1, 1) NOT NULL ,
 [IdGroup]     int NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NULL ,
 [UserUpdated] nvarchar(20) NULL ,


 CONSTRAINT [PK_Reason] PRIMARY KEY CLUSTERED ([IdReason] ASC),
 CONSTRAINT [FK_Reason_Group] FOREIGN KEY ([IdGroup])  REFERENCES [Downtime].[GroupReason]([IdGroup])
);
GO


CREATE NONCLUSTERED INDEX [IX_Reason_IdGroup] ON [Downtime].[Reason] 
 (
  [IdGroup] ASC
 )

GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Common].[Unit]

CREATE TABLE [Common].[Unit]
(
 [IdUnit]      int IDENTITY (1, 1) NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(10) NULL ,
 [UserUpdated] nvarchar(10) NULL ,
 [IdServer]    int NULL ,


 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED ([IdUnit] ASC),
 CONSTRAINT [FK_Unit_Server] FOREIGN KEY ([IdServer])  REFERENCES [Common].[Server]([IdServer])
);
GO





-- ************************************** [Common].[Level2]

CREATE TABLE [Common].[Level2]
(
 [IdLevel2]    int IDENTITY (1, 1) NOT NULL ,
 [IdUnit]      int NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [Active]      bit NOT NULL ,
 [UserCreated] nvarchar(10) NOT NULL ,
 [UserUpdated] nvarchar(10) NOT NULL ,
 [Code]        nvarchar(20) NULL ,
 [Name]        nvarchar(50) NULL ,
 [UpdDateTime] datetimeoffset(7) NULL ,
 [Source]      nvarchar(420) NULL ,


 CONSTRAINT [PK_Level2] PRIMARY KEY CLUSTERED ([IdLevel2] ASC),
 CONSTRAINT [FK_Level_Unit] FOREIGN KEY ([IdUnit])  REFERENCES [Common].[Unit]([IdUnit])
);
GO


CREATE NONCLUSTERED INDEX [IX_Level2_IdUnit] ON [Common].[Level2] 
 (
  [IdUnit] ASC
 )

GO




-- ************************************** [Common].[Level3]

CREATE TABLE [Common].[Level3]
(
 [IdLevel3]    int IDENTITY (1, 1) NOT NULL ,
 [IdLevel2]    int NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NULL ,
 [UserUpdated] nvarchar(20) NULL ,
 [Source]      nvarchar(420) NULL ,


 CONSTRAINT [PK_Level3] PRIMARY KEY CLUSTERED ([IdLevel3] ASC),
 CONSTRAINT [FK_Level2_Level3] FOREIGN KEY ([IdLevel2])  REFERENCES [Common].[Level2]([IdLevel2])
);
GO


CREATE NONCLUSTERED INDEX [IX_Level3_IdLevel2] ON [Common].[Level3] 
 (
  [IdLevel2] ASC
 )

GO





-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Downtime].[StopCondition]

CREATE TABLE [Downtime].[StopCondition]
(
 [IdStopCondition]    int IDENTITY (1, 1) NOT NULL ,
 [ProductionLineName] nvarchar(100) NOT NULL ,
 [Automatic]          bit NOT NULL ,
 [Active]             bit NOT NULL ,
 [InsDateTime]        datetimeoffset(7) NOT NULL ,
 [UpdDateTime]        datetimeoffset(7) NOT NULL ,
 [UserCreated]        nvarchar(20) NOT NULL ,
 [UserUpdated]        nvarchar(20) NOT NULL ,
 [IdLevel3]           int NOT NULL CONSTRAINT [DF_StopCondition_IdLevel3] DEFAULT ((0)) ,


 CONSTRAINT [PK_StopCondition] PRIMARY KEY CLUSTERED ([IdStopCondition] ASC),
 CONSTRAINT [FK_StopCondition_Level3_IdLevel3] FOREIGN KEY ([IdLevel3])  REFERENCES [Common].[Level3]([IdLevel3])
);
GO


CREATE NONCLUSTERED INDEX [IX_StopCondition_IdLevel3] ON [Downtime].[StopCondition] 
 (
  [IdLevel3] ASC
 )

GO





-- ************************************** [Troubleshooting].[Trouble]

CREATE TABLE [Troubleshooting].[Trouble]
(
 [idTrouble]   int NOT NULL ,
 [IdFormula]   int NULL ,
 [idCategory]  int NOT NULL ,
 [Code]        nvarchar(20) NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Description] nvarchar(1000) NULL ,
 [IdUnit]      int NULL ,
 [IdLevel2]    int NULL ,
 [IdLevel3]    int NULL ,
 [IdEquipment] int NULL ,
 [IsLostTime]  bit NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NOT NULL ,
 [UserUpdated] nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_Trouble] PRIMARY KEY CLUSTERED ([idTrouble] ASC),
 CONSTRAINT [FK_Trouble_Category] FOREIGN KEY ([idCategory])  REFERENCES [Troubleshooting].[Category]([idCategory]),
 CONSTRAINT [FK_Trouble_Formula] FOREIGN KEY ([IdFormula])  REFERENCES [Common].[Formula]([IdFormula])
);
GO







CREATE TABLE [Troubleshooting].[Cause]
(
 [idCause]     int NOT NULL ,
 [idTrouble]   int NOT NULL ,
 [IdFormula]   int NULL ,
 [Code]        nvarchar(20) NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Description] nvarchar(1000) NULL ,
 [Priority]    int NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NOT NULL ,
 [UserUpdated] nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_Cause] PRIMARY KEY CLUSTERED ([idCause] ASC),
 CONSTRAINT [FK_Cause_Formula] FOREIGN KEY ([IdFormula])  REFERENCES [Common].[Formula]([IdFormula]),
 CONSTRAINT [FK_Cause_Trouble] FOREIGN KEY ([idTrouble])  REFERENCES [Troubleshooting].[Trouble]([idTrouble])
);
GO




-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Troubleshooting].[Correction]

CREATE TABLE [Troubleshooting].[Correction]
(
 [idCorrection] int NOT NULL ,
 [idCause]      int NOT NULL ,
 [IdArchive]    int NULL ,
 [Code]         nvarchar(20) NULL ,
 [Name]         nvarchar(50) NOT NULL ,
 [Description]  nvarchar(1000) NULL ,
 [Priority]     int NULL ,
 [Active]       bit NOT NULL ,
 [InsDateTime]  datetimeoffset(7) NOT NULL ,
 [UpdDateTime]  datetimeoffset(7) NOT NULL ,
 [UserCreated]  nvarchar(20) NOT NULL ,
 [UserUpdated]  nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_Correction] PRIMARY KEY CLUSTERED ([idCorrection] ASC),
 CONSTRAINT [FK_Correction_Archive] FOREIGN KEY ([IdArchive])  REFERENCES [Common].[Archive]([IdArchive]),
 CONSTRAINT [FK_Correction_Cause] FOREIGN KEY ([idCause])  REFERENCES [Troubleshooting].[Cause]([idCause])
);
GO

-- ************************************** [Common].[Equipment]

CREATE TABLE [Common].[Equipment]
(
 [IdEquipment] int IDENTITY (1, 1) NOT NULL ,
 [IdLevel3]    int NOT NULL ,
 [Code]        nvarchar(20) NOT NULL ,
 [Name]        nvarchar(50) NOT NULL ,
 [Active]      bit NOT NULL ,
 [InsDateTime] datetimeoffset(7) NOT NULL ,
 [UpdDateTime] datetimeoffset(7) NOT NULL ,
 [UserCreated] nvarchar(20) NULL ,
 [UserUpdated] nvarchar(20) NULL ,
 [Source]      nvarchar(420) NULL ,


 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED ([IdEquipment] ASC),
 CONSTRAINT [FK_Equipment_Level2] FOREIGN KEY ([IdLevel3])  REFERENCES [Common].[Level3]([IdLevel3])
);
GO


CREATE UNIQUE NONCLUSTERED INDEX [UK_Machine_Code] ON [Common].[Equipment] 
 (
  [Code] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_Equipment_IdLevel3] ON [Common].[Equipment] 
 (
  [IdLevel3] ASC
 )

GO


-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Troubleshooting].[Event]

CREATE TABLE [Troubleshooting].[Event]
(
 [IdEvent]       int NOT NULL ,
 [IdArchive]     int NULL ,
 [idTrouble]     int NULL ,
 [Description]   nvarchar(1000) NULL ,
 [EventDateTime] datetimeoffset(7) NOT NULL ,
 [IdUnit]        int NULL ,
 [IdLevel2]      int NULL ,
 [IdLevel3]      int NULL ,
 [IdEquipment]   int NULL ,
 [Active]        bit NOT NULL ,
 [InsDateTime]   datetimeoffset(7) NOT NULL ,
 [UpdDateTime]   datetimeoffset(7) NOT NULL ,
 [UserCreated]   nvarchar(20) NOT NULL ,
 [UserUpdated]   nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([IdEvent] ASC),
 CONSTRAINT [FK_Event_Archive] FOREIGN KEY ([IdArchive])  REFERENCES [Common].[Archive]([IdArchive]),
 CONSTRAINT [FK_Event_Trouble] FOREIGN KEY ([idTrouble])  REFERENCES [Troubleshooting].[Trouble]([idTrouble])
);
GO


-- ************************************** [Downtime].[Event]

CREATE TABLE [Downtime].[Event]
(
 [IdEvent]         int IDENTITY (1, 1) NOT NULL ,
 [IdKeyHistory]    int NULL ,
 [IdStopCondition] int NOT NULL ,
 [IdReason]        int NULL ,
 [BeginDateTime]   datetimeoffset(7) NOT NULL ,
 [EndDateTime]     datetimeoffset(7) NULL ,
 [Comment]         nvarchar(1000) NULL ,
 [InsDateTime]     datetimeoffset(7) NOT NULL ,
 [UpdDateTime]     datetimeoffset(7) NOT NULL ,
 [UserCreated]     nvarchar(20) NOT NULL ,
 [UserUpdated]     nvarchar(20) NOT NULL ,
 [IdSubEquipament] int NULL ,
 [Approval]        bit NOT NULL ,
 [StatusCreation]  int NOT NULL ,


 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([IdEvent] ASC),
 CONSTRAINT [FK_Event_KeyHistory_IdKeyHistory] FOREIGN KEY ([IdKeyHistory])  REFERENCES [Downtime].[KeyHistory]([IdKeyHistory]),
 CONSTRAINT [FK_Event_Reason_IdReason] FOREIGN KEY ([IdReason])  REFERENCES [Downtime].[Reason]([IdReason]),
 CONSTRAINT [FK_Event_StopCondition_IdStopCondition] FOREIGN KEY ([IdStopCondition])  REFERENCES [Downtime].[StopCondition]([IdStopCondition]),
 CONSTRAINT [FK_Event_SubEquipment_IdSubEquipament] FOREIGN KEY ([IdSubEquipament])  REFERENCES [Downtime].[SubEquipment]([IdSubEquipament])
);
GO


CREATE NONCLUSTERED INDEX [IX_Event_IdKeyHistory] ON [Downtime].[Event] 
 (
  [IdKeyHistory] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_Event_IdReason] ON [Downtime].[Event] 
 (
  [IdReason] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_Event_IdStopCondition] ON [Downtime].[Event] 
 (
  [IdStopCondition] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_Event_IdSubEquipament] ON [Downtime].[Event] 
 (
  [IdSubEquipament] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Downtime].[Formula]

CREATE TABLE [Downtime].[Formula]
(
 [IdFormula]       int IDENTITY (1, 1) NOT NULL ,
 [IdStopCondition] int NOT NULL ,
 [EquationConfig]  nvarchar(1000) NOT NULL ,
 [TimeLatence]     int NULL ,
 [InsDateTime]     datetimeoffset(7) NOT NULL ,
 [UpdDateTime]     datetimeoffset(7) NOT NULL ,
 [UserCreated]     nvarchar(20) NULL ,
 [UserUpdated]     nvarchar(20) NULL ,


 CONSTRAINT [PK_Formula] PRIMARY KEY CLUSTERED ([IdFormula] ASC),
 CONSTRAINT [FK_Formula_StopCondition_IdStopCondition] FOREIGN KEY ([IdStopCondition])  REFERENCES [Downtime].[StopCondition]([IdStopCondition])
);
GO


CREATE UNIQUE NONCLUSTERED INDEX [IX_Formula_IdStopCondition] ON [Downtime].[Formula] 
 (
  [IdStopCondition] ASC
 )

GO




-- ************************************** [Downtime].[EventArchive]

CREATE TABLE [Downtime].[EventArchive]
(
 [IdEventArchive] int IDENTITY (1, 1) NOT NULL ,
 [IdEvent]        int NOT NULL ,
 [Name]           varchar(255) NOT NULL ,
 [Active]         bit NOT NULL ,
 [Archive]        varbinary(max) NOT NULL ,
 [UserCreated]    nvarchar(20) NULL ,
 [UserUpdated]    nvarchar(20) NULL ,
 [InsDateTime]    datetimeoffset(7) NOT NULL ,
 [UpdDateTime]    datetimeoffset(7) NOT NULL ,
 [Header]         varchar(400) NOT NULL ,
 [Size]           bigint NOT NULL ,


 CONSTRAINT [PK_EventArchive] PRIMARY KEY CLUSTERED ([IdEventArchive] ASC),
 CONSTRAINT [FK_EventArchive_Event_IdEvent] FOREIGN KEY ([IdEvent])  REFERENCES [Downtime].[Event]([IdEvent])
);
GO


CREATE UNIQUE NONCLUSTERED INDEX [IX_EventArchive_IdEvent] ON [Downtime].[EventArchive] 
 (
  [IdEvent] ASC
 )

GO


-- ************************************** [Downtime].[ReasonLocation]

CREATE TABLE [Downtime].[ReasonLocation]
(
 [IdReasonLocation] int IDENTITY (1, 1) NOT NULL ,
 [IdReason]         int NOT NULL ,
 [IdUnit]           int NULL ,
 [IdLevel2]         int NULL ,
 [IdLevel3]         int NULL ,
 [IdEquipment]      int NULL ,
 [Active]           bit NOT NULL ,
 [InsDateTime]      datetimeoffset(7) NOT NULL ,
 [UpdDateTime]      datetimeoffset(7) NOT NULL ,
 [UserCreated]      nvarchar(20) NULL ,
 [UserUpdated]      nvarchar(20) NULL ,
 [IdStopCondition]  int NULL ,


 CONSTRAINT [PK_CodeMachine] PRIMARY KEY CLUSTERED ([IdReasonLocation] ASC),
 CONSTRAINT [FK_ReasonLocation_Equipment] FOREIGN KEY ([IdEquipment])  REFERENCES [Common].[Equipment]([IdEquipment]),
 CONSTRAINT [FK_ReasonLocation_Level2] FOREIGN KEY ([IdLevel2])  REFERENCES [Common].[Level2]([IdLevel2]),
 CONSTRAINT [FK_ReasonLocation_Level3] FOREIGN KEY ([IdLevel3])  REFERENCES [Common].[Level3]([IdLevel3]),
 CONSTRAINT [FK_ReasonLocation_Reason] FOREIGN KEY ([IdReason])  REFERENCES [Downtime].[Reason]([IdReason]),
 CONSTRAINT [FK_ReasonLocation_StopCondition_IdStopCondition] FOREIGN KEY ([IdStopCondition])  REFERENCES [Downtime].[StopCondition]([IdStopCondition]),
 CONSTRAINT [FK_ReasonLocation_Unit] FOREIGN KEY ([IdUnit])  REFERENCES [Common].[Unit]([IdUnit])
);
GO


CREATE NONCLUSTERED INDEX [IX_ReasonLocation_IdEquipment] ON [Downtime].[ReasonLocation] 
 (
  [IdEquipment] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_ReasonLocation_IdLevel2] ON [Downtime].[ReasonLocation] 
 (
  [IdLevel2] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_ReasonLocation_IdLevel3] ON [Downtime].[ReasonLocation] 
 (
  [IdLevel3] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_ReasonLocation_IdReason] ON [Downtime].[ReasonLocation] 
 (
  [IdReason] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_ReasonLocation_IdStopCondition] ON [Downtime].[ReasonLocation] 
 (
  [IdStopCondition] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_ReasonLocation_IdUnit] ON [Downtime].[ReasonLocation] 
 (
  [IdUnit] ASC
 )

GO




-- ************************************** [Troubleshooting].[SolveCause]

CREATE TABLE [Troubleshooting].[SolveCause]
(
 [idSolveCause] int NOT NULL ,
 [IdEvent]      int NOT NULL ,
 [idCause]      int NULL ,
 [Description]  nvarchar(1000) NULL ,
 [Active]       bit NOT NULL ,
 [InsDateTime]  datetimeoffset(7) NOT NULL ,
 [UpdDateTime]  datetimeoffset(7) NOT NULL ,
 [UserCreated]  nvarchar(20) NOT NULL ,
 [UserUpdated]  nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_SolveCause] PRIMARY KEY CLUSTERED ([idSolveCause] ASC),
 CONSTRAINT [FK_SolveCause_Cause] FOREIGN KEY ([idCause])  REFERENCES [Troubleshooting].[Cause]([idCause]),
 CONSTRAINT [FK_SolveCause_Event] FOREIGN KEY ([IdEvent])  REFERENCES [Troubleshooting].[Event]([IdEvent])
);
GO




-- ************************************** [Troubleshooting].[SolveCorrection]

CREATE TABLE [Troubleshooting].[SolveCorrection]
(
 [IdSolveCorrection] int NOT NULL ,
 [idSolveCause]      int NOT NULL ,
 [idCorrection]      int NULL ,
 [Description]       nvarchar(1000) NULL ,
 [Active]            bit NOT NULL ,
 [InsDateTime]       datetimeoffset(7) NOT NULL ,
 [UpdDateTime]       datetimeoffset(7) NOT NULL ,
 [UserCreated]       nvarchar(20) NOT NULL ,
 [UserUpdated]       nvarchar(20) NOT NULL ,


 CONSTRAINT [PK_SolveCorrection] PRIMARY KEY CLUSTERED ([IdSolveCorrection] ASC),
 CONSTRAINT [FK_SolveCorrection_Correction] FOREIGN KEY ([idCorrection])  REFERENCES [Troubleshooting].[Correction]([idCorrection]),
 CONSTRAINT [FK_SolveCorrection_SolveCause] FOREIGN KEY ([idSolveCause])  REFERENCES [Troubleshooting].[SolveCause]([idSolveCause])
);
GO


-- ************************************** [Downtime].[StopConditionEquipment]

CREATE TABLE [Downtime].[StopConditionEquipment]
(
 [IdStopConditionEquipment] int IDENTITY (1, 1) NOT NULL ,
 [IdStopCondition]          int NOT NULL ,
 [IdEquipment]              int NOT NULL ,
 [Active]                   bit NOT NULL ,
 [InsDateTime]              datetimeoffset(7) NOT NULL ,
 [UpdDateTime]              datetimeoffset(7) NOT NULL ,
 [UserCreated]              nvarchar(20) NULL ,
 [UserUpdated]              nvarchar(20) NULL ,


 CONSTRAINT [PK_StopConditionEquipment] PRIMARY KEY CLUSTERED ([IdStopConditionEquipment] ASC),
 CONSTRAINT [FK_StopConditionEquipment_Equipment_IdEquipment] FOREIGN KEY ([IdEquipment])  REFERENCES [Common].[Equipment]([IdEquipment]),
 CONSTRAINT [FK_StopConditionEquipment_StopCondition_IdStopCondition] FOREIGN KEY ([IdStopCondition])  REFERENCES [Downtime].[StopCondition]([IdStopCondition])
);
GO


CREATE NONCLUSTERED INDEX [IX_StopConditionEquipment_IdEquipment] ON [Downtime].[StopConditionEquipment] 
 (
  [IdEquipment] ASC
 )

GO

CREATE NONCLUSTERED INDEX [IX_StopConditionEquipment_IdStopCondition] ON [Downtime].[StopConditionEquipment] 
 (
  [IdStopCondition] ASC
 )

GO




