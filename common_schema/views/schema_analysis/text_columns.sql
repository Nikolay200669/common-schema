-- 
-- Textual columns charsets & collations
-- 
CREATE OR REPLACE
ALGORITHM = MERGE
SQL SECURITY INVOKER
VIEW text_columns AS
  SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    COLUMN_NAME, 
    COLUMN_TYPE,
    CHARACTER_SET_NAME, 
    COLLATION_NAME
  FROM 
    INFORMATION_SCHEMA.COLUMNS
  WHERE 
    TABLE_SCHEMA NOT IN ('mysql', 'INFORMATION_SCHEMA', 'performance_schema')
    AND CHARACTER_SET_NAME IS NOT NULL
    AND DATA_TYPE != 'enum'
    AND DATA_TYPE != 'set'
;