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