create schema Troubleshooting
go

create schema Common
go

CREATE TABLE [Common].[Server](
	[IdServer] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[IpAddress] [nvarchar](15) NOT NULL,
	[URLCode] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[UpdDateTime] [datetimeoffset](7) NOT NULL,
	[UserCreated] [nvarchar](10) NULL,
	[UserUpdated] [nvarchar](10) NULL,
 CONSTRAINT [PK_Server] PRIMARY KEY CLUSTERED 
(
	[IdServer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [Common].[Unit](
	[IdUnit] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[UpdDateTime] [datetimeoffset](7) NOT NULL,
	[UserCreated] [nvarchar](10) NULL,
	[UserUpdated] [nvarchar](10) NULL,
	[IdServer] [int] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[IdUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Server] FOREIGN KEY([IdServer])
REFERENCES [Common].[Server] ([IdServer])
GO

ALTER TABLE [Common].[Unit] CHECK CONSTRAINT [FK_Unit_Server]
GO

CREATE TABLE [Common].[Level2](
	[IdLevel2] [int] IDENTITY(1,1) NOT NULL,
	[IdUnit] [int] NOT NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[UserCreated] [nvarchar](10) NOT NULL,
	[UserUpdated] [nvarchar](10) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[UpdDateTime] [datetimeoffset](7) NULL,
	[Source] [nvarchar](420) NULL,
 CONSTRAINT [PK_Level2] PRIMARY KEY CLUSTERED 
(
	[IdLevel2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[Level2]  WITH CHECK ADD  CONSTRAINT [FK_Level_Unit] FOREIGN KEY([IdUnit])
REFERENCES [Common].[Unit] ([IdUnit])
GO

ALTER TABLE [Common].[Level2] CHECK CONSTRAINT [FK_Level_Unit]
GO

CREATE TABLE [Common].[Level3](
	[IdLevel3] [int] IDENTITY(1,1) NOT NULL,
	[IdLevel2] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[UpdDateTime] [datetimeoffset](7) NOT NULL,
	[UserCreated] [nvarchar](20) NULL,
	[UserUpdated] [nvarchar](20) NULL,
	[Source] [nvarchar](420) NULL,
 CONSTRAINT [PK_Level3] PRIMARY KEY CLUSTERED 
(
	[IdLevel3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[Level3]  WITH CHECK ADD  CONSTRAINT [FK_Level2_Level3] FOREIGN KEY([IdLevel2])
REFERENCES [Common].[Level2] ([IdLevel2])
GO

ALTER TABLE [Common].[Level3] CHECK CONSTRAINT [FK_Level2_Level3]
GO


CREATE TABLE [Common].[Equipment](
	[IdEquipment] [int] IDENTITY(1,1) NOT NULL,
	[IdLevel3] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[UpdDateTime] [datetimeoffset](7) NOT NULL,
	[UserCreated] [nvarchar](20) NULL,
	[UserUpdated] [nvarchar](20) NULL,
	[Source] [nvarchar](420) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[IdEquipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Level2] FOREIGN KEY([IdLevel3])
REFERENCES [Common].[Level3] ([IdLevel3])
GO

ALTER TABLE [Common].[Equipment] CHECK CONSTRAINT [FK_Equipment_Level2]
GO


CREATE TABLE [Common].[Archive](
	[IdArchive] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[Archive] [varbinary](max) NOT NULL,
	[UserCreated] [nvarchar](20) NULL,
	[UserUpdated] [nvarchar](20) NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[UpdDateTime] [datetimeoffset](7) NOT NULL,
	[Header] [varchar](400) NOT NULL,
	[Size] [bigint] NOT NULL,
 CONSTRAINT [PK_EventArchive] PRIMARY KEY CLUSTERED 
(
	[IdArchive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) 
GO


CREATE TABLE [Common].[Formula](
	[IdFormula] [int] IDENTITY(1,1) NOT NULL,
	[EquationConfig] [nvarchar](1000) NOT NULL,
	[TimeLatence] [int] NULL,
	[InsDateTime] [datetimeoffset](7) NOT NULL,
	[UpdDateTime] [datetimeoffset](7) NOT NULL,
	[UserCreated] [nvarchar](20) NULL,
	[UserUpdated] [nvarchar](20) NULL,
 CONSTRAINT [PK_Formula] PRIMARY KEY CLUSTERED 
(
	[IdFormula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [Troubleshooting].[Category]
(
 [IdCategory]  int NOT NULL ,
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

CREATE TABLE [Troubleshooting].[Trouble]
(
 [IdTrouble]   int NOT NULL ,
 [IdFormula]   int NULL ,
 [IdCategory]  int NOT NULL ,
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
 [IdCause]     int NOT NULL ,
 [IdTrouble]   int NOT NULL ,
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


CREATE TABLE [Troubleshooting].[Correction]
(
 [IdCorrection] int NOT NULL ,
 [IdCause]      int NOT NULL ,
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


CREATE TABLE [Troubleshooting].[Event]
(
 [IdEvent]       int NOT NULL ,
 [IdArchive]     int NULL ,
 [IdTrouble]     int NULL ,
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

CREATE TABLE [Troubleshooting].[SolveCause]
(
 [IdSolveCause] int NOT NULL ,
 [IdEvent]      int NOT NULL ,
 [IdCause]      int NULL ,
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
 [IdSolveCause]      int NOT NULL ,
 [IdCorrection]      int NULL ,
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