/*
Lists available view columns. 
System views allow you to query for various information about the system state using SQL commands.
System views are located in the SYS schema.
20.04.2020 - Harald Schütt
*/
SELECT SCHEMA_NAME,
    VIEW_NAME, 
    POSITION, 
    COLUMN_NAME
FROM VIEW_COLUMNS --System View
WHERE VIEW_NAME = 'VIEW_COLUMNS' -- View name
ORDER BY POSITION ASC
;