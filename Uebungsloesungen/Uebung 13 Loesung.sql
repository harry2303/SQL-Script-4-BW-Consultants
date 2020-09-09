-- Übung 13: Exit Handler für eigene Fehlercodes und Logging
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
DROP PROCEDURE PROCERR;
--Procedure mit EXIT HANDLER Block, eigenem Fehlercode und INSERT in ERROR_LOG Tabelle
--CREATE OR REPLACE PROCEDURE PROCERR (IN iv_val INTEGER, OUT outtab TABLE(I INTEGER) ) --not on BWE[HNA]
CREATE PROCEDURE PROCERR (IN iv_val INTEGER, OUT outtab TABLE(I INTEGER) )
AS 
BEGIN
    DECLARE invalid_value CONDITION FOR SQL_ERROR_CODE 10000;
    DECLARE EXIT HANDLER FOR SQL_ERROR_CODE 10000
    BEGIN     
    DECLARE lv_id INT = 0;
    SELECT MYSEQUENCE.nextval INTO lv_id FROM dummy;
    --Datensatz in ERROR_LOG Tabelle einfügen
    INSERT INTO ERROR_LOG VALUES ( 
      :lv_id,
      CURRENT_TIMESTAMP,
      ::SQL_ERROR_CODE, 
      ::SQL_ERROR_MESSAGE );
    END;
--Auslösen des Fehlercodes 10000
SIGNAL SQL_ERROR_CODE 10000 SET MESSAGE_TEXT = 'Ungültiger Wert'; 
outtab = SELECT 1/:iv_val AS I FROM dummy;
END;

--Aufruf der Procedure mit fehlerauslösendem Wert
CALL PROCERR(0, outtab => ?);