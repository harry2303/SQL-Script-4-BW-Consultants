/*
Show own SQL history
*/
SELECT
     statement_string
     ,last_execution_timestamp
FROM SYS.M_SQL_PLAN_CACHE
WHERE user_name = CURRENT_USER
ORDER BY last_execution_timestamp DESC
;
/*
Provides error codes with descriptions.
SAP HANA includes a set of runtime views called monitoring views that provide actual SAP HANA runtime data.
The data in monitoring views is not stored on disk; it is calculated when you execute a query on one of the views.
20.04.2020 - Harald Schütt
*/
SELECT *
FROM M_ERROR_CODES -- Monitoring view
-- WHERE CODE = 1
ORDER BY CODE ASC
;
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
/*
Returns primary keys for schema and table specified
*/
SELECT *
FROM CONSTRAINTS
WHERE SCHEMA_NAME = 'SYSTEM'
	AND TABLE_NAME = 'BANKS'
;
/*
Provides information about accessible views for a given user.
System views allow you to query for various information about the system state using SQL commands.
System views are located in the SYS schema.
20.04.2020 - Harald Schütt
*/
SELECT *
FROM ACCESSIBLE_VIEWS -- System view
WHERE USER_NAME = CURRENT_USER
ORDER BY VIEW_NAME ASC
;
/*
Provides database information.
SAP HANA includes a set of runtime views called monitoring views that provide actual SAP HANA runtime data.
The data in monitoring views is not stored on disk; it is calculated when you execute a query on one of the views.
*/
SELECT *
FROM M_DATABASE -- Monitoring view
;
SELECT *
FROM M_SYSTEM_OVERVIEW -- Monitoring view
;

/*
Split HANA Version String --> Version & SP
*/
SELECT version, LEFT(version,1) VERSION, LEFT(SUBSTRING(version,6,7),2) SP FROM m_database
;
SELECT LEFT(version,1) || LEFT(SUBSTRING(version,6,7),2) shortversion FROM m_database
;

/*
"Who am i" query 
Returns the current user name at the current statement context.
20.04.2020 - Harald Schütt
*/
SELECT CURRENT_USER
FROM DUMMY
;


SELECT * from USERS where PASSWORD_CHANGE_TIME IS NULL;
/* User anpassen */
ALTER USER DEVELOP1 PASSWORD Develop1 NO FORCE_FIRST_PASSWORD_CHANGE; --Initpassword nicht ändern
ALTER USER DEVELOP1 VALID UNTIL '31.07.2020'; --Gültigkeit auf 31.07.2020 beschränken
ALTER USER DEVELOP1 PASSWORD Develop1 NO FORCE_FIRST_PASSWORD_CHANGE VALID UNTIL '31.07.2020';
