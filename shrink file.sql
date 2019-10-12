--select count(*) from Common.Logs
--select count(*) from Common.LogsUser

--truncate table Common.Logs
--truncate table Common.LogsUser



USE MESPERpaper_DEV
go
SELECT file_id, name, size  
FROM sys.database_files;  
GO  
DBCC SHRINKFILE (1, TRUNCATEONLY); 
--
--SELECT name ,size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS AvailableSpaceInMB
--FROM sys.database_files;

DBCC SHRINKFILE(1,120)


--INIT inicia um novo backup, NOINIT acumula os backups em um arquivo só
BACKUP DATABASE MESPERpaper_DEV TO DISK='\\10.1.32.34\DbBackup\MES.BAK' WITH STATS = 10, INIT

-- TRANSACTION LOG
DBCC SHRINKFILE (MESPERPAPER_DEV_log, 10);
