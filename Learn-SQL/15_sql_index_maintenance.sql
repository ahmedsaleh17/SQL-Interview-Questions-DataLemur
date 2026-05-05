-- switch database 
USE CarrefourOLTP ; 

-- List all indexes on a specific table 
-- Display indexes information by using a special stored procedures 

sp_helpindex 'transactions' 

/*
-- Monitoring Index Usage --
	- Sys System Schema 
	   contains metadata about database tables, views, indexes 

	- Dynamic Management View (DMV)
		provides real-time insights about DataBase performance and system health 
*/

SELECT
	tbl.name AS TableName,
	idx.name AS IndexName, 
	idx.type_desc AS IndexType, 
	is_primary_key AS IsPrimaryKey, 
	is_unique AS IsUnique,
	is_disabled AS IsDisabled,
	s.user_seeks AS UserSeeks, 
	s.user_scans AS UserScans, 
	s.user_lookups AS UserLookups, 
	s.user_updates AS userUpdates, 
	COALESCE(s.last_user_seek, s.last_user_scan) LastUpdate
FROM sys.indexes idx
JOIN sys.tables tbl
ON idx.object_id = tbl.object_id
LEFT JOIN sys.dm_db_index_usage_stats s
ON idx.object_id = s.object_id 
AND idx.index_id = s.index_id
WHERE tbl.name = 'transactions'
ORDER BY TABLENAME, IndexName


SP_HELPINDEX 'TRANSACTIONS'
