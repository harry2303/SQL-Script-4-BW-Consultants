SELECT schema_name,
       table_name,
       column_name,
       position,
       data_type_name,
       length
 FROM table_columns
WHERE schema_name = 'SYS'
  AND table_name = 'DUMMY'
ORDER BY position ASC;

