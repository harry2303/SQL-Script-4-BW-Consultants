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
--Split HANA Version String
SELECT version, LEFT(version,1) VERSION, LEFT(SUBSTRING(version,6,7),2) SP FROM m_database
;