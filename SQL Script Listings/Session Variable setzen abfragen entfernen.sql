/* SESSION Variablen setzen, abfragen, zurücksetzen */

/* Per SESSION_CONTEXT Funktion */
--session variable to override the system default datetime formats for the session
SET 'DATE_FORMAT' = 'YYYYMMDD';
--Abfrage einer session variable per session_context Funktion
--Returns the value of the specified session variable assigned to the current user
SELECT session_context('DATE_FORMAT') FROM dummy;
--session variable reset
UNSET 'DATE_FORMAT';


/* Per SQL Abfrage aus View M_SESSION_CONTEXT für die aktive Session */
--Aktuelle Connection-ID für aktive Session ermitteln
SELECT CURRENT_CONNECTION "current connid" FROM DUMMY;
-- Session Variable setzen
SET 'DATE_FORMAT' = 'YYYYMMDD';
--Abfrage session variable für Formate aus SYS.M_SESSION_CONTEXT für aktive Session
SELECT * FROM M_SESSION_CONTEXT WHERE key like '%FORMAT' AND connection_id = CURRENT_CONNECTION;
--Abfrage aller session variable aus SYS.M_SESSION_CONTEXT für aktive Session
SELECT * FROM M_SESSION_CONTEXT WHERE connection_id = CURRENT_CONNECTION;
--session variable zurücksetzen
UNSET 'DATE_FORMAT';