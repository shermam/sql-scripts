declare @FORCE_NULLABLES VARCHAR(3) = 'YES';

declare @TABLES_TO_SEED TABLE
(
	TABLE_SCHEMA VARCHAR(200),
	TABLE_NAME VARCHAR(200),
	SEED_NUM INT
);

INSERT INTO @TABLES_TO_SEED VALUES
('Troubleshooting','Category', 20),
('Troubleshooting', 'Trouble', 20),
('Troubleshooting', 'Cause', 20),
('Troubleshooting', 'Correction', 30),
('Troubleshooting', 'Event', 100),
('Troubleshooting', 'SolveCause', 100),
('Troubleshooting', 'SolveCorrection', 100);

declare @DEFAULT_VALUES TABLE
(
	COLUMN_NAME VARCHAR(200),
	DEFAULT_VALUE VARCHAR(200)
);

INSERT INTO @DEFAULT_VALUES VALUES
('InsDateTime','GETUTCDATE()'),
('UpdDateTime', 'GETUTCDATE()'),
('UserCreated', '''Shermam.Miranda'''),
('UserUpdated', '''Shermam.Miranda'''),
('Code', '''Teste Code'''),
('Description', '''Teste Description'''),
--('EventDateTime', '@dateTime'),
('EventDateTime', 'GETUTCDATE()'),
('SolveDateTime','GETUTCDATE()'),
('IsLostTime', '0'),
('Name', '''Teste Name'''),
('Active', '1'),
('Priority', '1');

declare @REFERENCES TABLE
(
	TABLE_SCHEMA VARCHAR(200),
	TABLE_NAME VARCHAR(200),
	COLUMN_NAME VARCHAR(200),
	REFERENCED_SCHEMA VARCHAR(200),
	REFERENCED_TABLE VARCHAR(200),
	REFERENCED_COLUMN VARCHAR(200)
);

INSERT INTO @REFERENCES
    SELECT DISTINCT
	SCH.NAME AS [TABLE_SCHEMA],
    TAB1.NAME AS [TABLE],
    COL1.NAME AS [COLUMN], 
	SCH2.NAME AS [REFERENCED_SCHEMA],
    TAB2.NAME AS [REFERENCED_TABLE], 
    COL2.NAME AS [REFERENCED_COLUMN]
FROM SYS.FOREIGN_KEY_COLUMNS FKC 
INNER JOIN SYS.OBJECTS OBJ 
    ON OBJ.OBJECT_ID = FKC.CONSTRAINT_OBJECT_ID 
INNER JOIN SYS.TABLES TAB1 
    ON TAB1.OBJECT_ID = FKC.PARENT_OBJECT_ID 
INNER JOIN SYS.SCHEMAS SCH 
    ON TAB1.SCHEMA_ID = SCH.SCHEMA_ID 
INNER JOIN SYS.COLUMNS COL1 
    ON COL1.COLUMN_ID = PARENT_COLUMN_ID AND COL1.OBJECT_ID = TAB1.OBJECT_ID 
INNER JOIN SYS.TABLES TAB2 
    ON TAB2.OBJECT_ID = FKC.REFERENCED_OBJECT_ID 
INNER JOIN SYS.SCHEMAS SCH2
    ON TAB2.SCHEMA_ID = SCH2.SCHEMA_ID 
INNER JOIN SYS.COLUMNS COL2 
    ON COL2.COLUMN_ID = REFERENCED_COLUMN_ID AND COL2.OBJECT_ID = TAB2.OBJECT_ID
INNER JOIN @TABLES_TO_SEED SEED
	ON TAB1.name = SEED.TABLE_NAME AND SCH.name = SEED.TABLE_SCHEMA;

--DECLARE @TABLE_COUNTS TABLE
--(
--	TABLE_NAME VARCHAR(200),
--	TABLE_COUNT INT
--)

--INSERT INTO @TABLE_COUNTS
--SELECT
--      SCHEMA_NAME(sOBJ.schema_id) + '.' + sOBJ.name AS [TableName]
--      , SUM(sPTN.Rows) AS [RowCount]
--FROM 
--      sys.objects AS sOBJ
--      INNER JOIN sys.partitions AS sPTN
--            ON sOBJ.object_id = sPTN.object_id
--WHERE
--      sOBJ.type = 'U'
--      AND sOBJ.is_ms_shipped = 0x0
--      AND index_id < 2 -- 0:Heap, 1:Clustered
--GROUP BY 
--      sOBJ.schema_id
--      , sOBJ.name
--ORDER BY [TableName];

declare tables_cursor cursor
for SELECT * FROM @TABLES_TO_SEED;

open tables_cursor;

while 1=1
begin
	declare @count int = 0;
	declare @now datetime = getutcdate();
	declare @SEED_NUM INT;

	declare @TABLE_SCHEMA VARCHAR(200);
	declare @TABLE_NAME VARCHAR(200);

	FETCH NEXT FROM tables_cursor   
	INTO @TABLE_SCHEMA, @TABLE_NAME, @SEED_NUM;
	
	IF @@FETCH_STATUS <> 0
	break;

	while @count < @SEED_NUM
	begin

		declare @COLUMN_NAMES VARCHAR(MAX) = '';
		declare @VALUE_STATEMENT VARCHAR(MAX) = '';
		declare @STATEMENT VARCHAR(MAX) = '';
	
		declare columns_cursor cursor
		for select C.COLUMN_NAME, C.DATA_TYPE, C.IS_NULLABLE
		from INFORMATION_SCHEMA.COLUMNS C
		LEFT OUTER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE K
		ON K.TABLE_SCHEMA = C.TABLE_SCHEMA AND K.TABLE_NAME = C.TABLE_NAME AND K.COLUMN_NAME = C.COLUMN_NAME
		LEFT OUTER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS TC
		ON TC.CONSTRAINT_NAME = K.CONSTRAINT_NAME
		WHERE (TC.CONSTRAINT_TYPE <> 'PRIMARY KEY' OR TC.CONSTRAINT_TYPE IS NULL)
		AND C.TABLE_SCHEMA = @TABLE_SCHEMA
		AND C.TABLE_NAME = @TABLE_NAME;

		SET @STATEMENT = 'INSERT INTO ' + @TABLE_SCHEMA + '.' + @TABLE_NAME;

		open columns_cursor;

		while 1=1
		begin
			declare @COLUMN_NAME varchar(200);
			declare @DATA_TYPE varchar(200);
			declare @IS_NULLABLE varchar(200);
			declare @VALUE_TEXT varchar(MAX);

			FETCH NEXT FROM columns_cursor   
			INTO @COLUMN_NAME, @DATA_TYPE, @IS_NULLABLE;

			IF @FORCE_NULLABLES = 'YES'
				SET @IS_NULLABLE = 'NO';

			SET @VALUE_TEXT = '''0''';

			IF @@FETCH_STATUS <> 0
			break;

			select @VALUE_TEXT = DEFAULT_VALUE 
			from @DEFAULT_VALUES
			where COLUMN_NAME = @COLUMN_NAME;

			DECLARE @COUNT_REFERENCES INT = (
				SELECT COUNT(*) 
				FROM @REFERENCES R 
				WHERE R.TABLE_SCHEMA = @TABLE_SCHEMA
				AND R.TABLE_NAME = @TABLE_NAME
				AND R.COLUMN_NAME = @COLUMN_NAME
			);

			IF (@VALUE_TEXT IS NULL OR @VALUE_TEXT = '''0''') AND @COUNT_REFERENCES = 1
			BEGIN
			
				IF @IS_NULLABLE = 'YES'
				BEGIN
					SET @VALUE_TEXT = 'NULL';
				END
				ELSE 
				BEGIN


					DECLARE @REFERENCED_SCHEMA VARCHAR(200);
					DECLARE @REFERENCED_TABLE VARCHAR(200);
					DECLARE @REFERENCED_COLUMN VARCHAR(200);
			
					SELECT 
					@REFERENCED_SCHEMA = r.REFERENCED_SCHEMA,
					@REFERENCED_TABLE = r.REFERENCED_TABLE,
					@REFERENCED_COLUMN = r.REFERENCED_COLUMN
					FROM @REFERENCES R 
					WHERE R.TABLE_SCHEMA = @TABLE_SCHEMA
					AND R.TABLE_NAME = @TABLE_NAME
					AND R.COLUMN_NAME = @COLUMN_NAME;

					declare @count_reference VARCHAR(1000) = '(SELECT COUNT(*) FROM '+@REFERENCED_SCHEMA+'.'+@REFERENCED_TABLE+')';

					DECLARE @COMAND VARCHAR(2000) = 
					'(select TOP 1 id from
					(select
					'+@REFERENCED_COLUMN+' as id, 
					ROW_NUMBER() over(order by '+@REFERENCED_COLUMN+') num 
					from '+@REFERENCED_SCHEMA+'.'+@REFERENCED_TABLE+') T
					where num = ('+CONVERT(VARCHAR,@count)+' % '+@count_reference+') + 1)';

					SET @VALUE_TEXT = @COMAND;
				END
			END

			IF @VALUE_TEXT IS NULL 
			BEGIN
				IF @IS_NULLABLE = 'NO'
					SET @VALUE_TEXT = '''0''';
				ELSE
					SET @VALUE_TEXT = 'NULL';
			END


			SET @VALUE_STATEMENT = @VALUE_STATEMENT + IIF(@VALUE_STATEMENT = '','',', ') + @VALUE_TEXT;
			SET @COLUMN_NAMES = @COLUMN_NAMES + IIF(@COLUMN_NAMES = '','',', ') + @COLUMN_NAME;
		end
	
		CLOSE columns_cursor;  
		DEALLOCATE columns_cursor; 
	
		--print @STATEMENT + ' (' + @COLUMN_NAMES + ') VALUES (' + @VALUE_STATEMENT + ');';
		print @STATEMENT +' VALUES (' + @VALUE_STATEMENT + ');';

		set @count = @count + 1;
	end
end

CLOSE tables_cursor;  
DEALLOCATE tables_cursor; 