-- Übung 16: Wiederholung - Anlegen einer Procedure
-- Musterlösungen für alle Teilaufgaben der Übung
/*************************************************************/
--Lösungsvorschlag:
CREATE OR REPLACE PROCEDURE PROC_BANKS (
            IN iv_bic VARCHAR(11) DEFAULT 'RABODEFFTAR',
            OUT ot_result BANKS --Type: Table banks
            )
LANGUAGE SQLSCRIPT
SQL SECURITY DEFINER    --The default value for procedures is DEFINER
--READS SQL DATA        --The procedure is read-only: no update, delete or insert is possible  
AS
BEGIN 
/* Write your procedure logic */

-- DECLARE & INITIALIZE VARIABLE
DECLARE lv_bic VARCHAR(11) = 'RABODEFFTAR';

--Werte aus IN Parametern in lokale Variablen übernehmen
lv_bic = :iv_bic;

-- RETURN RESULT
ot_result = SELECT * FROM banks WHERE bic = :lv_bic;
END;


-- Aufruf der Procedure mit IN und OUT Parametern (hier: OUT Parameter gebunden an Konsolenausgabe)
-- Neuen Datensatz erzeugen --> Param. ID = NULL
CALL PROC_BANKS('RABODEFFTAR', ot_result => ?);
