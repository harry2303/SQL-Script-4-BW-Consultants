-- returns primary keys
-- for schema and table specified
SELECT *
FROM CONSTRAINTS
WHERE SCHEMA_NAME = 'SYSTEM'
	AND TABLE_NAME = 'BANKS';

